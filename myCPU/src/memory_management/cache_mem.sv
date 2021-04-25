`include "def.svh"

module data_ram #(
	parameter INDEX_WIDTH = 7,
	parameter C_ASIC_SRAM = 0
)(
    input  logic i_clk,
    input  logic i_rst,
 
    input  logic i_wen,
	input  logic i_ren,
    input  logic [3:0] i_wbyteen,
    input  logic [INDEX_WIDTH - 1 : 0]  i_raddr,
    input  logic [INDEX_WIDTH - 1 : 0]  i_waddr,
    input  word  i_wdata,
    output word  o_rdata
);

word w_rdata, w_wdata;
logic w_isforward, r_wen;
logic [INDEX_WIDTH - 1 : 0] r_raddr, r_waddr;
assign w_isforward = r_wen && r_raddr == r_waddr;
assign o_rdata = w_isforward ? w_wdata : w_rdata;

always_ff @(posedge i_clk) begin
    if(i_rst)begin
		r_raddr <= '0;
		r_waddr <= '0;
		r_wen <= 0;
    end
    else begin
		r_wen <= i_wen;
		r_raddr <= i_raddr;
		r_waddr <= i_waddr;
    end
end

generate
if (C_ASIC_SRAM) begin
/*
    always assert ((1 << INDEX_WIDTH) == 1024) else
        $fatal("data_ram memory depth mismatch, should be 1024!");
*/
    
    S018DP_RAM_DP_W1024_B32_M4_BW data_mem(
      .CLKA(i_clk),
      .CLKB(i_clk),
      .CENA(~i_ren),
      .CENB(~i_wen),
      .WENA(~i_ren),
      .WENB(~i_wen),
      .AA(i_raddr),
      .AB(i_waddr),
      .BWENA(32'hFFFFFFFF),
      .BWENB(~{{8{i_wbyteen[3]}}, {8{i_wbyteen[2]}}, {8{i_wbyteen[1]}}, {8{i_wbyteen[0]}}}),
      .DA(32'h0),
      .DB(i_wdata),
      .QA(w_rdata),
      .QB(w_wdata)
    );
end else begin

xpm_memory_tdpram #(
		// Common module parameters
		.MEMORY_SIZE(32 << INDEX_WIDTH),
		.MEMORY_PRIMITIVE("auto"),
		.CLOCKING_MODE("common_clock"),
		.USE_MEM_INIT(0),
		.WAKEUP_TIME("disable_sleep"),
		.MESSAGE_CONTROL(0),

		// Port A module parameters
        .WRITE_DATA_WIDTH_A(32),
        .BYTE_WRITE_WIDTH_A(8),
		.READ_DATA_WIDTH_A(32),
		.READ_RESET_VALUE_A("0"),
		.READ_LATENCY_A(1),
		.WRITE_MODE_A("write_first"),

		// Port B module parameters
        .WRITE_DATA_WIDTH_B(32),
        .BYTE_WRITE_WIDTH_B(8),
		.READ_DATA_WIDTH_B(32),
		.READ_RESET_VALUE_B("0"),
		.READ_LATENCY_B(1),
		.WRITE_MODE_B("write_first")
    ) xpm_mem (
		// Common module ports
		.sleep          ( 1'b0  ),

		// Port A module ports
		.clka           ( i_clk   ),
		.rsta           ( i_rst   ),
		.ena            ( i_ren   ),
		.regcea         ( 1'b0  ),
		.wea            ( 4'b0 ), 
		.addra          ( i_raddr ), 
		.dina           ( '0 ),
		.injectsbiterra ( 1'b0  ), // do not change
		.injectdbiterra ( 1'b0  ), // do not change
		.douta          ( w_rdata ),
		.sbiterra       (       ), // do not change
		.dbiterra       (       ), // do not change
 
		// Port B module ports
		.clkb           ( i_clk   ),
		.rstb           ( i_rst   ),
		.enb            ( i_wen   ),
		.regceb         ( 1'b0  ),
		.web            ({4{i_wen}} & i_wbyteen), 
		.addrb          ( i_waddr ),
		.dinb           ( i_wdata ), 
		.injectsbiterrb ( 1'b0  ), // do not change
		.injectdbiterrb ( 1'b0  ), // do not change
		.doutb          ( w_wdata ),
		.sbiterrb       (       ), // do not change
		.dbiterrb       (       )  // do not change
    );
end
endgenerate
    
endmodule

module tag_ram #(
    parameter INDEX_WIDTH = 7,
    parameter TAG_WIDTH = 20,
    parameter C_ASIC_SRAM = 0
)(
    input  logic i_clk,
    input  logic i_rst,
	
	input  logic i_ren,
    input  logic i_wen,
    input  logic [INDEX_WIDTH - 1 : 0]  i_raddr,
    input  logic [INDEX_WIDTH - 1 : 0]  i_waddr,
    input  logic [TAG_WIDTH : 0]  i_wtag,
    output logic [TAG_WIDTH : 0]  o_rtag
);

logic [TAG_WIDTH : 0] w_rtag, w_wtag;
logic w_isforward, r_isforward;
assign w_isforward = i_wen && i_raddr == i_waddr;
assign o_rtag = r_isforward ? w_wtag : w_rtag;

always_ff @(posedge i_clk) begin
    if(i_rst)begin
        r_isforward <= 0;
    end
    else begin
        r_isforward <= w_isforward;
    end
end

generate
if (C_ASIC_SRAM) begin
/*
    always assert ((1 << INDEX_WIDTH) == 64) else
        $fatal("tag_ram memory depth mismatch, should be 64!");

    always assert ((TAG_WIDTH + 1) == 21) else
        $fatal("tag_ram memory width mismatch, should be 21!");
*/
    
    S018DP_RAM_DP_W64_B21_M4 data_mem (
        .CLKA(i_clk),
        .CLKB(i_clk),
        .CENA(~i_ren),
        .CENB(~i_wen),
        .WENA(~i_ren),
        .WENB(~i_wen),
        .AA(i_raddr),
        .AB(i_waddr),
        .DA({(TAG_WIDTH+1){1'b0}}),
        .DB(i_wtag),
        .QA(w_rtag),
        .QB(w_wtag)
    );
end else begin
xpm_memory_tdpram #(
		// Common module parameters
		.MEMORY_SIZE((TAG_WIDTH + 1) << INDEX_WIDTH),
		.MEMORY_PRIMITIVE("auto"),
		.CLOCKING_MODE("common_clock"),
		.USE_MEM_INIT(0),
		.WAKEUP_TIME("disable_sleep"),
		.MESSAGE_CONTROL(0),

		// Port A module parameters
        .WRITE_DATA_WIDTH_A(TAG_WIDTH + 1),
        .BYTE_WRITE_WIDTH_A(TAG_WIDTH + 1),
		.READ_DATA_WIDTH_A(TAG_WIDTH + 1),
		.READ_RESET_VALUE_A("0"),
		.READ_LATENCY_A(1),
		.WRITE_MODE_A("write_first"),

		// Port B module parameters
        .WRITE_DATA_WIDTH_B(TAG_WIDTH + 1),
        .BYTE_WRITE_WIDTH_B(TAG_WIDTH + 1),
		.READ_DATA_WIDTH_B(TAG_WIDTH + 1),
		.READ_RESET_VALUE_B("0"),
		.READ_LATENCY_B(1),
		.WRITE_MODE_B("write_first")
    ) xpm_mem (
		// Common module ports
		.sleep          ( 1'b0  ),

		// Port A module ports
		.clka           ( i_clk   ),
		.rsta           ( i_rst   ),
		.ena            ( i_ren   ),
		.regcea         ( 1'b0  ),
		.wea            ( '0 ), 
		.addra          ( i_raddr ), 
		.dina           ( i_wtag ),
		.injectsbiterra ( 1'b0  ), // do not change
		.injectdbiterra ( 1'b0  ), // do not change
		.douta          ( w_rtag ),
		.sbiterra       (       ), // do not change
		.dbiterra       (       ), // do not change
 
		// Port B module ports
		.clkb           ( i_clk   ),
		.rstb           ( i_rst   ),
		.enb            ( i_wen   ),
		.regceb         ( 1'b0  ),
		.web            (i_wen), 
		.addrb          ( i_waddr ),
		.dinb           ( i_wtag ), 
		.injectsbiterrb ( 1'b0  ), // do not change
		.injectdbiterrb ( 1'b0  ), // do not change
		.doutb          ( w_wtag ),
		.sbiterrb       (       ), // do not change
		.dbiterrb       (       )  // do not change
    );
end
endgenerate
    
endmodule
