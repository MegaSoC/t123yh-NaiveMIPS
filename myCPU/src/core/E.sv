`include "my_global.vh"

module E(
        input Clk,
        input Clr,
        input exp_flush,
        input data_sram_data_ok,
        input [31:0] D_PC,
        input [31:0] D_EPC,
        input [4:0] D_RsID,
        input [4:0] D_RtID,
        input [4:0] D_RdID,
        input [31:0] D_RsData,
        input [31:0] D_RtData,
        input [4:0] D_Shamt,
        input [15:0] D_Imm16,
        input [`INSTRBUS_WIDTH-1:0] D_InstrBus,
        input [3:0] D_T,
        input D_WriteRegEnable,
        input [4:0] D_RegId,

        input [3:0] M_T,
        input M_WriteRegEnable,
        input [4:0] M_RegId,
        input [31:0] M_Data,

        output reg [31:0] E_PC,
        output reg [31:0] E_EPC,
        output reg [31:0] E_WriteMemData,
        output reg [4:0] E_RtID,
        output reg [4:0] E_RdID,

        output reg [3:0] E_T,
        output reg E_WriteRegEnable,
        output reg [4:0] E_RegId,
        output reg [31:0] E_Data,

        output reg [8:0] E_ExtType,
        output reg [3:0] E_MemWriteEnable,
        output reg E_MemFamily,

        output reg [`INSTRBUS_WIDTH-1:0] E_InstrBus,
        output reg E_OverFlow,
        output reg E_data_alignment_err,
        input dm_stall,

        output E_XALU_Busy_real,
        input D_in_delayslot,
        output reg E_in_delayslot,

        input D_inst_miss,
        input D_inst_illegal,
        input D_inst_invalid,

        output reg E_inst_miss,
        output reg E_inst_illegal,
        output reg E_inst_invalid,

        input wire E_now_exp,
        output wire [31:0] E_calLSaddr,
        output wire E_MemReadEnable_Inter,
        input wire E_EstallClear,
        output wire E_MemSaveType_Inter
    );
    wire E_XALU_Busy;
    wire [31:0] MF_Rs = (D_RsID!=0 && D_RsID==E_RegId && E_T==0 && E_WriteRegEnable) ? E_Data:
         (D_RsID!=0 && M_WriteRegEnable && M_T==0 && M_RegId==D_RsID) ? M_Data:
         D_RsData;
    wire [31:0] MF_Rt = (D_RtID!=0 && D_RtID==E_RegId && E_T==0 && E_WriteRegEnable) ? E_Data:
         (D_RtID!=0 && M_WriteRegEnable && M_T==0 && M_RegId==D_RtID) ? M_Data: D_RtData;
    wire [31:0] Data_Inter;
    wire D_OverFlow;


    wire [31:0] XALU_HI, XALU_LO;
    wire XALU_Busy_Inter;

    XALU XALU(
             .clk(Clk),
             .reset(Clr),
             .instrBus(D_InstrBus),
             .xaluA(MF_Rs),
             .xaluB(MF_Rt),
             .xaluHi(XALU_HI),
             .xaluLo(XALU_LO),
             .xaluBusy(XALU_Busy_Inter),
             .xaluFlush(exp_flush | E_now_exp )
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

    assign ExtType_Inter = {lb,lbu,lh,lhu,lw,lwl,lwr,swl,swr};
    assign MemFamily_Inter = lb|lbu|lh|lhu|lw|sb|sh|sw;
    assign D_load_alignment_err = (lw & Offset[1:0]!=0) | (lh & Offset[0] !=0) | (lhu & Offset[0] !=0) ;
    assign D_store_alignment_err = (sw & Offset[1:0]!=0) | (sh & Offset[0] !=0) ;

    assign MemWriteEnable_Inter = D_store_alignment_err ? 4'b0000:
           (({4{sw}} & 4'b1111) |({4{sh}} & (4'b0011<<Offset)) |({4{sb}} & (4'b0001<<Offset)) |({4{swl}} & (4'b1111>>(~Offset))) |({4{swr}} & (4'b1111<<(Offset))));

    assign E_MemReadEnable_Inter = lb|lbu|lh|lhu|lw|lwl|lwr ;

    assign E_MemSaveType_Inter = sw|sb|sh ;

    wire [3:0] E_T_Inter = (D_T > 0)?D_T-1:0;

    assign E_calLSaddr = Data_Inter;
    reg mul_in_xalu;

    ALU ALU(
            .srca(MF_Rs),
            .srcb(MF_Rt),
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
    reg mul_MemFamily,mul_OverFlow,mul_data_alignment_err,mul_in_delayslot,mul_inst_miss,mul_inst_illegal,mul_inst_invalid;
    reg [`INSTRBUS_WIDTH-1:0] mul_InstrBus;



    assign E_XALU_Busy_real = E_XALU_Busy | mul_in_xalu;

    initial begin
        E_PC <= 0;
        E_EPC <= 0;
        E_WriteMemData <= 0;
        E_RtID <= 0;
        E_T <= 0;
        E_WriteRegEnable <= 0;
        E_RegId <= 0;
        E_Data <= 0;
        E_ExtType <= 0;
        E_MemWriteEnable <= 0;
        E_MemFamily <= 0;
        E_InstrBus <= 1;
    end
    always @ (posedge Clk) begin
        if(Clr | exp_flush | E_now_exp | E_EstallClear ) begin
            E_PC <= 0;
            mul_in_xalu <= 0;
            E_EPC <= Clr? 0 : D_EPC;
            E_WriteMemData <= 0;
            E_RtID <= 0;
            E_T <= 0;
            E_WriteRegEnable <= 0;
            E_RegId <= 0;
            E_Data <= 0;
            E_ExtType <= 0;
            E_MemWriteEnable <= 0;
            E_MemFamily <= 0;
            E_InstrBus <= 1;
            E_OverFlow <= 0;
            E_data_alignment_err <= 0;

            E_inst_miss <= 0;
            E_inst_illegal <= 0;
            E_inst_invalid <= 0;
        end
        else if (mul && !mul_in_xalu) begin
            mul_in_xalu <= 1;

            mul_PC <= D_PC;
            mul_EPC <= D_EPC;
            mul_WriteMemData <= MF_Rt;
            mul_RtID <= D_RtID;
            mul_RdID <= D_RdID;
            mul_T <= D_T ==4'b0 ? 4'b0 : D_T-1;
            mul_WriteRegEnable <= D_WriteRegEnable;
            mul_RegId <= D_RegId;
            mul_Data <= Data_Inter;
            mul_ExtType <= ExtType_Inter;
            mul_MemWriteEnable <= MemWriteEnable_Inter;
            mul_MemFamily <= MemFamily_Inter;
            mul_InstrBus <= D_InstrBus;
            mul_OverFlow <= D_OverFlow;
            mul_data_alignment_err <= D_store_alignment_err | D_load_alignment_err;
            mul_in_delayslot <= D_in_delayslot;

            mul_inst_miss <= D_inst_miss;
            mul_inst_illegal <= D_inst_illegal;
            mul_inst_invalid <= D_inst_invalid;
        end
        else if (!dm_stall) begin
            if(mul_in_xalu && !E_XALU_Busy)begin
                mul_in_xalu <= 1'b0;
                E_PC <= mul_PC;
                E_EPC <= mul_EPC;
                E_WriteMemData <= MF_Rt;
                E_RtID <= mul_RtID;
                E_RdID <= mul_RdID;
                E_T <= mul_T;
                E_WriteRegEnable <= mul_WriteRegEnable;
                E_RegId <= mul_RegId;
                E_Data <= XALU_LO;
                E_ExtType <= mul_ExtType;
                E_MemWriteEnable <= mul_MemWriteEnable;
                E_MemFamily <= mul_MemFamily;
                E_InstrBus <= mul_InstrBus;
                E_OverFlow <= mul_OverFlow;
                E_data_alignment_err <= mul_data_alignment_err;
                E_in_delayslot <= mul_in_delayslot;

                E_inst_illegal <= mul_inst_illegal;
                E_inst_invalid <= mul_inst_invalid;
            end
            else begin
                E_PC <= D_PC;
                E_EPC <= D_EPC;
                E_WriteMemData <= MF_Rt;
                E_RtID <= D_RtID;
                E_RdID <= D_RdID;
                E_T <= D_T ==4'b0 ? 4'b0 : D_T-1;
                E_WriteRegEnable <= D_WriteRegEnable;
                E_RegId <= D_RegId;
                E_Data <= Data_Inter;
                E_ExtType <= ExtType_Inter;
                E_MemWriteEnable <= MemWriteEnable_Inter;
                E_MemFamily <= MemFamily_Inter;
                E_InstrBus <= D_InstrBus;
                E_OverFlow <= D_OverFlow;
                E_data_alignment_err <= D_store_alignment_err | D_load_alignment_err;
                E_in_delayslot <= D_in_delayslot;

                E_inst_miss <= D_inst_miss;
                E_inst_illegal <= D_inst_illegal;
                E_inst_invalid <= D_inst_invalid;
            end
        end
    end

endmodule
