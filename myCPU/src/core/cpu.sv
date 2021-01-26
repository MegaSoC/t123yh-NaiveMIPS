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

reg [31:0] W_pc;
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
    if (M_data_waiting) begin
        stallLevel = l_M;
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
reg W_last_exception;
logic W_exception;

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
    if (W_exception) begin
        exceptionLevel = l_W;
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

// From Write
wire forwardValidW;
wire [4:0] forwardAddressW;
wire [31:0] forwardValueW;

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
            D_last_bubble <= 1;
            D_ctrl <= kControlNop;
            D_last_exception <= 0;
            D_pc <= 0;
            D_isDelaySlot <= 0;
        end
        else begin
            if (!D_stall) begin
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
                        .debugPC(W_pc)
                    );

assign debug_wb_pc = W_pc;
assign debug_wb_rf_wen = grfWriteAddress != 0 ? 4'b1111 : 0;
assign debug_wb_rf_wnum = grfWriteAddress;
assign debug_wb_rf_wdata = grfWriteData;

ForwardController D_regRead1_forward (
                      .request(D_ctrl.regRead1),
                      .original(D_grf.readOutput1),
                      .enabled(D_ctrl.absJump || D_ctrl.branch),
                      .debugPC(D_pc),
                      .debugStage("D"),

                      .src1Valid(forwardValidE),
                      .src1Reg(forwardAddressE),
                      .src1Value(forwardValueE),
                      .src2Valid(forwardValidM),
                      .src2Reg(forwardAddressM),
                      .src2Value(forwardValueM),
                      .src3Valid(forwardValidW),
                      .src3Reg(forwardAddressW),
                      .src3Value(forwardValueW)
                  );

ForwardController D_regRead2_forward (
                      .request(D_ctrl.regRead2),
                      .original(D_grf.readOutput2),
                      .enabled(D_ctrl.absJump || D_ctrl.branch),
                      .debugPC(D_pc),
                      .debugStage("D"),

                      .src1Valid(forwardValidE),
                      .src1Reg(forwardAddressE),
                      .src1Value(forwardValueE),
                      .src2Valid(forwardValidM),
                      .src2Reg(forwardAddressM),
                      .src2Value(forwardValueM),
                      .src3Valid(forwardValidW),
                      .src3Reg(forwardAddressW),
                      .src3Value(forwardValueW)
                  );

assign D_data_waiting = D_regRead1_forward.stallExec || D_regRead2_forward.stallExec;

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

reg E_regWriteDataValid;
reg [31:0] E_regWriteData;

reg [4:0] E_last_cause;
reg [31:0] E_badVAddr;

reg E_isDelaySlot;

assign forwardValidE = E_regWriteDataValid;
assign forwardAddressE = E_ctrl.destinationRegister;
assign forwardValueE = E_regWriteData;

always_comb begin
    E_regWriteDataValid = 0;
    E_regWriteData = 'bx;
    case (E_ctrl.grfWriteSource)
        `grfWritePC: begin
            E_regWriteData = E_pc + 8;
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
    end
    else begin
        if (cp0.interruptNow) begin
            E_bubble <= 1;
            E_ctrl <= kControlNop;
            E_last_exception <= 0;
            E_pc <= 0;
            E_isDelaySlot <= 0;
        end
        else if (!E_stall) begin
            E_last_exception <= D_exception;
            E_last_cause <= D_cause;
            E_bubble <= D_insert_bubble || exceptionLevel[m_E];
            E_pc <= D_real_pc;
            E_regRead1 <= D_regRead1_forward.value;
            E_regRead2 <= D_regRead2_forward.value;
            E_isDelaySlot <= D_isDelaySlot;
            E_badVAddr <= D_badVAddr;
            E_ctrl <= (D_insert_bubble || exceptionLevel[m_E] || D_exception) ? kControlNop : D_ctrl;
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
                      .enabled(E_ctrl.aluCtrl != `aluDisabled || E_ctrl.mulCtrl != `mtDisabled),
                      .debugPC(E_pc),
                      .debugStage("E"),

                      .src1Valid(forwardValidM),
                      .src1Reg(forwardAddressM),
                      .src1Value(forwardValueM),

                      .src2Valid(forwardValidW),
                      .src2Reg(forwardAddressW),
                      .src2Value(forwardValueW),

                      .src3Reg(5'b0)
                  );

ForwardController E_regRead2_forward (
                      .request(E_ctrl.regRead2),
                      .original(E_regRead2),
                      .enabled((E_ctrl.aluCtrl != `aluDisabled || E_ctrl.mulCtrl != `mtDisabled) && E_ctrl.aluSrc),
                      .debugPC(E_pc),
                      .debugStage("E"),

                      .src1Valid(forwardValidM),
                      .src1Reg(forwardAddressM),
                      .src1Value(forwardValueM),

                      .src2Valid(forwardValidW),
                      .src2Reg(forwardAddressW),
                      .src2Value(forwardValueW),

                      .src3Reg(5'b0)
                  );

ArithmeticLogicUnit E_alu(
                        .ctrl(E_ctrl.aluCtrl),
                        .A(E_regRead1_forward.value),
                        .B(E_ctrl.aluSrc ? E_ctrl.immediate : E_regRead2_forward.value)
                    );

reg [4:0] E_cause;
always_comb begin
    E_cause = 'bx;
    E_exception = 0;
    if (E_bubble) begin
        E_exception = 0;
    end
    else if (E_last_exception) begin
        E_cause = E_last_cause;
        E_exception = 1;
    end
    else if (!E_data_waiting && E_ctrl.checkOverflow && E_alu.overflow) begin
        if (E_ctrl.memLoad) begin
            E_cause = `causeAdEL;
            E_exception = 1;
        end
        else if (E_ctrl.memStore) begin
            E_cause = `causeAdES;
            E_exception = 1;
        end
        else begin
            E_cause = `causeOv;
            E_exception = 1;
        end
    end
