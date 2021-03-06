`include "constants.svh"
module CPU #(
            parameter IMPLEMENT_LIKELY
        ) (
           input clk,
           input reset,

           output [31:0] inst_sram_addr,
           output inst_sram_readen,
           input [31:0] inst_sram_rdata,
           input inst_sram_valid,
           input inst_sram_addressError,
           input inst_sram_tlb_miss,
           input inst_sram_tlb_invalid,
           input inst_sram_tlb_ready,
           output cache_op inst_cache_op,
           input inst_cache_op_valid,

           output data_sram_vaddr_valid,
           output [31:0] data_sram_vaddr,
           output data_sram_read,
           output data_sram_write,
           output [31:0] data_sram_wdata,
           output [2:0] data_sram_size,
           input [31:0] data_sram_rdata,
           input data_sram_valid,
           output [3:0] data_sram_byteen,
           output cache_op data_cache_op,
           input data_cache_op_valid,
           output data_sram_tlb,
           input data_sram_addressError,
           input data_sram_tlb_miss,
           input data_sram_tlb_invalid,
           input data_sram_tlb_modified,
           output data_sram_va_hold,

           input mem_idle,

           output [31:0] debug_wb_pc,
           output [3:0] debug_wb_rf_wen,
           output [4:0] debug_wb_rf_wnum,
           output [31:0] debug_wb_rf_wdata,
           output [31:0] debug_wb_instr,
           output [31:0] debug_i_pc,
           output [31:0] debug_i_instr,

           output cp0_we,
           output cp0_number_t cp0_number,
           output [31:0] cp0_wdata,
           input [31:0] cp0_rdata,

           input [31:0] cp0_epc,
           input [31:0] cp0_exc_handler,
           input [31:0] cp0_int_handler,
           input [31:0] cp0_tlb_refill_handler,

           output cp0_en_exp,
           output cp0_ewr_bd,
           output ExcCode_t cp0_ewr_excCode,
           output [31:0] cp0_ewr_epc,
           output [31:0] cp0_ewr_badVAddr,

           input cp0_interrupt_pending,
           input cp0_privileged,

           output tlb_op_t tlb_op
       );

wire D_data_waiting;
wire E_data_waiting;
wire M_data_waiting;

const bit [4:0] l_None = 0, l_F = 5'b00001, l_D = 5'b00011, l_E = 5'b00111, l_M = 5'b01111, l_W = 5'b11111;
const int m_F = 0, m_D = 1, m_E = 2, m_M = 3, m_W = 4;

logic [4:0] stallLevel;
always_comb begin
    stallLevel = l_None;
    if (D_data_waiting) begin
        stallLevel = l_D;
    end
    if (E_data_waiting) begin
        stallLevel = l_E;
    end
end

logic [4:0] exceptionLevel;
logic F_exception;
logic D_exception;
logic E_exception;
logic M_exception;

always_comb begin
    exceptionLevel = l_None;
    if (F_exception) begin
        exceptionLevel = l_F;
    end
    if (D_exception) begin
        exceptionLevel = l_D;
    end
    if (E_exception) begin
        exceptionLevel = l_E;
    end
    if (M_exception) begin
        exceptionLevel = l_M;
    end
end

logic exceptionJump;
logic [31:0] exceptionJumpAddr;

// Forwarding logic:
// If forward source is non-zero, it means that a value to be written is already in the pipeline
// which is either available or non-available.
// If the value to be read is not available (e.g. to be read from memory), we set valid flag to zero. This means
// a data hazard, and a bubble should be inserted to the pipeline.
// Otherwise the data is forwarded, and no stalling is created.

wire forwardValidE;
wire [4:0] forwardAddressE;
wire [31:0] forwardValueE;

// From ALU, in Memory
wire forwardValidM;
wire [4:0] forwardAddressM;
wire [31:0] forwardValueM;

// ======== Fetch Stage ========
logic F_jump;
logic [31:0] F_jumpAddr;

InstructionMemory F_im (
                      .clk(clk),
                      .reset(reset),

                      .absJump(!stallLevel[m_F] && F_jump), // Don't jump when stalled
                      .absJumpAddress(F_jumpAddr),

                      .stall(stallLevel[m_F]),
                      .exception(exceptionLevel[m_D]),
                      .fetchException(F_exception),

                      .inst_sram_rdata(inst_sram_rdata),
                      .inst_sram_addr(inst_sram_addr),
                      .inst_sram_readen(inst_sram_readen),
                      .inst_sram_valid(inst_sram_valid),
                      .inst_sram_addressError(inst_sram_addressError),
                      .inst_sram_tlb_miss(inst_sram_tlb_miss),
                      .inst_sram_tlb_invalid(inst_sram_tlb_invalid),
                      .inst_sram_tlb_ready
                  );

logic [31:0] F_badVAddr;
logic F_tlb_refill;
ExcCode_t F_excCode;
always_comb begin
    F_exception = 0;
    F_excCode = cNone;
    F_badVAddr = 'bx;
    F_tlb_refill = 0;
    if (F_im.outputPC[1:0] != 2'b0 || F_im.inst_sram_addressError_o) begin
        F_exception = 1;
        F_excCode = cAdEL;
        F_badVAddr = F_im.outputPC;
    end else if (F_im.inst_sram_tlb_miss_o || F_im.inst_sram_tlb_invalid_o) begin
        F_exception = 1;
        F_excCode = cTLBL;
        F_badVAddr = F_im.outputPC;
        F_tlb_refill = F_im.inst_sram_tlb_miss_o;
    end
end
wire F_insert_bubble = F_im.bubble_o;

Decoder #(.IMPLEMENT_LIKELY(IMPLEMENT_LIKELY)) F_dec (
    .instruction(F_im.instruction),
    .reset(reset),
    .bubble(F_im.bubble_o)
);

assign debug_i_pc = F_im.bubble_o ? 0 : F_im.outputPC;
assign debug_i_instr = F_im.instruction;

// ======== Decode Stage ========
wire D_stall = stallLevel[m_D];
reg D_last_bubble;
wire D_insert_bubble = D_last_bubble || D_data_waiting;
ControlSignals D_ctrl;
reg [31:0] D_pc;
reg [31:0] D_instr; // WARNING: for debug purpose only, do not use in logic. To add new functionality, change decoder.
reg D_isDelaySlot;
ExcCode_t D_last_excCode;
reg [31:0] D_badVAddr;
logic [31:0] D_badVAddr_next;
reg D_last_exception;
reg D_tlb_refill;

reg D_last_likely_failed;
logic D_last_likely_failed_next;

always @(posedge clk) begin
    if (reset) begin
        D_last_bubble <= 1;
        D_last_exception <= 0;
        D_pc <= 0;
        D_isDelaySlot <= 0;
        D_badVAddr <= 0;
        D_ctrl <= kControlNop;
        D_last_likely_failed <= 0;
        D_tlb_refill <= 0;
        D_instr <= 0;
    end
    else begin
        if (!D_stall) begin
            D_badVAddr <= F_badVAddr;
            D_isDelaySlot <= F_im.isDelaySlot;
            D_last_exception <= F_exception;
            D_last_excCode <= F_excCode;
            D_pc <= F_im.outputPC;
            D_instr <= F_im.instruction;
            D_last_bubble <= F_insert_bubble || exceptionLevel[m_D] || D_last_likely_failed_next;
            D_ctrl <= (F_insert_bubble || exceptionLevel[m_D] || D_last_likely_failed_next || F_exception) ? kControlNop : F_dec.controls;
            D_last_likely_failed <= F_insert_bubble ? D_last_likely_failed_next : 0;
            D_tlb_refill <= F_tlb_refill;
        end else begin
            D_last_bubble <= D_last_bubble || exceptionLevel[m_E];
            D_ctrl <= (D_last_bubble || exceptionLevel[m_E]) ? kControlNop : D_ctrl;
        end
    end
end

reg [4:0] grfWriteAddress;
reg [31:0] grfWriteData;
GeneralRegisterFile D_grf(
                        .clk(clk),
                        .reset(reset),
                        .writeData(grfWriteData),
                        .writeAddress(grfWriteAddress), // set to 0 if no write operation shall be performed

                        .readAddress1(D_ctrl.regRead1),
                        .readAddress2(D_ctrl.regRead2),
                        .debugPC(debug_wb_pc)
                    );

ForwardController D_regRead1_forward (
                      .request(D_ctrl.regRead1),
                      .original(D_grf.readOutput1),
                      .enabled(D_ctrl.aluCtrl != `aluDisabled || D_ctrl.absJump || D_ctrl.branch || D_ctrl.calculateAddress || D_ctrl.bitCounterEnable || D_ctrl.move),

                      .src1Valid(forwardValidE),
                      .src1Reg(forwardAddressE),
                      .src1Value(forwardValueE),
                      .src2Valid(forwardValidM),
                      .src2Reg(forwardAddressM),
                      .src2Value(forwardValueM)
                  );

