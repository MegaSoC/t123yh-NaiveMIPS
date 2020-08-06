`include "my_global.vh"

module D(
        input Clk,
        input reset,
        input is_mul,
        input dm_stall,
        input ExceptionFlush,
        input inst_sram_data_ok,
        input [3:0] W_WriteRegEnable,
        input [4:0] W_RegWriteId,
        input [31:0] W_RegWriteData,

        input [31:0] I_PC_Pass,
        input [31:0] I_PC,
        input [31:0] I_MipsInstr,
        input [3:0] W_T,
        input [31:0] W_PC,
        output [31:0] D_NewPC_Pass,
        output reg [31:0] D_PC,
        output reg [31:0] D_EPC,
        output reg [4:0] RsNumber_D,
        output reg [4:0] RtNumber_D,
        output reg [4:0] D_RdID,
        output reg [31:0] D_RsData,
        output reg [31:0] D_RtData,
        output reg [4:0] D_Shamt,
        output reg [15:0] D_Imm16,
        output reg [`INSTRBUS_WIDTH-1:0] D_InstrBus,

        input [3:0] E_T,
        input E_RegWriteEnable,
        input [4:0] E_RegNumber,
        input [31:0] E_Data,

        output reg [3:0] D_T,
        output reg D_WriteRegEnable,
        output reg [4:0] D_RegId,

        output D_stall_Pass,

        input E_XALU_Busy,
        output reg D_InDelaySlot,

        input I_inst_miss,
        input I_inst_illegal,
        input I_inst_invalid,

        output reg D_InstMiss,
        output reg D_IllegalInstruction,
        output reg D_InvalidInstruction,
        output reg D_trap,

        input I_nextNotReady,
        input wire [31:0] NewExceptionPC
    );

    wire [25:0] Imm26_Inter;
    wire [15:0] Imm16_Inter;
    wire [4:0] Rs_Inter,Rt_Inter,Rd_Inter,Shamt_Inter;
    wire [`INSTRBUS_WIDTH-1:0] InstrBus_Inter;
    wire WriteRegEnable_Inter;
    wire [4:0] WriteRegId_Inter;

    instr2bus my_trans(
                  .MipsInstr(I_MipsInstr),
                  .Rs(Rs_Inter),
                  .Rt(Rt_Inter),
                  .Rd(Rd_Inter),
                  .Shamt(Shamt_Inter),
                  .Imm16(Imm16_Inter),
                  .Imm26(Imm26_Inter),
                  .RegWriteEnable(WriteRegEnable_Inter),
                  .WriteRegId(WriteRegId_Inter),
                  .InstrBus(InstrBus_Inter)
              );

    wire [31:0] RsData_Inter,RtData_Inter;
    GRF my_grf(
            .Clk(Clk),
            .reset(reset),
            .Addr1(Rs_Inter),
            .Addr2(Rt_Inter),
            .WriteAddr(W_RegWriteId),
            .WriteEnable(W_WriteRegEnable),
            .WriteData(W_RegWriteData),
            .OutData1(RsData_Inter),
            .OutData2(RtData_Inter)
        );

    /////////////////////杞�鍙戝�????
    wire is_trap_inter;
    wire[31:0] regRS = (Rs_Inter!=0 && Rs_Inter==E_RegNumber && E_T==0 && E_RegWriteEnable) ? E_Data: RsData_Inter;
    wire[31:0] regRT = (Rt_Inter!=0 && Rt_Inter==E_RegNumber && E_T==0 && E_RegWriteEnable) ? E_Data: RtData_Inter;
    NPC my_npc(
            .instr(I_MipsInstr),
            .rs(regRS),
            .rt(regRT),
            .ipc(I_PC_Pass),
            .npc(D_NewPC_Pass),

            .ExceptionFlush(ExceptionFlush),
            .epc(NewExceptionPC)
        );

    NTrap my_ntrap(
            .instr(I_MipsInstr),
            .rs(regRS),
            .rt(regRT),
            .is_trap(is_trap_inter)
        );

    wire `INSTR_SET;
    assign {`INSTR_SET} = InstrBus_Inter;
    wire is_branch;
    reg D_is_branch;

    assign is_branch = |{(beq||beql),(bne||bnel),(blez||blezl),(bgtz||bgtzl),(bltz||bltzl),(bgez||bgezl),(bltzal||bltzall),(bgezal||bgezall),j,jal,jr,jalr};

    wire MultCalFamily_Inter = (mult|multu|div|divu|mul);
    reg D_MultCalFamily;
    wire D_stall_Pass1;
    assign D_stall_Pass = D_stall_Pass1 | is_mul;

    wire [3:0] T_Inter;
    AT my_at(
           .InstrBus(InstrBus_Inter),
           .Rs(Rs_Inter),
           .Rt(Rt_Inter),
           .D_T(D_T),
           .D_RegId(D_WriteRegEnable?D_RegId:5'd0),
           .E_T(E_T),
           .E_RegWriteEnable(E_RegWriteEnable),
           .E_RegNumber(E_RegNumber),
           .stall(D_stall_Pass1),
           .T(T_Inter),
           .XALU_Busy(E_XALU_Busy),
           .D_MultCalFamily(D_MultCalFamily),
           .ExceptionFlush(ExceptionFlush)
       );
    always @(posedge Clk ) begin
        if (reset) begin
            D_EPC <= 0;
        end
        else begin
            D_EPC <= D_is_branch? I_PC - 4 : I_PC;
        end
    end
    always @ (posedge Clk) begin
        if (reset) begin
            D_is_branch <= 0;
            D_InDelaySlot <= 0;
        end
        if(reset || ExceptionFlush || (D_stall_Pass && !dm_stall) || (!dm_stall & I_nextNotReady) )
        begin
            D_PC <= 0;
            RsNumber_D <= 0;
            RtNumber_D <= 0;
            D_RsData <= 0;
            D_RtData <= 0;
            D_Shamt <= 0;
            D_Imm16 <= 0;
            D_InstrBus <= 1;
            D_T <= 0;
            D_WriteRegEnable <= 0;
            D_RegId <= 0;
            D_MultCalFamily <= 0;

            D_InstMiss <= 0;
            D_IllegalInstruction <= 0;
            D_trap <= 0;
            D_InvalidInstruction <= 0;
        end
        else if (!dm_stall & !I_nextNotReady ) begin
            D_PC <= I_PC;
            RsNumber_D <= Rs_Inter;
            RtNumber_D <= Rt_Inter;
            D_RdID <= Rd_Inter;
            D_RsData <= regRS; //这里之前不是转发�????
            D_RtData <= regRT;
            D_Shamt <= Shamt_Inter;
            D_Imm16 <= Imm16_Inter;
            D_InstrBus <= InstrBus_Inter;
            D_T <= T_Inter==4'b0 ? 4'b0 : T_Inter-1;
            D_WriteRegEnable <= WriteRegEnable_Inter;
            D_RegId <= WriteRegId_Inter;

            D_MultCalFamily <= MultCalFamily_Inter;
            D_is_branch <= is_branch;
            D_InDelaySlot <= D_is_branch;

            D_InstMiss <= I_inst_miss;
            D_IllegalInstruction <= I_inst_illegal;
            D_trap <= is_trap_inter;
            D_InvalidInstruction <= I_inst_invalid;
        end
    end



endmodule
