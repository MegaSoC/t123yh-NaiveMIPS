`include "constants.v"

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
reg [3:0] op;

logic ready, sign;
Multiplier mult(.clk(clk), .A(A), .B(B), .start(start), .sign(sign));
Divider div(.clk(clk), .A(A), .B(B), .start(start), .sign(sign));

always_comb begin
    ready = 0;
    case (op)
        `mtMultiply, `mtMultiplyUnsigned,`mtMSUB, `mtMADD, `mtMADDU:
            ready = !mult.busy;
        `mtDivide, `mtDivideUnsigned:
            ready = !div.busy;
    endcase
    case (op)
        `mtDivideUnsigned, `mtMultiplyUnsigned, `mtMADDU:
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
    end
    else if (start) begin
        if (ctrl == `mtSetHI) begin
            HI <= A;
        end
        else if (ctrl == `mtSetLO) begin
            LO <= A;
        end
        else begin
            op <= ctrl;
            busy <= 1;
        end
    end
    else if (busy) begin
        if (ready) begin
            busy <= 0;
            case (op)
                `mtMultiply, `mtMultiplyUnsigned:
                    {HI, LO} <= mult.result;
                `mtMSUB:
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
