`timescale 1ns / 1ps
module InstrMem(
        input [31:0] Addr,
        output [31:0] Data
    );
    reg [31:0] instr[4096:0];
    assign Data=(Addr[1:0]!=0 || Addr<32'h3000 || Addr>32'h4fff)? 0:
           instr[(Addr-32'h3000)>>2];

    integer i;
    initial begin
        $readmemh("code.txt",instr);
                /* for(i=0;i<9;i=i+1) $display("%d = %h",i,instr[i]);*/
    end


endmodule