end

logic E_mul_collision, E_mulStart;
assign E_data_waiting = E_regRead1_forward.stallExec || E_regRead2_forward.stallExec || E_mul_collision;

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
               .B(E_ctrl.aluSrc ? E_ctrl.immediate : E_regRead2_forward.value)
           );

wire [31:0] E_mul_value = E_ctrl.mulOutputSel ? E_mul.HI : E_mul.LO;

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
wire M_stall = stallLevel[m_M];
reg M_bubble;
wire M_insert_bubble = M_bubble || M_data_waiting;
ControlSignals M_ctrl;
reg [31:0] M_pc;
reg [31:0] M_aluOutput;
reg [31:0] M_mulOutput;
reg [31:0] M_regRead1;
reg [31:0] M_regRead2;
reg [31:0] M_lastBadVAddr;
reg M_lastWriteDataValid;
reg [31:0] M_lastWriteData;

reg M_regWriteDataValid;
reg [31:0] M_regWriteData;
reg [4:0] M_last_cause;
reg [31:0] M_badVAddr;

reg M_isDelaySlot;

// keep vaddr when busy
always_comb begin
    if (!M_data_waiting) begin
        data_sram_vaddr = E_alu.out;
    end else begin
        data_sram_vaddr = M_aluOutput;
    end
end


