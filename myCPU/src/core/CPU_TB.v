`timescale 1ns / 1ps


module CPU_TB;

        reg Clk;
    reg Clr;

        TopLevel TopLevel (
                 .Clk(Clk),
                 .Clr(Clr)
             );

    initial begin
                Clk = 0;
        Clr = 0;
    end
    always #1 Clk=~Clk;

    
endmodule

