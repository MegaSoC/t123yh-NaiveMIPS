`timescale 1ns / 1ps
`define TextAddr (32'hbfc00000)
`define IDLE 2'b01
`define FETCH 2'b10

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
    wire [1:0] nextState ;


    always @ (posedge clk) begin
        if (reset | expFlush ) begin
            iPcReg <= 0;
            iInstr <= 0;
            iInstMiss <= 0;
            iInstIllegal <= 0;
            iInstInvalid <= 0;
        end
        else if (nextState==`FETCH) begin
            iPcReg <= pcReg;
            iInstr <=(instUncached)? instSramData: iIcacheRdata;
            iInstMiss <= instMiss;
            iInstIllegal <= instIllegal;
            iInstInvalid <= instInvalid;
        end
        if(reset) begin
            pcReg<=`TextAddr;
        end

        else if (dStall |dmStall ) begin
            pcReg<=pcReg;
        end
        else if (nextState==`FETCH) begin
            pcReg<=dNpc;
        end
    end
    assign tlb_reg_iaddr = reset ? `TextAddr : (dStall |dmStall ) ? pcReg : (nextState==`FETCH) ? dNpc : pcReg;


    assign iNextNotReady = (!dStall & !dmStall & ((instUncached & instSramValid ) | (!instUncached & !icacheStall ))) ;
    assign nextState = (!dStall & !dmStall & ((instUncached & instSramValid ) | (!instUncached & !icacheStall ))) ? `FETCH : `IDLE ;

endmodule

