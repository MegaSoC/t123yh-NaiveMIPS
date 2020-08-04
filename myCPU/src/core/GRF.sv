`timescale 1ns / 1ps

module GRF(
	input	wire Clk,
	input	wire Clr,
    
	input	wire [4:0]	Addr1,
	input	wire [4:0]	Addr2,
    input	wire [4:0]	Addr3,
	input	wire [4:0]	Addr4,

	input	wire [4:0]	WriteAddr,
	input	wire [3:0]  WriteEnable,
	input	wire [31:0]	WriteData,

	output	wire [31:0]	OutData1,
	output	wire [31:0]	OutData2,
    output	wire [31:0]	OutData3,
	output	wire [31:0]	OutData4,
	
	input	wire [4:0]	eAddr1,
	input	wire [4:0]	eAddr2,
    input	wire [4:0]	eAddr3,
	input	wire [4:0]	eAddr4,

	output	wire [31:0]	eOutData1,
	output	wire [31:0]	eOutData2,
    output	wire [31:0]	eOutData3,
	output	wire [31:0]	eOutData4
    );
	reg	[31:0]	Reg	[31:0];
	
	assign	OutData1[7:0]	=	(Addr1 == 0)						     ?	 0:
							     (WriteAddr == Addr1 && WriteEnable[0])	 ?   WriteData[7:0]:
																	           Reg[Addr1][7:0];
	assign	OutData1[15:8]	=	(Addr1 == 0)						     ?	 0:
							     (WriteAddr == Addr1 && WriteEnable[1])	 ?   WriteData[15:8]:
																	           Reg[Addr1][15:8];
	assign	OutData1[23:16]	=	(Addr1 == 0)						     ?	 0:
							     (WriteAddr == Addr1 && WriteEnable[2])	 ?   WriteData[23:16]:
																	           Reg[Addr1][23:16];
	assign	OutData1[31:24]	=	(Addr1 == 0)						     ?	 0:
							     (WriteAddr == Addr1 && WriteEnable[3])	 ?   WriteData[31:24]:
																	           Reg[Addr1][31:24];
																	           																           
	assign	OutData2[7:0]	=	(Addr2 == 0)						     ?	 0:
							     (WriteAddr == Addr2 && WriteEnable[0])	 ?   WriteData[7:0]:
																	           Reg[Addr2][7:0];
	assign	OutData2[15:8]	=	(Addr2 == 0)						     ?	 0:
							     (WriteAddr == Addr2 && WriteEnable[1])	 ?   WriteData[15:8]:
																	           Reg[Addr2][15:8];
	assign	OutData2[23:16]	=	(Addr2 == 0)						     ?	 0:
							     (WriteAddr == Addr2 && WriteEnable[2])	 ?   WriteData[23:16]:
																	           Reg[Addr2][23:16];
	assign	OutData2[31:24]	=	(Addr2 == 0)						     ?	 0:
							     (WriteAddr == Addr2 && WriteEnable[3])	 ?   WriteData[31:24]:
																	           Reg[Addr2][31:24];

	assign	OutData3[7:0]	=	(Addr3 == 0)						     ?	 0:
							     (WriteAddr == Addr3 && WriteEnable[0])	 ?   WriteData[7:0]:
																	           Reg[Addr3][7:0];
	assign	OutData3[15:8]	=	(Addr3 == 0)						     ?	 0:
							     (WriteAddr == Addr3 && WriteEnable[1])	 ?   WriteData[15:8]:
																	           Reg[Addr3][15:8];
	assign	OutData3[23:16]	=	(Addr3 == 0)						     ?	 0:
							     (WriteAddr == Addr3 && WriteEnable[2])	 ?   WriteData[23:16]:
																	           Reg[Addr3][23:16];
	assign	OutData3[31:24]	=	(Addr3 == 0)						     ?	 0:
							     (WriteAddr == Addr3 && WriteEnable[3])	 ?   WriteData[31:24]:
																	           Reg[Addr3][31:24];

	assign	OutData4[7:0]	=	(Addr4 == 0)						     ?	 0:
							     (WriteAddr == Addr4 && WriteEnable[0])	 ?   WriteData[7:0]:
																	           Reg[Addr4][7:0];
	assign	OutData4[15:8]	=	(Addr4 == 0)						     ?	 0:
							     (WriteAddr == Addr4 && WriteEnable[1])	 ?   WriteData[15:8]:
																	           Reg[Addr4][15:8];
	assign	OutData4[23:16]	=	(Addr4 == 0)						     ?	 0:
							     (WriteAddr == Addr4 && WriteEnable[2])	 ?   WriteData[23:16]:
																	           Reg[Addr4][23:16];
	assign	OutData4[31:24]	=	(Addr4 == 0)						     ?	 0:
							     (WriteAddr == Addr4 && WriteEnable[3])	 ?   WriteData[31:24]:
																	           Reg[Addr4][31:24];                                                                                                                                                              
    
    assign	eOutData1[7:0]	=	(eAddr1 == 0)						     ?	 0:
							     (WriteAddr == eAddr1 && WriteEnable[0])	 ?   WriteData[7:0]:
																	           Reg[eAddr1][7:0];
	assign	eOutData1[15:8]	=	(eAddr1 == 0)						     ?	 0:
							     (WriteAddr == eAddr1 && WriteEnable[1])	 ?   WriteData[15:8]:
																	           Reg[eAddr1][15:8];
	assign	eOutData1[23:16]	=	(eAddr1 == 0)						     ?	 0:
							     (WriteAddr == eAddr1 && WriteEnable[2])	 ?   WriteData[23:16]:
																	           Reg[eAddr1][23:16];
	assign	eOutData1[31:24]	=	(eAddr1 == 0)						     ?	 0:
							     (WriteAddr == eAddr1 && WriteEnable[3])	 ?   WriteData[31:24]:
																	           Reg[eAddr1][31:24];
																	           																           
	assign	eOutData2[7:0]	=	(eAddr2 == 0)						     ?	 0:
							     (WriteAddr == eAddr2 && WriteEnable[0])	 ?   WriteData[7:0]:
																	           Reg[eAddr2][7:0];
	assign	eOutData2[15:8]	=	(eAddr2 == 0)						     ?	 0:
							     (WriteAddr == eAddr2 && WriteEnable[1])	 ?   WriteData[15:8]:
																	           Reg[eAddr2][15:8];
	assign	eOutData2[23:16]	=	(eAddr2 == 0)						     ?	 0:
							     (WriteAddr == eAddr2 && WriteEnable[2])	 ?   WriteData[23:16]:
																	           Reg[eAddr2][23:16];
	assign	eOutData2[31:24]	=	(eAddr2 == 0)						     ?	 0:
							     (WriteAddr == eAddr2 && WriteEnable[3])	 ?   WriteData[31:24]:
																	           Reg[eAddr2][31:24];

	assign	eOutData3[7:0]	=	(eAddr3 == 0)						     ?	 0:
							     (WriteAddr == eAddr3 && WriteEnable[0])	 ?   WriteData[7:0]:
																	           Reg[eAddr3][7:0];
	assign	eOutData3[15:8]	=	(eAddr3 == 0)						     ?	 0:
							     (WriteAddr == eAddr3 && WriteEnable[1])	 ?   WriteData[15:8]:
																	           Reg[eAddr3][15:8];
	assign	eOutData3[23:16]	=	(eAddr3 == 0)						     ?	 0:
							     (WriteAddr == eAddr3 && WriteEnable[2])	 ?   WriteData[23:16]:
																	           Reg[eAddr3][23:16];
	assign	eOutData3[31:24]	=	(eAddr3 == 0)						     ?	 0:
							     (WriteAddr == eAddr3 && WriteEnable[3])	 ?   WriteData[31:24]:
																	           Reg[eAddr3][31:24];

	assign	eOutData4[7:0]	=	(eAddr4 == 0)						     ?	 0:
							     (WriteAddr == eAddr4 && WriteEnable[0])	 ?   WriteData[7:0]:
																	           Reg[eAddr4][7:0];
	assign	eOutData4[15:8]	=	(eAddr4 == 0)						     ?	 0:
							     (WriteAddr == eAddr4 && WriteEnable[1])	 ?   WriteData[15:8]:
																	           Reg[eAddr4][15:8];
	assign	eOutData4[23:16]	=	(eAddr4 == 0)						     ?	 0:
							     (WriteAddr == eAddr4 && WriteEnable[2])	 ?   WriteData[23:16]:
																	           Reg[eAddr4][23:16];
	assign	eOutData4[31:24]	=	(eAddr4 == 0)						     ?	 0:
							     (WriteAddr == eAddr4 && WriteEnable[3])	 ?   WriteData[31:24]:
																	           Reg[eAddr4][31:24]; 
	////////////////////////////////////////////////////////
	integer	i;
	///////////////////////////////////////////////////////
	always_ff @ (posedge Clk) begin
		if(Clr)begin
			for(i=0;i<32;i=i+1)
				Reg[i]<=0;
		end
		else if(WriteEnable) begin
			if(WriteEnable[0]!=0)
				Reg[WriteAddr][7:0]<=WriteData[7:0];
			if(WriteEnable[1]!=0) 
				Reg[WriteAddr][15:8]<=WriteData[15:8];
			if(WriteEnable[2]!=0) 
				Reg[WriteAddr][23:16]<=WriteData[23:16];
			if(WriteEnable[3]!=0) 
				Reg[WriteAddr][31:24]<=WriteData[31:24];
		
		end
	end
	
endmodule
