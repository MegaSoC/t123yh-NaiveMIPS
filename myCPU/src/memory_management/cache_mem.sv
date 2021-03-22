`include "def.svh"

module data_ram #(
	parameter INDEX_WIDTH = 7,
	parameter HAS_FORWARD = 1
)(
    input  logic i_clk,
    input  logic i_rst,
 
    input  logic i_wen,
    input  logic [3:0] i_wbyteen,
    input  logic [INDEX_WIDTH - 1 : 0]  i_raddr,
    input  logic [INDEX_WIDTH - 1 : 0]  i_waddr,
    input  word  i_wdata,
    output word  o_rdata
);

word w_rdata, w_wdata;
logic w_isforward, r_isforward;
generate 
if (HAS_FORWARD == 1) begin
	assign w_isforward = i_wen && i_raddr == i_waddr;
	assign o_rdata = r_isforward ? w_wdata : w_rdata;
end else begin
	assign w_isforward = '0;
	assign o_rdata = w_rdata;	
end
endgenerate

always_ff @(posedge i_clk) begin
    if(i_rst)begin
        r_isforward <= 0;
    end
    else begin
        r_isforward <= w_isforward;
    end
end

// data_mem data_mem (
//   .clka(i_clk),            // input wire clka
//   .rsta(i_rst),            // input wire rsta
//   .wea(4'b0),              // input wire [3 : 0] wea
//   .addra(i_raddr|{INDEX_WIDTH{w_isforward}}),          // input wire [5 : 0] addra
//   .dina(w_din),            // input wire [31 : 0] dina
//   .douta(w_rdata),          // output wire [31 : 0] douta
//   .clkb(i_clk),            // input wire clkb
//   .web({4{i_wen}} & i_wbyteen),              // input wire [3 : 0] web
//   .addrb(i_waddr),          // input wire [5 : 0] addrb
//   .dinb(i_wdata),            // input wire [31 : 0] dinb
//   .doutb(w_wdata),          // output wire [31 : 0] doutb
//   .rsta_busy(),  // output wire rsta_busy
//   .rstb_busy()  // output wire rstb_busy
// );

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
		.ena            ( 1'b1   ),
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
		.enb            ( 1'b1   ),
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

    
endmodule

module tag_ram #(
    parameter INDEX_WIDTH = 7,
    parameter TAG_WIDTH = 20
)(
    input  logic i_clk,
    input  logic i_rst,
 
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

// tag_mem tag_mem (
//   .clka(i_clk),    // input wire clka
//   .rsta(i_rst),    // input wire rsta
//   .wea(1'b0 ),      // input wire [0 : 0] wea
//   .addra(i_raddr|{INDEX_WIDTH{w_isforward}}),  // input wire [5 : 0] addra
//   .dina(i_wtag),    // input wire [20 : 0] dina
//   .douta(w_rtag),  // output wire [20 : 0] douta
//   .clkb(i_clk),    // input wire clkb
//   .web(i_wen),      // input wire [0 : 0] web
//   .addrb(i_waddr),  // input wire [5 : 0] addrb
//   .dinb(i_wtag),    // input wire [20 : 0] dinb
//   .doutb(w_wtag)  // output wire [20 : 0] doutb
// );

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
		.ena            ( 1'b1   ),
		.regcea         ( 1'b0  ),
		.wea            ( 1'b0 ), 
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
		.enb            ( 1'b1   ),
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

    
endmodule
