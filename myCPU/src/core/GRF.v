`timescale 1ns / 1ps

module GRF(
	input	Clk,
	input	Clr,
	input	[31:0]	PC,
	input	[4:0]	Addr1,
	input	[4:0]	Addr2,
	input	[4:0]	WriteAddr,
	input	[3:0]   WriteEnable,
	input	[31:0]	WriteData,
	output	[31:0]	OutData1,
	output	[31:0]	OutData2,
	input dm_stall
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
																	//加入了内部转发，省去了W级的转发问题
	////////////////////////////////////////////////////////
	integer	i;
	///////////////////////////////////////////////////////
	always @ (posedge Clk) begin
		if(Clr)begin
			for(i=0;i<32;i=i+1)
				Reg[i]<=0;
		end
		else if(WriteEnable) begin
	//	    if(!dm_stall)
	//			$display("Time:%d    @%h: $%d <= %h, instr in ram is line(+2): %d",$time, PC, WriteAddr,WriteData,((PC&32'h000fffff)>>2)+3);
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