ForwardController D_regRead2_forward (
                      .request(D_ctrl.regRead2),
                      .original(D_grf.readOutput2),
                      .enabled(D_ctrl.absJump || D_ctrl.branch || D_ctrl.aluCtrl != `aluDisabled || D_ctrl.move),

                      .src1Valid(forwardValidE),
                      .src1Reg(forwardAddressE),
                      .src1Value(forwardValueE),
                      .src2Valid(forwardValidM),
                      .src2Reg(forwardAddressM),
                      .src2Value(forwardValueM)
                  );

assign D_data_waiting = D_regRead1_forward.stallExec || D_regRead2_forward.stallExec;
wire [31:0] D_memAddress = D_regRead1_forward.value + D_ctrl.immediate;
wire D_dcache_active = D_ctrl.memDCacheOp != CACHE_NOP;
wire D_icache_active = D_ctrl.memICacheOp != CACHE_NOP;
wire D_memAddress_valid = D_ctrl.memStore || D_ctrl.memLoad || D_icache_active || D_dcache_active;
wire D_moveDisable = D_ctrl.move && !(D_ctrl.moveCondition == (D_regRead2_forward.value != 0));

Comparator cmp(
               .A(D_regRead1_forward.value),
               .B(D_regRead2_forward.value),
               .ctrl(D_ctrl.cmpCtrl)
           );
always_comb begin
    D_last_likely_failed_next = D_last_likely_failed;
    F_jump = 0;
    F_jumpAddr = 0;
    if (exceptionJump) begin
        F_jump = 1;
        F_jumpAddr = exceptionJumpAddr;
    end
    else if (!D_data_waiting) begin
        if (D_ctrl.branch) begin
            F_jump = 1;
            if (cmp.action) begin
                F_jumpAddr = D_pc + 4 + (D_ctrl.immediate << 2);
            end else begin
                if (D_ctrl.branchLikely)
                    D_last_likely_failed_next = 1;
                F_jumpAddr = D_pc + 8;
            end
        end
        else if (D_ctrl.absJump) begin
            F_jump = 1;
            if (D_ctrl.absJumpLoc == `absJumpImmediate) begin
                F_jumpAddr = {D_pc[31:28], D_ctrl.immediate[25:0], 2'b00};
            end
            else begin
                F_jumpAddr = D_regRead1_forward.value;
            end
        end
    end
end

ArithmeticLogicUnit D_alu(
                        .ctrl(D_ctrl.aluCtrl),
                        .A(D_regRead1_forward.value),
                        .B(D_ctrl.aluSrc ? D_ctrl.immediate : D_regRead2_forward.value)
                    );

logic D_memAddressError;
always_comb begin
    D_memAddressError = 0;
    if (!D_ctrl.memUnaligned) begin
        if (D_ctrl.memWidthCtrl == `memWidth4) begin
            if (D_memAddress[1:0] != 0) begin
                D_memAddressError = 1;
            end
        end else if (D_ctrl.memWidthCtrl == `memWidth2) begin
            if (D_memAddress[0] != 0) begin
                D_memAddressError = 1;
            end
        end
    end
end

ExcCode_t D_excCode;
always_comb begin
    D_badVAddr_next = D_badVAddr;
    D_excCode = cNone;
    D_exception = 0;
    if (D_last_bubble) begin
        D_exception = 0;
    end
    else if (D_last_exception) begin
        D_excCode = D_last_excCode;
        D_exception = 1;
    end
    else if (cp0_interrupt_pending) begin
        D_excCode = cInt;
        D_exception = 1;
    end else if (D_ctrl.privileged && !cp0_privileged) begin
        D_exception = 1;
        D_excCode = cCpU;
    end else if (D_ctrl.memStore && D_memAddressError) begin
        D_excCode = cAdES;
        D_exception = 1;
        D_badVAddr_next = D_memAddress;
    end else if (D_ctrl.memLoad && D_memAddressError) begin
        D_excCode = cAdEL;
        D_exception = 1;
        D_badVAddr_next = D_memAddress;
    end else begin
        case (D_ctrl.generateException)
            `ctrlUnknownInstruction: begin
                D_excCode = cRI;
                D_exception = 1;
            end
            `ctrlERET: begin
                D_excCode = cERET;
                D_exception = 1;
            end
            `ctrlSyscall: begin
                D_excCode = cSys;
                D_exception = 1;
            end
            `ctrlBreak: begin
                D_excCode = cBp;
                D_exception = 1;
            end
        endcase
    end
end


reg [31:0] D_real_pc;
always_comb begin
    if (D_last_bubble) begin
        D_real_pc <= F_im.pc;
    end
    else begin
        D_real_pc <= D_pc;
    end
end

// ======== Execution Stage ========

wire E_stall = stallLevel[m_E];
reg E_bubble;
wire E_insert_bubble = E_bubble || E_data_waiting;
ControlSignals E_ctrl;
reg [31:0] E_pc;
reg [31:0] E_instr; // Do not use
reg [31:0] E_regRead1;
reg [31:0] E_regRead2;
reg [31:0] E_memAddress;
reg [31:0] E_aluOutput;
reg E_aluOverflow;
reg E_mul_running;
reg E_tlb_refill_last;
reg E_moveDisable;
reg E_regWriteDataValid;
reg [31:0] E_regWriteData;

ExcCode_t E_last_excCode;
reg [31:0] E_badVAddr;
logic [31:0] E_badVAddr_next;

reg E_LLbit;
logic E_LLbit_next;

reg E_isDelaySlot;
reg E_last_exception;

assign forwardValidE = E_regWriteDataValid;
assign forwardAddressE = E_moveDisable ? 0 : E_ctrl.destinationRegister;
assign forwardValueE = E_regWriteData;

assign data_sram_vaddr = D_memAddress;
assign data_sram_vaddr_valid = D_memAddress_valid;
assign data_sram_va_hold = E_data_waiting;

always_comb begin
    E_regWriteDataValid = 0;
    E_regWriteData = 'bx;
    case (E_ctrl.grfWriteSource)
        `grfWritePC: begin
            E_regWriteData = E_pc + 8;
            E_regWriteDataValid = 1;
        end
        `grfWriteALU: begin
            E_regWriteData = E_aluOutput;
            E_regWriteDataValid = 1;
        end
        `grfWriteLLbit: begin
            E_regWriteData = {31'b0, E_LLbit};
            E_regWriteDataValid = 1;
        end
        `grfWriteMove: begin
            E_regWriteData = E_regRead1;
            E_regWriteDataValid = 1;
        end
    endcase
end

logic E_mul_collision, E_mulStart;

always @(posedge clk) begin
    if (reset) begin
        E_bubble <= 1;
        E_last_exception <= 0;
        E_pc <= 0;
        E_regRead1 <= 0;
        E_regRead2 <= 0;
        E_badVAddr <= 0;
        E_isDelaySlot <= 0;
        E_ctrl <= kControlNop;
        E_memAddress <= 0;
        E_aluOutput <= 0;
        E_aluOverflow <= 0;
        E_LLbit <= 0;
        E_mul_running <= 0;
        E_moveDisable <= 0;
        E_tlb_refill_last <= 0;
        E_instr <= 0;
    end
    else begin
        if (!E_stall) begin
            E_last_exception <= D_exception;
            E_last_excCode <= D_excCode;
            E_bubble <= D_insert_bubble || exceptionLevel[m_E];
            E_pc <= D_real_pc;
            E_regRead1 <= D_regRead1_forward.value;
            E_regRead2 <= D_regRead2_forward.value;
            E_isDelaySlot <= D_isDelaySlot;
            E_badVAddr <= D_badVAddr_next;
            E_ctrl <= (D_insert_bubble || exceptionLevel[m_E] || D_exception) ? kControlNop : D_ctrl;
            E_memAddress <= D_memAddress;
            E_aluOutput <= D_alu.out;
            E_aluOverflow <= D_alu.overflow;
            E_LLbit <= E_LLbit_next;
            E_mul_running <= 0;
            E_tlb_refill_last <= D_tlb_refill;
            E_moveDisable <= D_moveDisable;
            E_instr <= D_instr;
        end
        else begin
            E_bubble <= E_bubble || exceptionLevel[m_M];
            E_ctrl <= (E_bubble || exceptionLevel[m_M]) ? kControlNop : E_ctrl;
            E_regRead1 <= E_regRead1_forward.value;
            E_regRead2 <= E_regRead2_forward.value;
            E_mul_running <= E_mulStart || E_mul_running;
        end
    end
end

ForwardController E_regRead1_forward (
                      .request(E_ctrl.regRead1),
                      .original(E_regRead1),
                      .enabled(E_ctrl.mulCtrl != `mtDisabled || E_ctrl.writeCP0),

                      .src1Valid(forwardValidM),
                      .src1Reg(forwardAddressM),
                      .src1Value(forwardValueM),

                      .src2Reg(5'b0)
                  );

ForwardController E_regRead2_forward (
                      .request(E_ctrl.regRead2),
                      .original(E_regRead2),
                      .enabled(E_ctrl.mulCtrl != `mtDisabled || E_ctrl.memStore || E_ctrl.memUnaligned),

                      .src1Valid(forwardValidM),
                      .src1Reg(forwardAddressM),
                      .src1Value(forwardValueM),

                      .src2Reg(5'b0)
                  );

ExcCode_t E_excCode;
logic E_tlb_refill;
always_comb begin
    E_excCode = cNone;
    E_exception = 0;
    E_badVAddr_next = E_badVAddr;
    E_tlb_refill = 0;
    if (E_bubble) begin
        E_exception = 0;
    end
    else if (E_last_exception) begin
        E_excCode = E_last_excCode;
        E_exception = 1;
        E_tlb_refill = E_tlb_refill_last;
    end
    else if (E_ctrl.checkOverflow && E_aluOverflow) begin
        E_excCode = cOv;
        E_exception = 1;
    end
    else if (E_ctrl.trap && E_aluOutput) begin
        E_excCode = cTr;
        E_exception = 1;
    end else if (data_sram_addressError) begin
        E_exception = 1;
        E_excCode = data_sram_write ? cAdES : cAdEL;
        E_badVAddr_next = E_memAddress;
    end else if (data_sram_tlb_miss || data_sram_tlb_invalid) begin
        E_exception = 1;
        E_excCode = data_sram_write ? cTLBS : cTLBL;
        E_badVAddr_next = E_memAddress;
        E_tlb_refill = data_sram_tlb_miss;
    end else if (data_sram_tlb_modified) begin
        E_exception = 1;
        E_excCode = cTLBMod;
        E_badVAddr_next = E_memAddress;
    end
end

always_comb begin
    E_mulStart = 0;
    E_mul_collision = 0;
    if (E_ctrl.mulEnable && E_ctrl.grfWriteSource == `grfWriteMul && !E_mul_running) begin
        E_mul_collision = 1;
    end
    if (E_ctrl.mulEnable || E_ctrl.grfWriteSource == `grfWriteMul) begin
        if (E_mul.busy) begin
            E_mul_collision = 1;
        end
        else if (E_ctrl.mulEnable && !M_exception && !E_mul_running) begin
            E_mulStart = 1;
        end
    end
end

XALU E_mul(
               .ctrl(E_ctrl.mulCtrl),
               .start(E_mulStart),
               .reset(reset),
               .clk(clk),
               .A(E_regRead1_forward.value),
               .B(E_regRead2_forward.value)
           );

wire [31:0] E_mul_value = E_ctrl.mulOutputSel ? E_mul.HI : E_mul.LO;

DataMemoryWriteShifter E_dm_w(
    .address(E_memAddress),
    .writeDataIn(E_regRead2_forward.value), // register@regRead2
    .widthCtrl(E_ctrl.memWidthCtrl),
    .writeDataOut(data_sram_wdata),
    .unaligned(E_ctrl.memUnaligned),
    .leftPart(E_ctrl.memLeftPart),
    .writeByteEn(data_sram_byteen)
);

wire E_memEnable = !E_ctrl.checkLLbit || E_LLbit;
assign data_sram_write = E_ctrl.memStore && E_memEnable;
assign data_sram_read = E_ctrl.memLoad;
assign data_sram_size = E_ctrl.memWidthCtrl;
assign data_sram_tlb = E_ctrl.calculateAddress;
assign data_cache_op = E_ctrl.memDCacheOp;
assign inst_cache_op = E_ctrl.memICacheOp;
// icache has no waiting operation
wire E_dcache_active = E_ctrl.memDCacheOp != CACHE_NOP;
wire E_icache_active = E_ctrl.memICacheOp != CACHE_NOP;

wire E_memory_waiting = ((data_sram_write || data_sram_read) && !data_sram_valid) || (E_dcache_active && !data_cache_op_valid) || (E_icache_active && !inst_cache_op_valid) || (E_ctrl.memWaitForIdle && !mem_idle);

DataMemoryReadShifter E_dm_r(
        .originalData(E_regRead2_forward.value), // register@regRead2
        .data_sram_rdata(data_sram_rdata),
        .address(E_memAddress),
        .widthCtrl(E_ctrl.memWidthCtrl),
        .extendCtrl(E_ctrl.memReadSignExtend),
        .unaligned(E_ctrl.memUnaligned),
        .leftPart(E_ctrl.memLeftPart)
);

always_comb begin
    if (data_sram_read && E_ctrl.setLLbit) begin
        E_LLbit_next = 1;
    end else if (E_last_exception && E_last_excCode == cERET) begin
        E_LLbit_next = 0;
    end else begin
        E_LLbit_next = E_LLbit;
    end
end

assign cp0_we = E_ctrl.writeCP0;
assign cp0_number = E_ctrl.numberCP0;
assign cp0_wdata = E_regRead1_forward.value;
assign tlb_op = E_ctrl.tlbop;

count_bit E_bitCounter(
    .bit_val(E_ctrl.bitCounterType),
    .val(E_regRead1) // forwarding is done in D to reduce delay
);

assign E_data_waiting = !E_exception && (E_mul_collision || E_memory_waiting);
reg [31:0] E_real_pc;

always_comb begin
    if (E_bubble) begin
        E_real_pc <= D_real_pc;
    end
    else begin
        E_real_pc <= E_pc;
    end
end

// ======== Memory Stage ========
reg M_bubble;
ControlSignals M_ctrl;
reg [31:0] M_pc;
reg [31:0] M_instr;
reg [31:0] M_mulOutput;
reg [31:0] M_memData;
reg [31:0] M_lastBadVAddr;
ExcCode_t M_last_excCode;
reg M_lastWriteDataValid;
reg [31:0] M_lastWriteData;
reg [31:0] M_cp0Value;
reg [31:0] M_bitCount;
logic M_regWriteDataValid;
logic [31:0] M_regWriteData;
reg M_last_exception;
reg M_tlb_refill;
reg M_moveDisable;

reg M_isDelaySlot;

always @(posedge clk) begin
    if (reset) begin
        M_bubble <= 1;
        M_last_exception <= 0;
        M_pc <= 0;
        M_lastBadVAddr <= 0;
        M_mulOutput <= 0;
        M_lastWriteDataValid <= 0;
        M_lastWriteData <= 0;
        M_isDelaySlot <= 0;
        M_ctrl <= kControlNop;
        M_memData <= 0;
        M_cp0Value <= 0;
        M_tlb_refill <= 0;
        M_bitCount <= 0;
        M_moveDisable <= 0;
        M_instr <= 0;
    end
    else begin
        M_bubble <= E_insert_bubble || exceptionLevel[m_M];
        M_last_exception <= E_exception;
        M_last_excCode <= E_excCode;
        M_pc <= E_real_pc;
        M_lastBadVAddr <= E_badVAddr_next;
        M_memData <= E_dm_r.readData;
        M_mulOutput <= E_mul_value;
        M_lastWriteDataValid <= E_regWriteDataValid;
        M_lastWriteData <= E_regWriteData;
        M_isDelaySlot <= E_isDelaySlot;
        M_ctrl <= (E_insert_bubble || exceptionLevel[m_M] || E_exception) ? kControlNop : E_ctrl;
        M_cp0Value <= cp0_rdata;
        M_bitCount <= E_bitCounter.count;
        M_tlb_refill <= E_tlb_refill;
        M_moveDisable <= E_moveDisable;
        M_instr <= E_instr;
`ifndef SYNTHESIS
        if (E_exception) begin
            if (E_excCode == cERET) begin
                $display("Exception returned at %h", E_pc);
            end else begin
                $display("Exception occurred at %h, caused by %0s", E_pc, E_excCode.name());
            end
        end
`endif
    end
end

assign forwardAddressM = M_moveDisable ? 0 : M_ctrl.destinationRegister;
assign forwardValueM = M_regWriteData;
assign forwardValidM = M_regWriteDataValid;
always_comb begin
    if (M_lastWriteDataValid) begin
        M_regWriteData = M_lastWriteData;
        M_regWriteDataValid = 1;
    end
    else begin
        M_regWriteDataValid = 0;
        M_regWriteData = 'bx;
        case (M_ctrl.grfWriteSource)
            `grfWriteMul: begin
                M_regWriteData = M_mulOutput;
                M_regWriteDataValid = 1;
            end
            `grfWriteMem: begin
                M_regWriteData = M_memData;
                M_regWriteDataValid = 1;
            end
            `grfWriteCP0: begin
                M_regWriteData = M_cp0Value;
                M_regWriteDataValid = 1;
            end
            `grfWriteBitCounter: begin
                M_regWriteData = M_bitCount;
                M_regWriteDataValid = 1;
            end
        endcase
    end
end
assign grfWriteAddress = M_moveDisable ? 0 : M_ctrl.destinationRegister;
assign grfWriteData = M_regWriteData;

assign M_exception = !M_bubble && M_last_exception;
assign exceptionJump = M_exception;

always_comb begin
    case (M_last_excCode)
        cERET:        exceptionJumpAddr = cp0_epc;
        cInt:         exceptionJumpAddr = cp0_int_handler;
        cTLBL, cTLBS: exceptionJumpAddr = M_tlb_refill ? cp0_tlb_refill_handler : cp0_exc_handler;
        default:      exceptionJumpAddr = cp0_exc_handler;
    endcase
end

assign cp0_en_exp = M_exception;
assign cp0_ewr_epc = M_isDelaySlot ? M_pc - 4 : M_pc;
assign cp0_ewr_bd = M_isDelaySlot;
assign cp0_ewr_badVAddr = M_lastBadVAddr;
assign cp0_ewr_excCode = M_last_excCode;

assign debug_wb_pc = M_bubble ? 0 : M_pc;
assign debug_wb_rf_wen = grfWriteAddress != 0 ? 4'b1111 : 0;
assign debug_wb_rf_wnum = grfWriteAddress;
assign debug_wb_rf_wdata = grfWriteData;
assign debug_wb_instr = M_bubble ? 0 : M_instr;

endmodule
