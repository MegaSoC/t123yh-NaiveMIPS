`include "my_global.h"

module ExecuteSdate(
    input   Clk,
    input   Clr,
    input   exp_flush,
    input   data_sram_data_ok,
	input	[31:0]	D_PC,
    input   [31:0]  D_EPC,
    input   [4:0]   D_RsID,
    input   [4:0]   D_RtID,
    input   [4:0]   D_RdID,
    input   [31:0]  D_RsData,
    input 	[31:0]  D_RtData,
    input   [4:0]   D_Shamt,
    input   [15:0]  D_Imm16,
    input	[`INSTRBUS_WIDTH-1:0]  D_InstrBus,
    input 	[3:0]   D_T,
    input			D_WriteRegEnable,
    input	[4:0]   D_RegId,
    
    input   [3:0]   M_T,
    input           M_WriteRegEnable,
    input   [4:0]   M_RegId,
    input   [31:0]  M_Data,

	output reg [31:0]	E_PC,
    output reg [31:0]   E_EPC,
    output reg [31:0]   E_WriteMemData,
    output reg [4:0]    E_RtID,
    output reg [4:0]    E_RdID,

    output reg	[3:0]   E_T,
    output reg			E_WriteRegEnable,
    output reg	[4:0]	E_RegId,
    output reg	[31:0]  E_Data,

    output reg	[8:0]   E_ExtType,
    output reg	[3:0]   E_MemWriteEnable,
    output reg	E_MemFamily,

    output reg  [`INSTRBUS_WIDTH-1:0]  E_InstrBus,
    output reg          E_OverFlow,
    output reg          E_data_alignment_err,
    input              dm_stall,

    output	E_XALU_Busy_real,
    input               D_in_delayslot,
    output reg          E_in_delayslot,

    input   D_inst_miss,
    input   D_inst_illegal,
    input   D_inst_invalid,
    
    output reg E_inst_miss,
    output reg E_inst_illegal,
    output reg E_inst_invalid,

    ///***
    input wire E_now_exp,
    output wire [31:0] E_calLSaddr,
    output wire E_MemReadEnable_Inter,
    input  wire  E_EstallClear,
    output wire E_MemSaveType_Inter 
    ///***
    );
    wire E_XALU_Busy;
    wire    [31:0]  MF_Rs = (D_RsID!=0 && D_RsID==E_RegId && E_T==0 && E_WriteRegEnable) ?   E_Data:
                            (D_RsID!=0 && M_WriteRegEnable && M_T==0 && M_RegId==D_RsID) ?   M_Data:
                                                                                             D_RsData;
    wire    [31:0]  MF_Rt = (D_RtID!=0 && D_RtID==E_RegId && E_T==0 && E_WriteRegEnable) ?	 E_Data:
                            (D_RtID!=0 && M_WriteRegEnable && M_T==0 && M_RegId==D_RtID) ?   M_Data://M级结束（实际上是W级了），那么T必定�????
                                                                                             D_RtData;
    ////////////////////////////////////////
    wire    [31:0]  C_Inter;
    wire D_OverFlow;
    ALU ALU(
        .A(MF_Rs),
        .B(MF_Rt),
        .shamt(D_Shamt),
        .Imm16(D_Imm16),
        .InstrBus(D_InstrBus),
        .C(C_Inter),
        .PC(D_PC),
        .OverFlow(D_OverFlow)
    );

    wire [31:0] XALU_HI,
				XALU_LO;
	wire		XALU_Busy_Inter;
	
	XALU XALU(
        .Clk(Clk),
        .Clr(Clr),
        .InstrBus(D_InstrBus),
        .XALU_A(MF_Rs),
        .XALU_B(MF_Rt),
        .XALU_HI(XALU_HI),
        .XALU_LO(XALU_LO),
        .XALU_Busy(XALU_Busy_Inter),
        .Intreq(exp_flush | E_now_exp )
    );

    assign E_XALU_Busy = XALU_Busy_Inter;
    
    wire    [8:0]   ExtType_Inter;
    wire    [3:0]   MemWriteEnable_Inter;
    wire    MemFamily_Inter;

    wire[1:0] Offset;
    assign Offset = C_Inter[1:0];
    wire D_load_alignment_err, D_store_alignment_err;
    MemCtrlUnit MemCtrlUnit(
        .InstrBus(D_InstrBus),
        .Offset(C_Inter[1:0]),
        .ExtType(ExtType_Inter),
        .MemWriteEnable(MemWriteEnable_Inter),
        .MemFamily(MemFamily_Inter),
        .load_alignment_err(D_load_alignment_err),
        .store_alignment_err(D_store_alignment_err),
        .LoadFamily(E_MemReadEnable_Inter),
        .E_MemSaveType_Inter(E_MemSaveType_Inter)
    );
    
    //////////////////////////////////////////////////////////////////////////////////////////
    wire    [3:0] E_T_Inter = (D_T > 0)?D_T-1:0;

    wire	`INSTR_SET;
	assign	{`INSTR_SET} = D_InstrBus;
       
   
    wire	[31:0]	Data_Inter = 	mfhi	?	XALU_HI:
									(mflo|mul)	?	XALU_LO:
												C_Inter;
    ///***
    assign E_calLSaddr = C_Inter;
	///***
    reg mul_in_xalu;
    reg [31:0] mul_rd;
    
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
    //32+4+1+5+5+4+1+32+1=85
    always @ (posedge Clk) begin
        if(Clr | exp_flush | E_now_exp  | E_EstallClear  ) begin  ///
			E_PC <= 0; // fetch_alignment_err
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
        else if (mul) begin
            mul_in_xalu <= 1;
            mul_rd <= D_RegId;
        end
		else if (!dm_stall) begin
		   
			E_PC <= D_PC;
            E_EPC <= D_EPC;
			E_WriteMemData <= MF_Rt;// MF_Rt; //TODO: bug
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

endmodule
