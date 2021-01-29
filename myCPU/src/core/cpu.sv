`include "constants.svh"
module CPU (
           input clk,
           input reset,
           input [5:0] irq,

           output [31:0] inst_sram_addr,
           output inst_sram_readen,
           input [31:0] inst_sram_rdata,
           input inst_sram_valid,

           output reg [31:0] data_sram_vaddr,
           output data_sram_read,
           output data_sram_write,
           output [31:0] data_sram_wdata,
           output [2:0] data_sram_size,
           input [31:0] data_sram_rdata,
           input data_sram_valid,

           output [31:0] debug_wb_pc,
           output [3:0] debug_wb_rf_wen,
           output [4:0] debug_wb_rf_wnum,
           output [31:0] debug_wb_rf_wdata
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
reg D_last_exception;
logic D_exception;
reg E_last_exception;
logic E_exception;
reg M_last_exception;
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

CP0 cp0(
        .clk(clk),
        .reset(reset),
        .externalInterrupt(irq),
        .hasExceptionInPipeline(| exceptionLevel)
    );

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
                      
                      .inst_sram_rdata(inst_sram_rdata),
                      .inst_sram_addr(inst_sram_addr),
                      .inst_sram_readen(inst_sram_readen),
                      .inst_sram_valid(inst_sram_valid)
                  );

assign F_exception = F_im.adel;
wire [4:0] F_cause = F_im.adel ? `causeAdEL : 'bx;
wire F_insert_bubble = F_im.bubble;
wire [31:0] F_badVAddr = F_im.adel ? F_im.outputPC : 'bx;

Decoder F_dec (
    .instruction(F_im.instruction),
    .reset(reset),
    .bubble(F_im.bubble)
);

// ======== Decode Stage ========
wire D_stall = stallLevel[m_D];
reg D_last_bubble;
wire D_insert_bubble = D_last_bubble || D_data_waiting;
ControlSignals D_ctrl;
reg [31:0] D_pc;
reg D_isDelaySlot;
reg [4:0] D_last_cause;
reg [31:0] D_badVAddr;

