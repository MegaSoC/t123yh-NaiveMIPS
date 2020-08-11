`timescale 1ns / 1ps
`define TextAddr (32'hbfc00000)

module I(
        input clk,
        input reset,
        input dmStall,
        input expFlush,
        input instSramValid,
        input dStall,
        input [31:0] dNpc,
        input [31:0] instSramData,

        input instMiss,
        input instIllegal,
        input instInvalid,
        output reg [31:0] iPcReg,
        output [31:0] iPcWire,
        output [31:0] tlb_reg_iaddr,
        output reg [31:0] iInstr,

        output reg iInstMiss,
        output reg iInstIllegal,
        output reg iInstInvalid,
        input icacheStall,
        input instUncached,
        input wire [31:0] iIcacheRdata,
        output wire iNextNotReady
    );


    reg [31:0] pcReg;
    assign iPcWire = pcReg;

    always_ff @ (posedge clk)begin
        if(reset)begin
            iPcReg <= 0;
            iInstr <= 0;
            iInstMiss <= 0;
            iInstIllegal <= 0;
            iInstInvalid <= 0;
            pcReg<=`TextAddr;
        end
        else if(expFlush)begin
            iPcReg <= 0;
            iInstr <= 0;
            iInstMiss <= 0;
            iInstIllegal <= 0;
            iInstInvalid <= 0;
            if  (!dStall & !dmStall & ((instUncached & instSramValid ) | (!instUncached & !icacheStall ))) begin
                pcReg<=dNpc;
            end
        end
        else begin
            if  (!dStall & !dmStall & ((instUncached & instSramValid ) | (!instUncached & !icacheStall ))) begin
                pcReg<=dNpc;
                iPcReg <= pcReg;
                iInstr <=(instUncached)? instSramData: iIcacheRdata;
                iInstMiss <= instMiss;
                iInstIllegal <= instIllegal;
                iInstInvalid <= instInvalid;
            end
        end
    end


    assign iNextNotReady = (dStall | dmStall | ((!instUncached | !instSramValid ) & (instUncached | icacheStall ))) ;

endmodule

