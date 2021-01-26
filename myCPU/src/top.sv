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
    
    word w_inst_sram_addr, w_i_paddr, w_data_sram_vaddr, w_data_sram_wdata;
    logic [2:0] w_data_sram_size;
    logic w_data_sram_read, w_data_sram_write, w_inst_sram_readen;

    word w_d_outdata, w_i_inst;
    logic w_i_valid, w_d_valid;
    
    CPU core(
        .clk(aclk),
        .reset(global_reset),
        .irq(ext_int),
        
        .inst_sram_rdata(w_i_inst),
        .inst_sram_valid(w_i_valid),
        .inst_sram_addr(w_inst_sram_addr),
        .inst_sram_readen(w_inst_sram_readen),

        .data_sram_rdata(w_d_outdata),
        .data_sram_valid(w_d_valid),
        .data_sram_vaddr(w_data_sram_vaddr),
        .data_sram_read(w_data_sram_read),
        .data_sram_write(w_data_sram_write),
        .data_sram_wdata(w_data_sram_wdata),
        .data_sram_size(w_data_sram_size),
        
        .debug_wb_pc(debug_wb_pc),
        .debug_wb_rf_wdata(debug_wb_rf_wdata),
        .debug_wb_rf_wnum(debug_wb_rf_wnum),
        .debug_wb_rf_wen(debug_wb_rf_wen)
    );
    
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

	              .i_i_valid1(w_inst_sram_readen),
                  .i_i_valid2(cache_valid2),
                  .i_i_npc(w_inst_sram_addr),
                  .i_i_phyaddr(i_paddr),
                  .i_i_cached(i_cached),
                  .o_i_valid(w_i_valid),
                  .o_i_inst(w_i_inst),

                  .i_d_va(w_data_sram_vaddr),
                  .i_d_phyaddr(d_paddr),
                  .i_d_cached(d_cached),
                  .i_d_read(w_data_sram_read),
                  .i_d_write(w_data_sram_write),
                  .i_d_size(w_data_sram_size),
                  .i_d_indata(w_data_sram_wdata),
                  .o_d_valid(w_d_valid),
                  .o_d_outdata(w_d_outdata),
                  
                  .i_icache_instr(CACHE_NOP),
                  .i_icache_instr_tag('0),
                  .i_icache_instr_addr('0),

                  .i_dcache_instr(CACHE_NOP),
                  .i_dcache_instr_tag('0),
                  .i_dcache_instr_addr('0),

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

endmodule