always @(posedge clk) begin
    if (reset) begin
        D_last_bubble <= 1;
        D_last_exception <= 0;
        D_pc <= 0;
        D_isDelaySlot <= 0;
        D_badVAddr <= 0;
        D_ctrl <= kControlNop;
    end
    else begin
        if (cp0.interruptNow) begin
            // TODO: verify interrupt delay slot operation
            D_badVAddr <= 0;
            D_isDelaySlot <= F_im.isDelaySlot;
            D_pc <= F_im.outputPC;
            D_last_exception <= 1;
            D_last_cause <= `causeInt;
            D_last_bubble <= exceptionLevel[m_D];
        end
        else if (!D_stall) begin
            D_badVAddr <= F_badVAddr;
            D_isDelaySlot <= F_im.isDelaySlot;
            D_last_exception <= F_exception;
            D_last_cause <= F_cause;
            D_pc <= F_im.outputPC;
            D_last_bubble <= F_insert_bubble || exceptionLevel[m_D];
            D_ctrl <= (F_insert_bubble || exceptionLevel[m_D] || F_exception) ? kControlNop : F_dec.controls;
        end else begin
            D_last_bubble <= D_last_bubble || exceptionLevel[m_D];
            D_ctrl <= (D_last_bubble || exceptionLevel[m_D]) ? kControlNop : D_ctrl;
        end
    end
end

reg [4:0] D_cause;
always_comb begin
    D_cause = 'bx;
    D_exception = 0;
    if (D_last_bubble) begin
        D_exception = 0;
    end
    else if (D_last_exception) begin
        D_cause = D_last_cause;
        D_exception = 1;
    end
    else begin
        case (D_ctrl.generateException)
            `ctrlUnknownInstruction: begin
                D_cause = `causeRI;
                D_exception = 1;
            end
            `ctrlERET: begin
                D_cause = `causeERET;
                D_exception = 1;
            end
            `ctrlSyscall: begin
                D_cause = `causeSyscall;
                D_exception = 1;
            end
            `ctrlBreak: begin
                D_cause = `causeBreak;
                D_exception = 1;
            end
        endcase
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
                      .enabled(D_ctrl.aluCtrl != `aluDisabled || D_ctrl.absJump || D_ctrl.branch || D_ctrl.calculateAddress),

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
                      .enabled(D_ctrl.absJump || D_ctrl.branch || D_ctrl.aluCtrl != `aluDisabled),

                      .src1Valid(forwardValidE),
                      .src1Reg(forwardAddressE),
                      .src1Value(forwardValueE),
                      .src2Valid(forwardValidM),
                      .src2Reg(forwardAddressM),
                      .src2Value(forwardValueM)
                  );

assign D_data_waiting = D_regRead1_forward.stallExec || D_regRead2_forward.stallExec;
wire [31:0] D_memAddress = D_regRead1_forward.value + D_ctrl.immediate;

Comparator cmp(
               .A(D_regRead1_forward.value),
               .B(D_regRead2_forward.value),
               .ctrl(D_ctrl.cmpCtrl)
           );
always_comb begin
    F_jump = 0;
    F_jumpAddr = 0;
    if (cp0.jump) begin
        F_jump = 1;
        F_jumpAddr = cp0.jumpAddress;
    end
    else if (!D_data_waiting) begin
        if (D_ctrl.branch) begin
            F_jump = 1;
            if (cmp.action) begin
                F_jumpAddr = D_pc + 4 + (D_ctrl.immediate << 2);
            end else begin
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
reg [31:0] E_regRead1;
reg [31:0] E_regRead2;
reg [31:0] E_memAddress;
reg [31:0] E_aluOutput;
reg E_aluOverflow;

reg E_regWriteDataValid;
reg [31:0] E_regWriteData;

reg [4:0] E_last_cause;
reg [31:0] E_badVAddr;
logic [31:0] E_badVAddr_next;

reg E_isDelaySlot;

assign forwardValidE = E_regWriteDataValid;
assign forwardAddressE = E_ctrl.destinationRegister;
assign forwardValueE = E_regWriteData;

// keep vaddr when busy
always_comb begin
    if (!E_data_waiting) begin
        data_sram_vaddr = D_memAddress;
    end else begin
        data_sram_vaddr = E_memAddress;
    end
end

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
    endcase
end

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
    end
    else begin
        if (!E_stall) begin
            E_last_exception <= D_exception;
            E_last_cause <= D_cause;
            E_bubble <= D_insert_bubble || exceptionLevel[m_E];
            E_pc <= D_real_pc;
            E_regRead1 <= D_regRead1_forward.value;
            E_regRead2 <= D_regRead2_forward.value;
            E_isDelaySlot <= D_isDelaySlot;
            E_badVAddr <= D_badVAddr;
            E_ctrl <= (D_insert_bubble || exceptionLevel[m_E] || D_exception) ? kControlNop : D_ctrl;
            E_memAddress <= D_memAddress;
            E_aluOutput <= D_alu.out;
            E_aluOverflow <= D_alu.overflow;
        end
        else begin
            E_bubble <= E_bubble || exceptionLevel[m_E];
            E_regRead1 <= E_regRead1_forward.value;
            E_regRead2 <= E_regRead2_forward.value;
            E_ctrl <= (E_bubble || exceptionLevel[m_E]) ? kControlNop : E_ctrl;
        end
    end
end

ForwardController E_regRead1_forward (
                      .request(E_ctrl.regRead1),
                      .original(E_regRead1),
                      .enabled(E_ctrl.mulCtrl != `mtDisabled || M_ctrl.writeCP0),

                      .src1Valid(forwardValidM),
                      .src1Reg(forwardAddressM),
                      .src1Value(forwardValueM),

                      .src2Reg(5'b0)
                  );

