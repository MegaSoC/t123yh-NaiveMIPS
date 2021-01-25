`include "def.svh"

module mycpu_top(
        input [5:0] ext_int, // ext_int[5] is ignored!

        input aclk,
        input aresetn,

        output [3 :0] arid ,
        output [31:0] araddr ,
        output [3 :0] arlen ,
        output [2 :0] arsize ,
        output [1 :0] arburst ,
        output [1 :0] arlock ,
        output [3 :0] arcache ,
        output [2 :0] arprot ,
        output arvalid ,
        input arready ,

        input [3 :0] rid ,
        input [31:0] rdata ,
        input [1 :0] rresp ,
        input rlast ,
        input rvalid ,
        output rready ,

        output [3 :0] awid ,
        output [31:0] awaddr ,
        output [3 :0] awlen ,
        output [2 :0] awsize ,
        output [1 :0] awburst ,
        output [1 :0] awlock ,
        output [3 :0] awcache ,
        output [2 :0] awprot ,
        output awvalid ,
        input awready ,

        output [3 :0] wid ,
        output [31:0] wdata ,
        output [3 :0] wstrb ,
        output wlast ,
        output wvalid ,
        input wready ,

        input [3 :0] bid ,
        input [1 :0] bresp ,
        input bvalid ,
        output bready ,

        (* mark_debug = "true" *) output wire [31:0] debug_wb_pc,
        (* mark_debug = "true" *) output wire [3:0] debug_wb_rf_wen,
        (* mark_debug = "true" *) output wire [4:0] debug_wb_rf_wnum,
        (* mark_debug = "true" *) output wire [31:0] debug_wb_rf_wdata,
        (* mark_debug = "true" *) output [31:0] debug_i_pc,
        (* mark_debug = "true" *) output [31:0] debug_i_instr
    );

    reg myaresetn;
    reg [6:0] resetCounter;
    always_ff @(posedge aclk) begin
        if (!aresetn) begin
            myaresetn <= 1'b0;
            resetCounter <= 7'b0;
        end
        if (aresetn & !myaresetn) begin
            resetCounter <= resetCounter + 1;
        end
        if (aresetn & !myaresetn & (&resetCounter)) begin
            myaresetn <= 1'b1;
        end
    end

    wire global_reset = !(aresetn && myaresetn);
    
    CPU core(
        .clk(aclk),
        .reset(global_reset),
        .irq(ext_int),
        
        .debug_wb_pc(debug_wb_pc),
        .debug_wb_rf_wdata(debug_wb_rf_wdata),
        .debug_wb_rf_wnum(debug_wb_rf_wnum),
        .debug_wb_rf_wen(debug_wb_rf_wen)
    );


     cache_soc 
   #(
       .ICACHE_WORD_PER_LINE(`ICACHE_WORD_PER_LINE),
       .ICACHE_SET_ASSOC(`ICACHE_SET_ASSOC),
       .ICACHE_SIZE(`ICACHE_SIZE),
       .ICACHE_TAG_WIDTH(`ICACHE_TAG_WIDTH),
       .DCACHE_LINE_WORD_NUM(`DCACHE_WORD_PER_LINE),
       .DCACHE_SET_ASSOC(`DCACHE_SET_ASSOC),
       .DCACHE_SIZE(`DCACHE_SIZE),
       .DCACHE_TAG_WIDTH(`DCACHE_TAG_WIDTH),
       .MEM_WRITE_FIFO_DEPTH(`MEM_WRITE_FIFO_DEPTH)
   )
    cache(
                  .i_clk(aclk),
                  .i_rst(global_reset),

	              .i_dcache_instr(CACHE_NOP),
                  .i_icache_instr(CACHE_NOP),

                  .arid,
                  .araddr,
                  .arlen,
                  .arsize,
                  .arburst,
                  .arlock,
                  .arcache,
                  .arprot,
                  .arvalid,
                  .arready,

                  .rid,
                  .rdata,
                  .rresp,
                  .rlast,
                  .rvalid,
                  .rready,

                  .awid,
                  .awaddr,
                  .awlen,
                  .awsize,
                  .awburst,
                  .awlock,
                  .awcache,
                  .awprot,
                  .awvalid,
                  .awready,

                  .wid,
                  .wdata,
                  .wstrb,
                  .wlast,
                  .wvalid,
                  .wready,

                  .bid,
                  .bresp,
                  .bvalid,
                  .bready

    );

    assign core.inst_sram_valid = cache.o_i_valid;
    assign core.inst_sram_rdata = cache.o_i_inst;

    reg [31:0] i_paddr;
    reg cache_valid2;
    reg i_cached;
    always @(posedge aclk) begin
        if (global_reset) begin
            i_paddr <= 0;
            cache_valid2 <= 0;
            i_cached <= 0;
        end else begin
            i_paddr <= {3'b0,core.inst_sram_addr[28:0]};
            i_cached <= core.inst_sram_addr[31:29] == 3'b100;
            cache_valid2 <= core.inst_sram_readen;
        end
    end

    assign cache.i_i_valid1 = core.inst_sram_readen;
    assign cache.i_i_valid2 = cache_valid2;
    assign cache.i_i_npc = core.inst_sram_addr;
    assign cache.i_i_phyaddr = i_paddr;
    assign cache.i_i_cached = i_cached;

    reg [31:0] d_paddr;
    reg d_cached;
    always @(posedge aclk) begin
        if (global_reset) begin
            d_paddr <= 0;
            d_cached <= 0;
        end else begin
            d_paddr <= {3'b0, core.data_sram_vaddr[28:0]};
            d_cached <= core.data_sram_vaddr[31:29] == 3'b100;
        end
    end

    assign cache.i_d_va = core.data_sram_vaddr;
    assign cache.i_d_phyaddr = d_paddr;
    assign cache.i_d_cached = d_cached;
    assign cache.i_d_read = core.data_sram_read;
    assign cache.i_d_write = core.data_sram_write;
    assign cache.i_d_size = core.data_sram_size;
    assign cache.i_d_indata = core.data_sram_wdata;
    assign core.data_sram_rdata = cache.o_d_outdata;
    assign core.data_sram_valid = cache.o_d_valid;


endmodule
