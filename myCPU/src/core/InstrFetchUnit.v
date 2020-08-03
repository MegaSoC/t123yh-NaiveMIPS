`timescale 1ns / 1ps

`define TextAddr (32'hbfc00000)
module InstrFetchUnit(
        input Clk,
        input Clr,
        input is_exception,
        input stall,
        input [31:0] exception_new_pc,
        input [31:0]NewPcAddr,
        output reg [31:0] PC,
        output [31:0] im_pc ,

                input en
            );
        initial begin
        PC<= `TextAddr;
    end
    
    assign im_pc = PC;
            
    always @ (posedge Clk)begin
        if(Clr) begin
            PC<=`TextAddr;
        end
                else if (stall) begin
            PC<=PC;
        end        else if (en) begin            PC<=NewPcAddr;
        end
    end

endmodule