always @(posedge clk) begin
    if (reset) begin
        M_bubble <= 1;
        M_last_exception <= 0;
        M_pc <= 0;
        M_aluOutput <= 0;
        M_lastBadVAddr <= 0;
        M_mulOutput <= 0;
        M_regRead1 <= 0;
        M_regRead2 <= 0;
        M_lastWriteDataValid <= 0;
        M_lastWriteData <= 0;
        M_isDelaySlot <= 0;
        M_ctrl <= kControlNop;
    end
    else begin
        if (cp0.interruptNow) begin
            M_bubble <= 0;
            M_last_exception <= 1;
            M_last_cause <= `causeInt;
            M_pc <= E_real_pc;
            M_isDelaySlot <= E_isDelaySlot;
            M_ctrl <= kControlNop;
        end
        else if (!M_stall) begin
            M_bubble <= E_insert_bubble || exceptionLevel[m_M];
            M_last_exception <= E_exception;
            M_last_cause <= E_cause;
            M_pc <= E_real_pc;
            M_aluOutput <= E_alu.out;
            M_lastBadVAddr <= E_badVAddr;
            M_mulOutput <= E_mul_value;
            M_regRead1 <= E_regRead1_forward.value;
            M_regRead2 <= E_regRead2_forward.value;
            M_lastWriteDataValid <= E_regWriteDataValid;
            M_lastWriteData <= E_regWriteData;
            M_isDelaySlot <= E_isDelaySlot;
            M_ctrl <= (E_insert_bubble || exceptionLevel[m_M] || E_exception) ? kControlNop : E_ctrl;
        end
        else begin
            M_bubble <= M_bubble || exceptionLevel[m_M];
            M_regRead1 <= M_regRead1_forward.value;
            M_regRead2 <= M_regRead2_forward.value;
            M_ctrl <= (M_bubble || exceptionLevel[m_M]) ? kControlNop : M_ctrl;
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
            `grfWriteALU: begin
                M_regWriteData = M_aluOutput;
                M_regWriteDataValid = 1;
            end
            `grfWriteMul: begin
                M_regWriteData = M_mulOutput;
                M_regWriteDataValid = 1;
            end
        endcase
    end
end

ForwardController M_regRead1_forward (
                      .request(M_ctrl.regRead1),
                      .original(M_regRead1),
                      .enabled(0),
                      .debugPC(M_pc),
                      .debugStage("M"),

                      .src1Valid(forwardValidW),
                      .src1Reg(forwardAddressW),
                      .src1Value(forwardValueW),

                      .src2Reg(5'b0),
                      .src3Reg(5'b0)
                  );

ForwardController M_regRead2_forward (
                      .request(M_ctrl.regRead2),
                      .original(M_regRead2),
                      .enabled(E_ctrl.memStore),
                      .debugPC(M_pc),
                      .debugStage("M"),

                      .src1Valid(forwardValidW),
                      .src1Reg(forwardAddressW),
                      .src1Value(forwardValueW),

                      .src2Reg(5'b0),
                      .src3Reg(5'b0)
                  );

wire M_source_waiting = M_regRead1_forward.stallExec || M_regRead2_forward.stallExec;

DataMemory M_dm(
               .clk(clk),
               .reset(reset),
               .dataValid(!M_source_waiting),
               .writeEnable(M_ctrl.memStore),
               .readEnable(M_ctrl.memLoad),
               .address(M_aluOutput),
               .writeDataIn(M_regRead2_forward.value), // register@regRead2
               .widthCtrl(M_ctrl.memWidthCtrl),

               .writeEnableOut(data_sram_write),
               .readEnableOut(data_sram_read),
               .writeDataOut(data_sram_wdata)
           );
assign data_sram_size = M_ctrl.memWidthCtrl;

wire M_memory_waiting = (M_dm.writeEnableOut || M_dm.readEnableOut) && !data_sram_valid;
assign M_data_waiting = M_source_waiting || M_memory_waiting;

reg [4:0] M_cause;
always_comb begin
    M_exception = 0;
    M_cause = 'bx;
    M_badVAddr = M_lastBadVAddr;
    if (M_bubble) begin
        M_exception = 0;
    end
    else  if (M_last_exception) begin
        M_exception = 1;
        M_cause = M_last_cause;
    end
    else if (M_dm.exception) begin
        M_exception = 1;
        if (M_ctrl.memLoad) begin
            M_cause = `causeAdEL;
            M_badVAddr = M_aluOutput;
        end
        else if (M_ctrl.memStore) begin
            M_cause = `causeAdES;
            M_badVAddr = M_aluOutput;
        end
    end
end

// ======== WriteBack Stage ========

ControlSignals W_ctrl;
reg [31:0] W_aluOutput;
reg [31:0] W_regRead1;
reg W_lastWriteDataValid;
reg [31:0] W_lastWriteData;
reg [4:0] W_last_cause;
reg [31:0] W_badVAddr;
reg [31:0] W_memData;

reg W_bubble;
reg W_isDelaySlot;
always @(posedge clk) begin
    if (reset) begin
        W_bubble <= 1;
        W_pc <= 0;
        W_aluOutput <= 0;
        W_lastWriteData <= 0;
        W_memData <= 0;
        W_lastWriteDataValid <= 0;
        W_last_exception <= 0;
        W_badVAddr <= 0;
        W_ctrl <= kControlNop;
    end
    else begin
        W_regRead1 <= M_regRead1_forward.value;
        W_bubble <= M_insert_bubble;
        W_pc <= M_pc;
        W_aluOutput <= M_aluOutput;
        W_lastWriteData <= M_regWriteData;
        W_lastWriteDataValid <= M_regWriteDataValid;
        W_isDelaySlot <= M_isDelaySlot;
        W_memData <= data_sram_rdata;
        W_badVAddr <= M_badVAddr;
        if (M_exception) begin
            if (M_cause == 16) begin
                $display("Exception returned at %h", M_pc);
            end else begin
                $display("Exception occurred at %h, caused by %d", M_pc, M_cause);
            end
        end
        W_last_exception <= M_exception;
        W_last_cause <= M_cause;
        W_ctrl <= (M_insert_bubble || M_exception) ? kControlNop : M_ctrl;
    end
end

DataMemoryReader W_reader(
        .data_sram_rdata(W_memData),
        .readEnable(W_ctrl.memLoad),
        .address(W_aluOutput),
        .widthCtrl(W_ctrl.memWidthCtrl),
        .extendCtrl(W_ctrl.memReadSignExtend)
);

assign W_exception = !W_bubble && W_last_exception;
assign cp0.isException = W_exception;
assign cp0.exceptionPC = W_pc;
assign cp0.exceptionCause = W_last_cause;

assign cp0.writeEnable = W_ctrl.writeCP0;
assign cp0.number = W_ctrl.numberCP0;
assign cp0.writeData = W_regRead1;
assign cp0.isBD = W_isDelaySlot;
assign cp0.exceptionBadVAddr = W_badVAddr;

assign forwardValidW = 1;
assign forwardAddressW = W_ctrl.destinationRegister;
assign forwardValueW = grfWriteData;

always_comb begin
    grfWriteAddress = W_ctrl.destinationRegister;
    if (W_lastWriteDataValid) begin
        grfWriteData = W_lastWriteData;
    end
    else begin
        grfWriteData = 'bx;
        case (W_ctrl.grfWriteSource)
            `grfWriteMem: begin
                grfWriteData = W_reader.readData;
            end
            `grfWriteCP0: begin
                grfWriteData = cp0.readData;
            end
        endcase
    end
end

endmodule
