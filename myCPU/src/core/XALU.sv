`include "my_global.vh"

module XALU(
        input Clk,
        input Clr,
        input [`INSTRBUS_WIDTH-1:0] InstrBus,

        input [31:0] XALU_A,
        input [31:0] XALU_B,
        output [31:0] XALU_HI,
        output [31:0] XALU_LO,

        output XALU_Busy,
        input Intreq

    );

`define MULT_STAGES 7
wire `INSTR_SET;
assign {`INSTR_SET} = InstrBus;
reg mult_i, multu_i, div_i, divu_i;
wire XALU_Start = (!Intreq)&(mult|multu|div|divu|mul);
reg ready;
assign XALU_Busy = !ready;
wire div_o_v, divu_o_v, mult_o_v, multu_o_v, dout_v;
wire [63:0] div_o, divu_o, mult_o, multu_o;
reg  [3 :0] op_v;
reg  [2 :0] count;
reg  [31:0] HI, LO;

reg [31:0] a_reg,b_reg;

assign dout_v = div_o_v | divu_o_v | mult_o_v | multu_o_v;

assign XALU_HI = HI;
assign XALU_LO = LO;

always @(posedge Clk) begin
    if (Clr) begin
        {HI, LO} <= 64'b0;
        a_reg <= 32'd0;
        b_reg <= 32'd0;
    end else if (mthi) begin
        HI <= XALU_A;
    end else if (mtlo) begin
        LO <= XALU_A;
    end
    else if (!ready && dout_v) begin
        if (mult_o_v) begin
            {HI, LO} <= mult_o;
        end
        else if (multu_o_v) begin
            {HI, LO} <= multu_o;
        end
        else if (div_o_v) begin
            {LO, HI} <= div_o;
        end
        else if (divu_o_v) begin
            {LO, HI} <= divu_o;
        end
    end
end

// control ready
always @(posedge Clk) begin
    if (Clr) begin
        ready   <= 1'b1;
        op_v    <= 3'b0;
    end 
    else if (XALU_Start) begin
        ready   <= 1'b0;
        a_reg <= XALU_A;
        b_reg <= XALU_B;
        mult_i <= mul || mult;
        multu_i <= multu;
        div_i <= div;
        divu_i <= divu;
    end
    else if (dout_v) begin
        ready   <= 1'b1;
        op_v    <= 3'b0;
    end
end

//control mult/multu dout_valid
assign mult_o_v = (mult_i) && count == `MULT_STAGES;
assign multu_o_v = (multu_i) && count == `MULT_STAGES;

always @(posedge Clk) begin
    if (Clr || XALU_Start) begin
        count <= 3'b0;
    end
    else if (mult_i || multu_i) begin
        count <= count + 1;
    end
end

mult_signed my_mult_signed (
  .CLK(Clk),                    // input wire CLK
  .A(a_reg),                        // input wire [31 : 0] A
  .B(b_reg),                        // input wire [31 : 0] B
  .SCLR(ready),           // input wire SCLR
  .P(mult_o)                    // output wire [63 : 0] P
);

mult_unsigned my_mult_unsigned (
  .CLK(Clk),                    // input wire CLK
  .A(a_reg),                        // input wire [31 : 0] A
  .B(b_reg),                        // input wire [31 : 0] B
  .SCLR(ready),           // input wire SCLR
  .P(multu_o)                   // output wire [63 : 0] P
);

div_signed my_div_signed (
  .aclk(Clk),                       // input wire aclk
  .aresetn(~ready),
  .s_axis_divisor_tvalid(div_i),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tdata(b_reg),         // input wire [31 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(div_i),   // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tdata(a_reg),        // input wire [31 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(div_o_v),     // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(div_o)         // output wire [63 : 0] m_axis_dout_tdata
);

div_unsigned my_div_unsigned (
  .aclk(Clk),                       // input wire aclk
  .aresetn(~ready),
  .s_axis_divisor_tvalid(divu_i),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tdata(b_reg),         // input wire [31 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(divu_i),   // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tdata(a_reg),        // input wire [31 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(divu_o_v),    // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(divu_o)        // output wire [63 : 0] m_axis_dout_tdata
);

   
endmodule
