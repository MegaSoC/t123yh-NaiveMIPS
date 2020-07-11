`timescale 1ns / 1ps

module MultCore(
	input	Clk, 
	input	[31:0]	A, 
	input	[31:0]	B, 
	output	[31:0]	HI,
	output	[31:0]	LO,
	input	start, 
	input	sign,
	input	[1:0] WriteEnable,
	output	Busy
    );
//Unsigned Mult Only
	wire [31:0] PosiA = (A[31]&sign)?-A:A,
				PosiB = (B[31]&sign)?-B:B;
	wire	[63:0]	A_Ext = {32'b0,PosiA},
					B_Ext = {32'b0,PosiB};
	wire	[63:0]	Wire_0[31:0];
	reg		[63:0]	Buf_0[15:0],
					Buf_1[7:0],
					Buf_2[3:0],
					Buf_3[1:0];
	
	reg	[63:0]	C;
	reg [4:0]	T;
	wire [1:0] Nega;
	assign	Nega[1] = (A[31]&sign),
			Nega[0]	= (B[31]&sign);
	

	reg [1:0] Nega_Buf;
	assign Busy = T[1];
	assign {HI,LO}=C;
	
	wire	[63:0]	Ans_Wire = Buf_3[0] + Buf_3[1];
	always @ (posedge Clk) begin
		T <= start	?	5'b01111:
						(T>>1);
		Nega_Buf <= start ? Nega:Nega_Buf;
		C <=	T[1:0]==2'b01	?	(^Nega_Buf	?	-Ans_Wire:Ans_Wire):
				WriteEnable[1]	?	{A,C[31:0]}:
				WriteEnable[0]	?	{C[63:32],A}:
								C;
	end
	
	
	generate
		genvar i;
		for(i=0;i<32;i=i+1)
		begin:OffsetData
			assign Wire_0[i] = A_Ext[i]==0	?	0:(B_Ext<<i);
		end
		
		for(i=0;i<16;i=i+1)
		begin:Layer_0
			always @ (posedge Clk)
				Buf_0[i] <= Wire_0[i] + Wire_0[31-i];
		end
		
		for(i=0;i<8;i=i+1)
		begin:Layer_1
			always @ (posedge Clk)
				Buf_1[i] <= Buf_0[i] + Buf_0[15-i];
		end
		
		for(i=0;i<4;i=i+1)
		begin:Layer_2
			always @ (posedge Clk)
				Buf_2[i] <= Buf_1[i] + Buf_1[7-i];
		end
		
		for(i=0;i<2;i=i+1)
		begin:Layer_3
			always @ (posedge Clk)
				Buf_3[i] <= Buf_2[i] + Buf_2[3-i];
		end
		
	endgenerate
	
	

endmodule
