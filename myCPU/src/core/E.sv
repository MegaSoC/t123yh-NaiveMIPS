`include "my_global.vh"

module E(
        input Clk,
        input reset,
        input ExceptionFlush,
        input data_sram_data_ok,
        input [31:0] D_PC,
        input [31:0] D_EPC,
        input [4:0] RsNumber_D,
        input [4:0] RtNumber_D,
        input [4:0] D_RdID,
        input [31:0] D_RsData,
        input [31:0] D_RtData,
        input [4:0] D_Shamt,
        input [15:0] D_Imm16,
        input [2:0] D_Sel,
        input [`INSTRBUS_WIDTH-1:0] D_InstrBus,
        input [3:0] D_T,
        input D_WriteRegEnable,
        input [4:0] D_RegId,

        output reg [31:0] E_PC,
        output reg [31:0] E_EPC,
        output reg [31:0] E_WriteMemData,
        output reg [4:0] E_RtID,
        output reg [4:0] E_RdID,
        output reg [2:0] E_Sel,

        output reg [3:0] E_T,
        output reg E_RegWriteEnable,
        output reg [4:0] E_RegNumber,
        output reg [31:0] E_Data,

        output reg [8:0] E_ExtType,
        output reg [3:0] E_MemWriteEnable,
        output reg E_MemFamily,

        output reg [`INSTRBUS_WIDTH-1:0] E_InstrBus,
        output reg E_OverFlow,
        output reg E_DataUnaligned,

        input [3:0] M_T,
        input M_WriteRegEnable,
        input [4:0] M_RegId,
        input [31:0] M_Data,

        input dm_stall,

        output E_XALU_Busy_real,
        input D_InDelaySlot,
        output reg E_in_delayslot,

        input D_InstMiss,
        input D_IllegalInstruction,
        input D_InvalidInstruction,
        input D_trap,

        output reg E_InstMiss,
        output reg E_IllegalInstruction,
        output reg E_InvalidInstruction,
        output reg E_trap,

        input wire E_CurrentException,
        output wire [31:0] E_calLSaddr,
        input wire E_EstallClear,
        output wire E_MemReadEnable_Inter,
        output wire E_MemSaveType_Inter
    );
    wire E_XALU_Busy;
    wire [31:0] regRS = (RsNumber_D==E_RegNumber && RsNumber_D!=0 && E_T==0 && E_RegWriteEnable) ? E_Data:
         (RsNumber_D!=0 && M_WriteRegEnable && M_T==0 && M_RegId==RsNumber_D) ? M_Data: D_RsData;
    wire [31:0] regRT = (RtNumber_D==E_RegNumber && RtNumber_D!=0 && E_T==0 && E_RegWriteEnable) ? E_Data:
         (RtNumber_D!=0 && M_WriteRegEnable && M_T==0 && M_RegId==RtNumber_D) ? M_Data: D_RtData;
    wire [31:0] Data_Inter;
    wire D_OverFlow;


    wire [31:0] XALU_HI, XALU_LO;
    wire XALU_Busy_Inter;

    XALU XALU(
             .clk(Clk),
             .reset(reset),
             .instrBus(D_InstrBus),
             .xaluA(regRS),
             .xaluB(regRT),
             .xaluHi(XALU_HI),
             .xaluLo(XALU_LO),
             .xaluBusy(XALU_Busy_Inter),
             .xaluFlush(ExceptionFlush | E_CurrentException )
         );

    assign E_XALU_Busy = XALU_Busy_Inter;
    wire `INSTR_SET;
    assign {`INSTR_SET} = D_InstrBus;

    wire [8:0] ExtType_Inter;
    wire [3:0] MemWriteEnable_Inter;
    wire MemFamily_Inter;

    wire D_load_alignment_err, D_store_alignment_err;
    wire [1:0] Offset;
    assign Offset = Data_Inter[1:0];

    assign ExtType_Inter         = {lb,lbu,lh,lhu,lw,lwl,lwr,swl,swr};
    assign MemFamily_Inter       = lb|lbu|lh|lhu|lw|sb|sh|sw;
    assign D_load_alignment_err  = (lw & Offset[1:0]!=0) | (lh & Offset[0] !=0) | (lhu & Offset[0] !=0) ;
    assign D_store_alignment_err = (sw & Offset[1:0]!=0) | (sh & Offset[0] !=0) ;

    assign MemWriteEnable_Inter = D_store_alignment_err ? 4'b0000:
                                                          (({4{sw}} & 4'b1111) | ({4{sh}} & (4'b0011<<Offset)) | 
                                                          ({4{sb}} & (4'b0001<<Offset)) |({4{swl}} & (4'b1111>>(~Offset))) | 
                                                          ({4{swr}} & (4'b1111<<(Offset))));

    assign E_MemReadEnable_Inter = lb|lbu|lh|lhu|lw|lwl|lwr ;

    assign E_MemSaveType_Inter = sw|sb|sh ;

    wire [3:0] E_T_Inter = (D_T > 0)?D_T-1:0;

    assign E_calLSaddr = Data_Inter;
    reg mul_in_xalu;

    ALU ALU(
            .srca(regRS),
            .srcb(regRT),
            .shamt(D_Shamt),
            .Imm16(D_Imm16),
            .InstrBus(D_InstrBus),
            .datainter(Data_Inter),
            .mfhi1(mfhi),
            .mflo1(mflo),
            .mul1(mul),
            .hi(XALU_HI),
            .lo(XALU_LO),
            .PC(D_PC),
            .OverFlow(D_OverFlow)
        );

    reg [31:0] mul_PC,mul_EPC,mul_WriteMemData;
    reg [4:0] mul_RtID,mul_RdID;
    reg [3:0] mul_T;
    reg mul_WriteRegEnable;
    reg [4:0] mul_RegId;
    reg [31:0] mul_Data;
    reg [8:0] mul_ExtType;
    reg [3:0] mul_MemWriteEnable;
    reg mul_trap;
    reg mul_MemFamily,mul_OverFlow,mul_data_alignment_err,mul_in_delayslot,mul_inst_miss,mul_inst_illegal,mul_inst_invalid;
    reg [`INSTRBUS_WIDTH-1:0] mul_InstrBus;

    assign E_XALU_Busy_real = E_XALU_Busy | mul_in_xalu;

    wire [31:0] salur;
    wire salu_busy;

    SALU my_salu(//special alu:clo,clz
        .clk(Clk),
        .reset(reset),
        .clo(clo),
        .clz(clz),
        .saluBusy(salu_busy),
        .saluFlush(ExceptionFlush | E_CurrentException),
        .salua(regRS),
        .salur(salur)
    );//it's stupid now, must add flush+ready

    always @ (posedge Clk) begin
        if(reset | ExceptionFlush | E_CurrentException | E_EstallClear) begin
            E_PC                 <= 0;
            mul_in_xalu          <= 0;
            E_EPC                <= reset? 0 : D_EPC;
            E_WriteMemData       <= 0;
            E_RtID               <= 0;
            E_RdID               <= 0;
            E_Sel                <= 0;
            E_T                  <= 0;
            E_RegWriteEnable     <= 0;
            E_RegNumber          <= 0;
            E_InstMiss           <= 0;
            E_IllegalInstruction <= 0;
            E_InvalidInstruction <= 0;
            E_trap               <= 0;
            E_Data               <= 0;
            E_ExtType            <= 0;
            E_MemWriteEnable     <= 0;
            E_MemFamily          <= 0;
            E_InstrBus           <= 1;
            E_OverFlow           <= 0;
            E_DataUnaligned      <= 0;
        end
        else if (mul && !mul_in_xalu) begin
            mul_in_xalu            <= 1;
            mul_PC                 <= D_PC;
            mul_EPC                <= D_EPC;
            mul_WriteMemData       <= regRT;
            mul_RtID               <= RtNumber_D;
            mul_RdID               <= D_RdID;
            mul_T                  <= D_T ==4'b0 ? 4'b0 : D_T-1;
            mul_WriteRegEnable     <= D_WriteRegEnable;
            mul_RegId              <= D_RegId;
            mul_Data               <= Data_Inter;
            mul_ExtType            <= ExtType_Inter;
            mul_MemWriteEnable     <= MemWriteEnable_Inter;
            mul_MemFamily          <= MemFamily_Inter;
            mul_InstrBus           <= D_InstrBus;
            mul_OverFlow           <= D_OverFlow;
            mul_data_alignment_err <= D_store_alignment_err | D_load_alignment_err;
            mul_in_delayslot       <= D_InDelaySlot;

            mul_inst_miss          <= D_InstMiss;
            mul_inst_illegal       <= D_IllegalInstruction;
            mul_inst_invalid       <= D_InvalidInstruction;
            mul_trap               <= D_trap;
        end
        else if (!dm_stall) begin
            if(mul_in_xalu && !E_XALU_Busy)begin
                mul_in_xalu          <= 1'b0;
                E_PC                 <= mul_PC;
                E_EPC                <= mul_EPC;
                E_WriteMemData       <= regRT;
                E_RtID               <= mul_RtID;
                E_RdID               <= mul_RdID;
                E_T                  <= mul_T;
                E_RegWriteEnable     <= mul_WriteRegEnable;
                E_RegNumber          <= mul_RegId;
                E_IllegalInstruction <= mul_inst_illegal;
                E_InvalidInstruction <= mul_inst_invalid;
                E_trap               <= mul_trap;
                E_Data               <= XALU_LO;
                E_ExtType            <= mul_ExtType;
                E_MemWriteEnable     <= mul_MemWriteEnable;
                E_MemFamily          <= mul_MemFamily;
                E_InstrBus           <= mul_InstrBus;
                E_OverFlow           <= mul_OverFlow;
                E_DataUnaligned      <= mul_data_alignment_err;
                E_in_delayslot       <= mul_in_delayslot;
            end
            else begin
                E_PC                 <= D_PC;
                E_EPC                <= D_EPC;
                E_WriteMemData       <= regRT;
                E_RtID               <= RtNumber_D;
                E_RdID               <= D_RdID;
                E_Sel                <= D_Sel;
                E_T                  <= D_T ==4'b0 ? 4'b0 : D_T-1;
                E_RegWriteEnable     <= D_WriteRegEnable;
                E_RegNumber          <= D_RegId;
                E_InstMiss           <= D_InstMiss;
                E_IllegalInstruction <= D_IllegalInstruction;
                E_InvalidInstruction <= D_InvalidInstruction;
                E_trap               <= D_trap;
                E_Data               <= ({32{clo|clz}}&salur)|({32{!(clo|clz)}}&Data_Inter);
                E_ExtType            <= ExtType_Inter;
                E_MemWriteEnable     <= MemWriteEnable_Inter;
                E_MemFamily          <= MemFamily_Inter;
                E_InstrBus           <= D_InstrBus;
                E_OverFlow           <= D_OverFlow;
                E_DataUnaligned      <= D_store_alignment_err | D_load_alignment_err;
                E_in_delayslot       <= D_InDelaySlot;

            end
        end
    end

endmodule
