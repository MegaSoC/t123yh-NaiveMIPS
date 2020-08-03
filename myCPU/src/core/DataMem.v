`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2019/07/02 09:49:48
// Design Name:
// Module Name: DataMem
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module DataMem(
        input   Clk,
        input	[31:0]	PC,
        input   [31:0]  DataAddr,
        input   [31:0]  WriteData,
        input   [3:0]   WriteEnble,
        output  [31:0]  ReadData
    );
    reg [31:0] mem[4095:0];
    integer i;
    initial begin
        for(i=0;i<4096;i=i+1)
            mem[i]=0;
    end
    wire [9:0] Offset = DataAddr[11:2];
    assign  ReadData    =   mem[Offset];//具体多少我忘记了
    always  @   (posedge Clk) begin
        mem[DataAddr[31:2]][7:0]    <=  WriteEnble[0]   ?   WriteData[7:0]  :   mem[DataAddr[31:2]][7:0];
        mem[DataAddr[31:2]][15:8]   <=  WriteEnble[1]   ?   WriteData[15:8]  :   mem[DataAddr[31:2]][15:8];
        mem[DataAddr[31:2]][23:16]    <=  WriteEnble[2]   ?   WriteData[23:16]  :   mem[DataAddr[31:2]][23:16];
        mem[DataAddr[31:2]][31:24]    <=  WriteEnble[3]   ?   WriteData[31:24]  :   mem[DataAddr[31:2]][31:24];
        if(|WriteEnble)
            $display("@%h: *%h <= %h", PC, DataAddr,WriteData);

        //$display("%d@%h: *%h <= %h", $time,PC, DataAddr,WriteData);
    end
endmodule
