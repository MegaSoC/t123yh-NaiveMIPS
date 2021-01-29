module Multiplier(
    input clk,
    input resetn,
    input start,
    input sign,
    input [31:0] A,
    input [31:0] B,
    output [63:0] result,
    output busy
);

  wire [63:0] x_ext = {{32{A[31] & sign}}, A};
  wire [34:0] y_ext = {{2{B[31] & sign}}, B, 1'b0};
  wire [63:0] part_prod [16:0];     // partial product
  wire [16:0] part_switch [63:0];   // switched partial product
  wire [16:0] part_carry;
  assign busy = 0;

  genvar i, j;
  generate
    for (i=0; i<17; i=i+1) begin
      booth_gen #(.width(64))
      part_mul(
        .x(x_ext << 2*i),
        .y(y_ext[(i+1)*2:i*2]),
        .p(part_prod[i]),
        .c(part_carry[i])
      );
      for (j=0; j<64; j=j+1) begin
        assign part_switch[j][i] = part_prod[i][j];
      end
    end
  endgenerate

  reg [16:0] part_switch_reg [63:0];
  reg [16:0] part_carry_reg;
  integer k;
  always @(posedge clk) begin
    for (k=0; k<64; k=k+1) begin
      part_switch_reg[k] <= part_switch[k];
    end
    part_carry_reg <= part_carry;
  end

  wire [14:0] wallace_carry [64:0];
  assign wallace_carry[0] = part_carry_reg[14:0];
  wire [63:0] out_carry, out_sum;
  generate
    for (i=0; i<64; i=i+1) begin
      wallace_unit_17 u_wallace(
        .in(part_switch_reg[i]),
        .cin(wallace_carry[i]),
        .c(out_carry[i]),
        .out(out_sum[i]),
        .cout(wallace_carry[i+1])
      );
    end
  endgenerate
  
`ifdef MUL_BARRIER_2
  reg [63:0] add_a_reg, add_b_reg;
  reg add_cin_reg;
  
  always @(posedge clk) begin
    add_a_reg <= {out_carry[62:0], part_carry_reg[15]};
    add_b_reg <= out_sum;
    add_cin_reg <= part_carry_reg[16];
  end
  
  assign result = add_a_reg + add_b_reg + add_cin_reg;
`else
  assign result = {out_carry[62:0], part_carry_reg[15]} + out_sum + part_carry_reg[16];
`endif

endmodule
