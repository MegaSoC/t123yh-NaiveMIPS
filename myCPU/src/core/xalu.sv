`include "constants.svh"

module XALU(
           input reset,
           input clk,
           input start,
           input [31:0] A,
           input [31:0] B,
           input [3:0] ctrl,
           output reg busy,
           output reg [31:0] HI,
           output reg [31:0] LO
       );

reg [31:0] bufA, bufB;
reg bufStart;
reg [3:0] ctrl_reg;
logic ready, sign;
Multiplier mult(.clk(clk), .A(bufA), .B(bufB), .start(bufStart), .sign(sign));
Divider div(.clk(clk), .A(bufA), .B(bufB), .start(bufStart), .sign(sign));

always_comb begin
    ready = 0;
    sign = 'bx;
    case (ctrl_reg)
        `mtMultiply, `mtMultiplyUnsigned,`mtMSUB, `mtMADD, `mtMADDU, `mtMSUBU:
            ready = !mult.busy;
        `mtDivide, `mtDivideUnsigned:
            ready = !div.busy;
    endcase
    case (ctrl_reg)
        `mtDivideUnsigned, `mtMultiplyUnsigned, `mtMADDU, `mtMSUBU:
            sign = 0;
        `mtDivide, `mtMultiply, `mtMSUB, `mtMADD:
            sign = 1;
    endcase
end

always @(posedge clk) begin
    if (reset) begin
        HI <= 0;
        LO <= 0;
        busy <= 0;
        bufA <= 0;
        bufB <= 0;
        bufStart <= 0;
        ctrl_reg <= 0;
    end
    else if (start) begin
        if (ctrl == `mtSetHI) begin
            HI <= A;
        end
        else if (ctrl == `mtSetLO) begin
            LO <= A;
        end
        else begin
            bufA <= A;
            bufB <= B;
            ctrl_reg <= ctrl;
            busy <= 1;
            bufStart <= 1;
        end
    end
    else if (busy) begin
        if (bufStart)
            bufStart <= 0;
        else if (ready) begin
            busy <= 0;
            case (ctrl_reg)
                `mtMultiply, `mtMultiplyUnsigned:
                    {HI, LO} <= mult.result;
                `mtMSUB, `mtMSUBU:
                    {HI, LO} <= {HI, LO} - mult.result;
                `mtMADD, `mtMADDU:
                    {HI, LO} <= {HI, LO} + mult.result;
                `mtDivide, `mtDivideUnsigned: begin
                    {HI, LO} <= div.result;
                end
            endcase
        end
    end
end

endmodule