ForwardController E_regRead2_forward (
                      .request(E_ctrl.regRead2),
                      .original(E_regRead2),
                      .enabled(E_ctrl.mulCtrl != `mtDisabled || E_ctrl.memStore),

                      .src1Valid(forwardValidM),
                      .src1Reg(forwardAddressM),
                      .src1Value(forwardValueM),

                      .src2Reg(5'b0)
                  );

reg [4:0] E_cause;
always_comb begin
    E_cause = 'bx;
    E_exception = 0;
    E_badVAddr_next = E_badVAddr;
    if (E_bubble) begin
        E_exception = 0;
    end
    else if (E_last_exception) begin
        E_cause = E_last_cause;
        E_exception = 1;
    end
    else if (E_ctrl.checkOverflow && E_aluOverflow) begin
        E_cause = `causeOv;
        E_exception = 1;
    end
    else if (E_dm.exception) begin
        E_exception = 1;
        if (E_ctrl.memLoad) begin
            E_cause = `causeAdEL;
            E_badVAddr_next = E_memAddress;
        end
        else if (E_ctrl.memStore) begin
            E_cause = `causeAdES;
            E_badVAddr_next = E_memAddress;
        end
    end
end

logic E_mul_collision, E_mulStart;
wire E_source_waiting = E_regRead1_forward.stallExec || E_regRead2_forward.stallExec;

always_comb begin
    E_mulStart = 0;
    E_mul_collision = 0;
    if (E_ctrl.mulEnable || E_ctrl.grfWriteSource == `grfWriteMul) begin
        if (E_mul.busy) begin
            E_mul_collision = 1;
        end
        else if (E_ctrl.mulEnable && !M_exception) begin
            E_mulStart = 1;
        end
    end
end

XALU E_mul(
               .ctrl(E_ctrl.mulCtrl),
               .start(!E_data_waiting && E_mulStart),
               .reset(reset),
               .clk(clk),
               .A(E_regRead1_forward.value),
               .B(E_regRead2_forward.value)
           );

wire [31:0] E_mul_value = E_ctrl.mulOutputSel ? E_mul.HI : E_mul.LO;

DataMemory E_dm(
               .clk(clk),
               .reset(reset),
               .dataValid(!E_source_waiting),
               .writeEnable(E_ctrl.memStore),
               .readEnable(E_ctrl.memLoad),
               .address(E_memAddress),
               .writeDataIn(E_regRead2_forward.value), // register@regRead2
               .widthCtrl(E_ctrl.memWidthCtrl),

               .writeEnableOut(data_sram_write),
               .readEnableOut(data_sram_read),
               .writeDataOut(data_sram_wdata)
           );
assign data_sram_size = E_ctrl.memWidthCtrl;

wire E_memory_waiting = (E_dm.writeEnableOut || E_dm.readEnableOut) && !data_sram_valid;

DataMemoryReader E_reader(
        .data_sram_rdata(data_sram_rdata),
        .readEnable(E_ctrl.memLoad),
        .address(E_memAddress),
        .widthCtrl(E_ctrl.memWidthCtrl),
        .extendCtrl(E_ctrl.memReadSignExtend)
);

assign cp0.writeEnable = E_ctrl.writeCP0;
assign cp0.number = E_ctrl.numberCP0;
assign cp0.writeData = E_regRead1_forward.value;

assign E_data_waiting = E_source_waiting || E_mul_collision || E_memory_waiting;
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
reg [31:0] M_mulOutput;
reg [31:0] M_memData;
reg [31:0] M_lastBadVAddr;
reg [4:0] M_last_cause;
reg M_lastWriteDataValid;
reg [31:0] M_lastWriteData;
reg [31:0] M_cp0Value;

logic M_regWriteDataValid;
logic [31:0] M_regWriteData;

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
    end
    else begin
        M_bubble <= E_insert_bubble || exceptionLevel[m_M];
        M_last_exception <= E_exception;
        M_last_cause <= E_cause;
        M_pc <= E_real_pc;
        M_lastBadVAddr <= E_badVAddr_next;
        M_memData <= E_reader.readData;
        M_mulOutput <= E_mul_value;
        M_lastWriteDataValid <= E_regWriteDataValid;
        M_lastWriteData <= E_regWriteData;
        M_isDelaySlot <= E_isDelaySlot;
        M_ctrl <= (E_insert_bubble || exceptionLevel[m_M] || E_exception) ? kControlNop : E_ctrl;
        M_cp0Value <= cp0.readData;
        if (E_exception) begin
            if (E_cause == 16) begin
                $display("Exception returned at %h", E_pc);
            end else begin
                $display("Exception occurred at %h, caused by %d", E_pc, E_cause);
            end
        end
    end
end

assign forwardAddressM = M_ctrl.destinationRegister;
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
        endcase
    end
end
assign grfWriteAddress = M_ctrl.destinationRegister;
assign grfWriteData = M_regWriteData;

assign M_exception = !M_bubble && M_last_exception;
assign cp0.isException = M_last_exception;
assign cp0.exceptionPC = M_pc;
assign cp0.exceptionCause = M_last_cause;
assign cp0.isBD = M_isDelaySlot;
assign cp0.exceptionBadVAddr = M_lastBadVAddr;

assign debug_wb_pc = M_pc;
assign debug_wb_rf_wen = grfWriteAddress != 0 ? 4'b1111 : 0;
assign debug_wb_rf_wnum = grfWriteAddress;
assign debug_wb_rf_wdata = grfWriteData;

endmodule
