`timescale 1ns / 1ps

module NPC(
    input	[31:0]	MipsInstr,
    input   signed  [31:0]  RsData,
    input   signed  [31:0]  RtData,
    input   [31:0]  PC,
    input   exp_flush,
    input   [31:0] exception_new_pc,
    output  [31:0]  NewPC
    );
    wire    [25:0]  Imm26   =   MipsInstr[25:0];
    wire    [15:0]  Imm16   =   MipsInstr[15:0];
    wire	[5:0]	OpCode	=	MipsInstr[31:26],
					Funct	=	MipsInstr[5:0];
    wire    [31:0]  PC4 =   PC+4;
    /////////////////////////////////////////////
    wire    j=		(OpCode==6'h2),
			jal=	(OpCode==6'h3);
    wire    J_Type  =   j|jal;
    wire    [31:0]  J_Ans   =   {PC[31:28],Imm26,2'b00};
    /////////////////////////////////////////////
	wire	jr=		(OpCode==6'h0 && Funct==6'h8),
			jalr=	(OpCode==6'h0 && Funct==6'h9);
    wire    JR_Type =   jr|jalr;
    wire    [31:0]  JR_Ans  =   RsData;
    /////////////////////////////////////////////
    wire    beq=	(OpCode==6'h4),
			bne=	(OpCode==6'h5),
			blez=	(OpCode==6'h6),
			bgtz=	(OpCode==6'h7),
			bltz=	(MipsInstr[31:26]==6'h1 && MipsInstr[20:16]==6'h0),
			bgez=	(MipsInstr[31:26]==6'h1 && MipsInstr[20:16]==6'h1);    
    wire	bltzal=	(OpCode==6'b000001 && MipsInstr[20:16]==5'b10000),
        	bgezal=	(OpCode==6'b000001 && MipsInstr[20:16]==5'b10001);
    wire    BJ_Type =   (beq|bne|blez)|(bgtz|bltz|bgez)|(bltzal|bgezal);
    wire    BJ_OK   =   beq             ?   RsData==RtData:
                        bne             ?   RsData!=RtData:
                        blez            ?   RsData<=RtData:
                        bgtz            ?   RsData>0:
                        bltz|bltzal     ?   RsData<0:
                        bgez|bgezal     ?   RsData>=0:
                                            0;

    wire    [31:0]	BJ_Ans  =   PC  +   {{14{Imm16[15]}},Imm16,2'b00};
    /////////////////////////////////////////////
    assign  NewPC   =   exp_flush       ?   exception_new_pc :
                        J_Type          ?   J_Ans:
                        JR_Type         ?   JR_Ans:
                        (BJ_Type & BJ_OK) ?   BJ_Ans:
                                              PC4;
endmodule
