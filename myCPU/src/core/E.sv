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
        output reg [31:0] E_SC_data,

        output salu_busy_real,

        output reg [8:0] E_ExtType,
        output reg [3:0] E_MemWriteEnable,
        output reg E_MemFamily,

        output reg [`INSTRBUS_WIDTH-1:0] E_InstrBus,
        output reg E_OverFlow,
        output reg E_DataUnaligned,

        output D_read,
        output D_write,

        input [3:0] M_T,
        input M_WriteRegEnable,
        input [4:0] M_RegId,
        input [31:0] M_Data,

        input dm_stall,
        output [31:0] tlb_reg_daddr,
        output tlb_reg_den,

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
    reg llbit;
    reg E_llbit;


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
    assign D_read =  (lb|lbu|lh|lhu|(LL|lw));
    assign D_write = (sb|sh|(SC|sw));

    wire [8:0] ExtType_Inter;
    wire [3:0] MemWriteEnable_Inter;
    wire MemFamily_Inter;

    wire D_load_alignment_err, D_store_alignment_err;
    wire [1:0] Offset;
    assign Offset = Data_Inter[1:0];

    assign ExtType_Inter         = {lb,lbu,lh,lhu,(LL|lw),lwl,lwr,swl,swr};
    assign MemFamily_Inter       = lb|lbu|lh|lhu|(LL|lw)|sb|sh|(SC|sw);
    assign D_load_alignment_err  = ((LL|lw) & Offset[1:0]!=0) | (lh & Offset[0] !=0) | (lhu & Offset[0] !=0) ;
    assign D_store_alignment_err = ((SC|sw) & Offset[1:0]!=0) | (sh & Offset[0] !=0) ;

    assign MemWriteEnable_Inter = D_store_alignment_err ? 4'b0000:
                                                          (({4{(SC|sw)}} & 4'b1111) | ({4{sh}} & (4'b0011<<Offset)) | 
                                                          ({4{sb}} & (4'b0001<<Offset)) |({4{swl}} & (4'b1111>>(~Offset))) | 
                                                          ({4{swr}} & (4'b1111<<(Offset))));

    assign E_MemReadEnable_Inter = lb|lbu|lh|lhu|(LL|lw)|lwl|lwr ;

    assign E_MemSaveType_Inter = (SC|sw)|sb|sh ;

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
            .llbit(llbit),
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

    reg [31:0] salu_PC,salu_EPC,salu_WriteMemData;
    reg [4:0] salu_RtID,salu_RdID;
    reg [3:0] salu_T;
    reg salu_WriteRegEnable;
    reg [4:0] salu_RegId;
    reg [31:0] salu_Data;
    reg [8:0] salu_ExtType;
    reg [3:0] salu_MemWriteEnable;
    reg salu_trap;
    reg salu_MemFamily,salu_OverFlow,salu_data_alignment_err,salu_in_delayslot,salu_inst_miss,salu_inst_illegal,salu_inst_invalid;
    reg [`INSTRBUS_WIDTH-1:0] salu_InstrBus;

    assign E_XALU_Busy_real = E_XALU_Busy | mul_in_xalu;

    wire [31:0] salur;
    wire salu_busy;
    reg count_in_salu;

    wire salu_busy_real;
    assign salu_busy_real = salu_busy | count_in_salu;

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
            count_in_salu        <= 0;
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
            E_SC_data            <= 0;
            E_ExtType            <= 0;
            E_MemWriteEnable     <= 0;
            E_MemFamily          <= 0;
            E_InstrBus           <= 1;
            E_OverFlow           <= 0;
            E_DataUnaligned      <= 0;
        end
        else if(clo||clz && !count_in_salu)begin
            count_in_salu           <= 1;
            salu_PC                 <= D_PC;
            salu_EPC                <= D_EPC;
            salu_WriteMemData       <= regRT;
            salu_RtID               <= RtNumber_D;
            salu_RdID               <= D_RdID;
            salu_T                  <= D_T ==4'b0 ? 4'b0 : D_T-1;
            salu_WriteRegEnable     <= D_WriteRegEnable;
            salu_RegId              <= D_RegId;
            salu_Data               <= Data_Inter;
            salu_ExtType            <= ExtType_Inter;
            salu_MemWriteEnable     <= MemWriteEnable_Inter;
            salu_MemFamily          <= MemFamily_Inter;
            salu_InstrBus           <= D_InstrBus;
            salu_OverFlow           <= D_OverFlow;
            salu_data_alignment_err <= D_store_alignment_err | D_load_alignment_err;
            salu_in_delayslot       <= D_InDelaySlot;

            salu_inst_miss          <= D_InstMiss;
            salu_inst_illegal       <= D_IllegalInstruction;
            salu_inst_invalid       <= D_InvalidInstruction;
            salu_trap               <= D_trap;
            E_PC                 <= 0;
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
            E_SC_data            <= 0;
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
            E_PC                 <= 0;
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
            E_SC_data            <= 0;
            E_ExtType            <= 0;
            E_MemWriteEnable     <= 0;
            E_MemFamily          <= 0;
            E_InstrBus           <= 1;
            E_OverFlow           <= 0;
            E_DataUnaligned      <= 0;
        end
        else if (!dm_stall) begin
            if(count_in_salu && !salu_busy)begin
                count_in_salu        <= 1'b0;
                E_PC                 <= salu_PC;
                E_EPC                <= salu_EPC;
                E_WriteMemData       <= regRT;
                E_RtID               <= salu_RtID;
                E_RdID               <= salu_RdID;
                E_T                  <= salu_T;
                E_RegWriteEnable     <= salu_WriteRegEnable;
                E_RegNumber          <= salu_RegId;
                E_IllegalInstruction <= salu_inst_illegal;
                E_InvalidInstruction <= salu_inst_invalid;
                E_trap               <= salu_trap;
                E_Data               <= salur;
                E_SC_data            <= salur;
                E_ExtType            <= salu_ExtType;
                E_MemWriteEnable     <= salu_MemWriteEnable;
                E_MemFamily          <= salu_MemFamily;
                E_InstrBus           <= salu_InstrBus;
                E_OverFlow           <= salu_OverFlow;
                E_DataUnaligned      <= salu_data_alignment_err;
                E_in_delayslot       <= salu_in_delayslot;
            end
            else if(mul_in_xalu && !E_XALU_Busy)begin
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
                E_SC_data            <= XALU_LO;
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
                E_MemWriteEnable     <= (SC&&(!llbit)) ? 0 : MemWriteEnable_Inter;
                E_MemFamily          <= MemFamily_Inter;
                E_InstrBus           <= D_InstrBus;
                E_OverFlow           <= D_OverFlow;
                E_DataUnaligned      <= D_store_alignment_err | D_load_alignment_err;
                E_in_delayslot       <= D_InDelaySlot;
                E_llbit <= llbit;
                E_SC_data            <= SC?{31'd0,llbit}:(({32{clo|clz}}&salur)|({32{!(clo|clz)}}&Data_Inter));
            end
        end
    end

    assign  tlb_reg_daddr = (reset | ExceptionFlush | E_CurrentException | E_EstallClear|(mul && !mul_in_xalu)|(clo||clz && !count_in_salu)) ? 0 :
                            ((!dm_stall) && (count_in_salu && !salu_busy)) ? salur:
                            ((!dm_stall) && (mul_in_xalu && !E_XALU_Busy)) ? XALU_LO:
                            (!dm_stall) ?  ({32{clo|clz}}&salur)|({32{!(clo|clz)}}&Data_Inter) : E_Data;
    assign  tlb_reg_den =   (reset | ExceptionFlush | E_CurrentException | E_EstallClear|(mul && !mul_in_xalu)|(clo||clz && !count_in_salu)) ? 0 :
                            ((!dm_stall) && (count_in_salu && !salu_busy)) ? salu_MemFamily:
                            ((!dm_stall) && (mul_in_xalu && !E_XALU_Busy)) ? mul_MemFamily:
                            (!dm_stall) ?  MemFamily_Inter : E_MemFamily;

    always @(posedge Clk)begin
        if(reset) begin
            llbit <= 0;
        end
        else if(!(ExceptionFlush | E_CurrentException | E_EstallClear)&&!dm_stall)begin
            if(LL)begin
                llbit <= 1;
            end
            else if(SC|eret)begin
                llbit <= 0;
            end
        end
    end

endmodule
