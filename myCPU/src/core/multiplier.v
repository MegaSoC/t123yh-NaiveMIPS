module Multiplier(
    input clk,
    input [31:0] A,
    input [31:0] B,
    output reg [63:0] result,
    input start,
    input sign,
    output busy
);

wire negA = A[31] && sign, negB = B[31] && sign;
reg negResult;
reg [4:0] timer;
wire [63:0] ans;
assign busy = timer[0];
always @(posedge clk) begin
    if (start) begin
        timer <= 'hF;
        negResult <= negA != negB;
        result <= 'bx;
    end else begin
        timer <= timer >> 1;
        if (timer[1:0] == 1) begin
            result <= negResult ? -ans : ans;
        end
    end
end

wire [63:0] A64 = {32'b0, negA ? -A : A}, B64 = {32'b0, negB ? -B : B};
wire [63:0] wire0[31:0];
reg [63:0] tree0[15:0];
reg [63:0] tree1[7:0];
reg [63:0] tree2[3:0];
reg [63:0] tree3[1:0];
assign ans = tree3[0] + tree3[1];

generate
    genvar i;
    for(i=0; i<32; i=i+1)
    begin
        assign wire0[i] = A64[i] == 0 ? 0: (B64 << i);
    end

    for(i=0; i<16; i=i+1)
    begin
        always @(posedge clk) tree0[i] <= wire0[i] + wire0[31-i];
    end

    for(i=0; i<8; i=i+1)
    begin
        always @(posedge clk) tree1[i] <= tree0[i] + tree0[15-i];
    end

    for(i=0; i<4; i=i+1)
    begin
        always @(posedge clk) tree2[i] <= tree1[i] + tree1[7-i];
    end

    for(i=0; i<2; i=i+1)
    begin
        always @(posedge clk) tree3[i] <= tree2[i] + tree2[3-i];
    end
endgenerate

endmodule
