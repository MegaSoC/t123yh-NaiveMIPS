`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   17:59:46 07/05/2019
// Design Name:   TopLevel
// Module Name:   D:/LongSonCPU/SimpleCPU/src/CPU_TB.v
// Project Name:  SimpleCPU
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: TopLevel
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module CPU_TB;

    // Inputs
    reg Clk;
    reg Clr;

    // Instantiate the Unit Under Test (UUT)
    TopLevel TopLevel (
                 .Clk(Clk),
                 .Clr(Clr)
             );

    initial begin
        // Initialize Inputs
        Clk = 0;
        Clr = 0;
    end
    always #1 Clk=~Clk;

    // Add stimulus here

endmodule

