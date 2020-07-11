`include "my_global.h"

module DecodeState(
    input   Clk,
    input   Clr,
    input   dm_stall,
    input   exp_flush,
    input   inst_sram_data_ok,
    input   [3:0]   W_WriteRegEnable,
    input   [4:0]   W_RegWriteId,
    input   [31:0]  W_RegWriteData,

	input	[31:0]	I_PC_Pass,
    input   [31:0]  I_PC,
    input   [31:0]  I_MipsInstr,
    input   [3:0]   W_T,
	input	[31:0]	W_PC,
    output  [31:0]  D_NewPC_Pass,///pass through  
	output	reg	[31:0]	D_PC,
	output	reg [4:0]	D_RsID,
	output	reg [4:0]	D_RtID,
    output	reg [4:0]	D_RdID,
	output  reg [31:0]  D_RsData,
    output  reg [31:0]  D_RtData,
    output  reg [4:0]   D_Shamt,
    output  reg [15:0]  D_Imm16,
    output	reg [`INSTRBUS_WIDTH-1:0]	D_InstrBus,
    
    input   [3:0]   E_T,
    input           E_WriteRegEnable,
    input   [4:0]   E_RegId,
    input   [31:0]  E_Data,

    output  reg [3:0]   D_T,
    output  reg         D_WriteRegEnable,
    output  reg [4:0]   D_RegId,

    output 			D_stall_Pass,

	input			E_XALU_Busy,
    output  reg     D_in_delayslot,

    input   I_inst_miss,
    input   I_inst_illegal,
    input   I_inst_invalid,
    
    output reg D_inst_miss,
    output reg D_inst_illegal,
    output reg D_inst_invalid,

    ////***
   // input           I_inst_uncache ,
  //  input [31:0] I_cache_MipsInstr,
    input           I_nextNotReady,
 //   input E_now_exp,
    input wire [31:0] exception_new_pc
    ////****
    );
    
    wire [25:0]     Imm26_Inter;
    wire [15:0]     Imm16_Inter;
    wire [4:0]		Rs_Inter,Rt_Inter,Rd_Inter,Shamt_Inter;
    wire [`INSTRBUS_WIDTH-1:0]		InstrBus_Inter;
	wire			WriteRegEnable_Inter;
	wire [4:0] 		WriteRegId_Inter;
	
    DecodeUnit  DecodeUnit(
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
    GRF GRF(
        .Clk(Clk),
        .Clr(Clr),
        .PC(W_PC),
        .Addr1(Rs_Inter),
        .Addr2(Rt_Inter),
        .WriteAddr(W_RegWriteId),
        .WriteEnable(W_WriteRegEnable),
        .WriteData(W_RegWriteData),
        .OutData1(RsData_Inter),
        .OutData2(RtData_Inter),
        .dm_stall(dm_stall)
    );
    
    /////////////////////杞�鍙戝�??    
	wire[31:0] MF_Rs = (Rs_Inter!=0 && Rs_Inter==E_RegId && E_T==0 && E_WriteRegEnable) ? E_Data:
                                                                                          RsData_Inter;
    wire[31:0] MF_Rt = (Rt_Inter!=0 && Rt_Inter==E_RegId && E_T==0 && E_WriteRegEnable) ? E_Data:
                                                                                          RtData_Inter;
    //////////////////////
    NPC NPC(
        .MipsInstr(I_MipsInstr),
        .RsData(MF_Rs),
        .RtData(MF_Rt),
        .PC(I_PC_Pass),
        .NewPC(D_NewPC_Pass),

        ///***
        .exp_flush( /* E_now_exp | */  exp_flush ),
        .exception_new_pc(exception_new_pc)
        ///***
    );

    wire	`INSTR_SET;
	assign	{`INSTR_SET}	=	InstrBus_Inter;
    wire is_branch;
    reg D_is_branch;
    initial begin
        D_is_branch <= 0;
        D_in_delayslot <= 0;
    end
    assign is_branch = |{beq,bne,blez,bgtz,bltz,bgez,bltzal,bgezal,j,jal,jr,jalr};
    
    wire MultCalFamily_Inter = (mult|multu|div|divu);
	reg	D_MultCalFamily;
    
    wire    [3:0]   T_Inter;
    StallCtrlUnit StallCtrlUnit(
        .InstrBus(InstrBus_Inter),
        .Rs(Rs_Inter),
        .Rt(Rt_Inter),
        .D_T(D_T),
        .D_WriteRegEnable(D_WriteRegEnable),
        .D_RegId(D_RegId),
        .E_T(E_T),
        .E_WriteRegEnable(E_WriteRegEnable),
        .E_RegId(E_RegId),
        .stall(D_stall_Pass),
        .T(T_Inter),
        .XALU_Busy(E_XALU_Busy),
        .D_MultCalFamily(D_MultCalFamily),
        .exp_flush(exp_flush)
    );
	//先禁止暂停，调试完别的再�??

    always @ (posedge Clk)  begin
        if( Clr | exp_flush |
            (D_stall_Pass  &!dm_stall) |
            (!dm_stall & I_nextNotReady) ) 
           begin //todo: ke neng cuo,xu yao jing jian
			// if (exp_flush)
            D_PC <= 0; // soft_int epc
			D_RsID <= 0;
			D_RtID <= 0;
			D_RsData <= 0;
			D_RtData <= 0;
			D_Shamt <= 0;
			D_Imm16 <= 0;
			D_InstrBus <= 1;
			D_T <= 0;
			D_WriteRegEnable <= 0;
			D_RegId <= 0;
            D_MultCalFamily <= 0;

            D_inst_miss <= 0;
            D_inst_illegal <= 0;
            D_inst_invalid <= 0;
		end///***
		else if (!dm_stall  &  !I_nextNotReady     ) begin
			D_PC	<= I_PC;
			D_RsID 	<= Rs_Inter;
			D_RtID 	<= Rt_Inter;
            D_RdID  <= Rd_Inter;
			D_RsData <= MF_Rs; //这里之前不是转发�??
			D_RtData <= MF_Rt;
			D_Shamt	<= Shamt_Inter;
			D_Imm16 <= Imm16_Inter;
			D_InstrBus <= InstrBus_Inter;//todo: mfr
            //D_InstrBus <= 
			D_T <= T_Inter==4'b0	?	4'b0	:	T_Inter-1;
			D_WriteRegEnable <= WriteRegEnable_Inter;
			D_RegId <= WriteRegId_Inter;

            D_MultCalFamily <= MultCalFamily_Inter;
            D_is_branch <= is_branch;
            D_in_delayslot <= D_is_branch;

            D_inst_miss <= I_inst_miss;
            D_inst_illegal <= I_inst_illegal;
            D_inst_invalid <= I_inst_invalid;
		end
    end

    
    
endmodule
