`include "memory_management/def.svh"
`include "global.svh"

module mycpu_top #(
    parameter IMPLEMENT_LIKELY = 0,
    parameter C_ASIC_SRAM = 0
) (
        input [5:0] ext_int, // ext_int[5] is ignored!

        input aclk,
        input aresetn,
        output global_reset,

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

        output [31:0] debug_wb_pc,
        output [31:0] debug_wb_instr,
        output [3:0] debug_wb_rf_wen,
        output [4:0] debug_wb_rf_wnum,
        output [31:0] debug_wb_rf_wdata,
        output [31:0] debug_i_pc,
        output [31:0] debug_i_instr
    );

    (* mark_debug = "true" *) wire [3:0] _debug_wb_rf_wen = debug_wb_rf_wen;
    (* mark_debug = "true" *) wire [4:0] _debug_wb_rf_wnum = debug_wb_rf_wnum;
    (* mark_debug = "true" *) wire [31:0] _debug_wb_pc = debug_wb_pc;
    (* mark_debug = "true" *) wire [31:0] _debug_wb_instr = debug_wb_instr;
    (* mark_debug = "true" *) wire [31:0] _debug_wb_rf_wdata = debug_wb_rf_wdata;
    (* mark_debug = "true" *) wire [31:0] _debug_i_pc = debug_i_pc;
    (* mark_debug = "true" *) wire [31:0] _debug_i_instr = debug_i_instr;

    assign global_reset = !aresetn;

    word w_inst_sram_addr, w_w_inst_sram_paddr, w_data_sram_vaddr, w_data_sram_wdata;
    word data_sram_vaddr_last;
    logic data_sram_vaddr_valid_last;
    logic [2:0] w_data_sram_size;
    logic w_data_sram_read, w_data_sram_write, w_inst_sram_readen, w_data_sram_vaddr_valid;

    word w_d_outdata, w_i_inst;
    logic w_i_valid, w_d_valid;

    wire [3:0] w_data_sram_byteen;
    wire cp0_we, cp0_en_exp, cp0_ewr_bd, cp0_interrupt_pending, cp0_kseg0_cached, cp0_kernel_mode, cp0_privileged, cp0_erl;
    wire [31:0] cp0_rdata, cp0_wdata, cp0_ewr_epc, cp0_ewr_badVAddr, cp0_epc_o, cp0_exc_handler, cp0_int_handler, cp0_tlb_refill_handler, cp0_tagLo0, cp0_entryLo0, cp0_entryLo1, cp0_entryHi, cp0_index;
    ExcCode_t cp0_ewr_excCode;
    wire w_data_cache_op_valid, w_inst_cache_op_valid, w_mem_idle;
    cp0_number_t cp0_rw_number;
    cache_op dcache_op, icache_op;
    wire w_inst_sram_tlb_addressError, w_inst_sram_tlb_hit, w_inst_sram_tlb_valid;
    wire w_data_sram_tlb_addressError, w_data_sram_tlb_hit, w_data_sram_tlb_valid, w_data_sram_tlb_dirty, w_data_sram_tlb;
    wire w_data_sram_va_hold;
    tlb_op_t cpu_tlb_op;

    wire [31:0] tlb_entryLo0, tlb_entryLo1, tlb_entryHi, tlb_index;
    wire [11:0] tlb_pageMask, cp0_pageMask;

    // ====== TLB cache ======

    reg [31:0] itlb_delayed_va;
    reg itlb_delayed_cen;
    wire [31:0] itlb_cache_va;
    wire itlb_cache_match = itlb_delayed_va[31:12] == itlb_cache_va[31:12] && itlb_delayed_cen;
    always @(posedge aclk) begin
        itlb_delayed_va <= w_inst_sram_addr;
        itlb_delayed_cen <= w_inst_sram_readen;
    end

    // =======================

    CPU #(.IMPLEMENT_LIKELY(IMPLEMENT_LIKELY)) core(
        .clk(aclk),
        .reset(global_reset),

        .inst_sram_rdata(w_i_inst),
        .inst_sram_valid(w_i_valid),
        .inst_sram_addr(w_inst_sram_addr),
        .inst_sram_readen(w_inst_sram_readen),
        .inst_sram_addressError(w_inst_sram_tlb_addressError),
        .inst_sram_tlb_miss(!w_inst_sram_tlb_hit),
        .inst_sram_tlb_invalid(!w_inst_sram_tlb_valid),
        .inst_sram_tlb_ready(itlb_cache_match),
        .inst_cache_op(icache_op),
        .inst_cache_op_valid(w_inst_cache_op_valid),

        .data_sram_rdata(w_d_outdata),
        .data_sram_valid(w_d_valid),
        .data_sram_vaddr_valid(w_data_sram_vaddr_valid),
        .data_sram_vaddr(w_data_sram_vaddr),
        .data_sram_va_hold(w_data_sram_va_hold),
        .data_sram_read(w_data_sram_read),
        .data_sram_write(w_data_sram_write),
        .data_sram_wdata(w_data_sram_wdata),
        .data_sram_size(w_data_sram_size),
        .data_sram_byteen(w_data_sram_byteen),
        .data_cache_op(dcache_op),
        .data_cache_op_valid(w_data_cache_op_valid),
        .data_sram_tlb(w_data_sram_tlb),
        .data_sram_addressError(w_data_sram_tlb && w_data_sram_tlb_addressError),
        .data_sram_tlb_miss(w_data_sram_tlb && !w_data_sram_tlb_hit),
        .data_sram_tlb_invalid(w_data_sram_tlb && !w_data_sram_tlb_valid),
        .data_sram_tlb_modified(w_data_sram_write && !w_data_sram_tlb_dirty),

        .mem_idle(w_mem_idle),

        .debug_wb_pc(debug_wb_pc),
        .debug_wb_instr(debug_wb_instr),
        .debug_wb_rf_wdata(debug_wb_rf_wdata),
        .debug_wb_rf_wnum(debug_wb_rf_wnum),
        .debug_wb_rf_wen(debug_wb_rf_wen),
        .debug_i_pc(debug_i_pc),
        .debug_i_instr(debug_i_instr),

        .cp0_we(cp0_we),
        .cp0_number(cp0_rw_number),
        .cp0_wdata(cp0_wdata),
        .cp0_rdata(cp0_rdata),
        .cp0_epc(cp0_epc_o),
        .cp0_exc_handler(cp0_exc_handler),
        .cp0_int_handler(cp0_int_handler),
        .cp0_tlb_refill_handler(cp0_tlb_refill_handler),
        .cp0_en_exp(cp0_en_exp),
        .cp0_ewr_bd(cp0_ewr_bd),
        .cp0_ewr_excCode(cp0_ewr_excCode),
        .cp0_ewr_epc(cp0_ewr_epc),
        .cp0_ewr_badVAddr(cp0_ewr_badVAddr),
        .cp0_interrupt_pending(cp0_interrupt_pending),
        .cp0_privileged(cp0_privileged),
        .tlb_op(cpu_tlb_op)
    );

    always @(posedge aclk) begin
        if (!w_data_sram_va_hold) begin
            data_sram_vaddr_last <= w_data_sram_vaddr;
            data_sram_vaddr_valid_last <= w_data_sram_vaddr_valid;
        end
    end

    CP0 cp0(
        .clk(aclk),
        .reset(global_reset),

        .we(cp0_we),
        .rw_number(cp0_rw_number),
        .data_i(cp0_wdata),
        .data_o(cp0_rdata),

        .en_exp_i(cp0_en_exp),
        .ewr_bd(cp0_ewr_bd),
        .ewr_epc(cp0_ewr_epc),
        .ewr_badVAddr(cp0_ewr_badVAddr),
        .ewr_excCode(cp0_ewr_excCode),

        .epc(cp0_epc_o),
        .exc_handler(cp0_exc_handler),
        .int_handler(cp0_int_handler),
        .tlb_refill_handler(cp0_tlb_refill_handler),

        .hardware_int(ext_int[4:0]),
        .interrupt_pending(cp0_interrupt_pending),

        .privileged(cp0_privileged),
        .kseg0_cached(cp0_kseg0_cached),
        .erl(cp0_erl),
        .kernel_mode(cp0_kernel_mode),
        .tagLo0_o(cp0_tagLo0),

        .entryLo0_o(cp0_entryLo0),
        .entryLo1_o(cp0_entryLo1),
        .entryHi_o(cp0_entryHi),
        .tlbIndex_o(cp0_index),
        .pageMask_o(cp0_pageMask),

        .tlbp(cpu_tlb_op.p),
        .tlbr(cpu_tlb_op.r),
        .tlbrandom(cpu_tlb_op.random),
        .entryHi_i(tlb_entryHi),
        .entryLo0_i(tlb_entryLo0),
        .entryLo1_i(tlb_entryLo1),
        .pageMask_i(tlb_pageMask),
        .index_i(tlb_index)
    );

    wire [31:0] w_inst_sram_paddr;
    wire w_inst_sram_cached;

    wire [31:0] w_data_sram_paddr;
    wire w_data_sram_tlb_cached;

    TLB tlb(
        .clk(aclk),
        .rst(global_reset),

        .we(cpu_tlb_op.w),
        .index_reg_i(cp0_index),
        .mask_i(cp0_pageMask),
        .entryhi_i(cp0_entryHi),
        .entrylo1_i(cp0_entryLo1),
        .entrylo0_i(cp0_entryLo0),

        .mask_o(tlb_pageMask),
        .entryhi_o(tlb_entryHi),
        .entrylo0_o(tlb_entryLo0),
        .entrylo1_o(tlb_entryLo1),
        .probe_index_o(tlb_index),

        .kernel_mode(cp0_kernel_mode),
        .kseg0_cached(cp0_kseg0_cached),
        .cp0_erl(cp0_erl),

        .va0(itlb_delayed_va),
        .ce0(itlb_delayed_cen),
        .vao0(itlb_cache_va),
        .pa0(w_inst_sram_paddr),
        .cached0(w_inst_sram_cached),
        .hit0(w_inst_sram_tlb_hit),
        .valid0(w_inst_sram_tlb_valid),
        .error0(),

        .va1(w_data_sram_vaddr),
        .ce1(!w_data_sram_va_hold),
        .pa1(w_data_sram_paddr),
        .hit1(w_data_sram_tlb_hit),
        .valid1(w_data_sram_tlb_valid),
        .dirty1(w_data_sram_tlb_dirty),
        .cached1(w_data_sram_tlb_cached),
        .error1(w_data_sram_tlb_addressError)
    );

    assign w_inst_sram_tlb_addressError = 0; // bug, but no time to solve
    wire w_inst_sram_okay = w_inst_sram_tlb_hit && w_inst_sram_tlb_valid && !w_inst_sram_tlb_addressError;
    wire w_data_sram_read_okay = w_data_sram_tlb_hit && w_data_sram_tlb_valid && !w_data_sram_tlb_addressError;
    wire w_data_sram_write_okay = w_data_sram_read_okay && w_data_sram_tlb_dirty;

    cache_soc #(
       .ICACHE_WORD_PER_LINE(`ICACHE_WORD_PER_LINE),
       .ICACHE_SET_ASSOC(`ICACHE_SET_ASSOC),
       .ICACHE_SIZE(`ICACHE_SIZE),
       .ICACHE_TAG_WIDTH(`ICACHE_TAG_WIDTH),
       .DCACHE_LINE_WORD_NUM(`DCACHE_WORD_PER_LINE),
       .DCACHE_SET_ASSOC(`DCACHE_SET_ASSOC),
       .DCACHE_SIZE(`DCACHE_SIZE),
       .DCACHE_TAG_WIDTH(`DCACHE_TAG_WIDTH),
       .MEM_WRITE_FIFO_DEPTH(`MEM_WRITE_FIFO_DEPTH),
       .C_ASIC_SRAM(C_ASIC_SRAM)
    ) cache (
                  .i_clk(aclk),
                  .i_rst(global_reset),

                  .i_i_npc(w_inst_sram_addr),
                  .i_i_valid(itlb_delayed_cen && w_inst_sram_okay && itlb_cache_match),
                  .i_i_va_valid(w_inst_sram_readen),
                  .i_i_phyaddr({w_inst_sram_paddr[31:12], itlb_delayed_va[11:0]}),
                  .i_i_cached(w_inst_sram_cached),
                  .o_i_valid(w_i_valid),
                  .o_i_inst(w_i_inst),

                  .i_d_va(w_data_sram_va_hold ? data_sram_vaddr_last : w_data_sram_vaddr),
                  .i_d_phyaddr(w_data_sram_paddr),
                  .i_d_cached(w_data_sram_tlb_cached),
                  .i_d_read(w_data_sram_read && w_data_sram_read_okay),
                  .i_d_va_valid(w_data_sram_va_hold ? data_sram_vaddr_valid_last : w_data_sram_vaddr_valid),
                  .i_d_write(w_data_sram_write && w_data_sram_write_okay),
                  .i_d_size(w_data_sram_size),
                  .i_d_indata(w_data_sram_wdata),
                  .i_d_byteen(w_data_sram_byteen),
                  .o_d_valid(w_d_valid),
                  .o_d_outdata(w_d_outdata),

                  .i_icache_instr_en(w_data_sram_read_okay),
                  .i_icache_instr(icache_op),
                  .i_icache_instr_tag(cp0_tagLo0[31:(32 - `ICACHE_TAG_WIDTH)]),
                  .i_icache_instr_addr(w_data_sram_paddr),
                  .o_i_cache_instr_valid(w_inst_cache_op_valid),

                  .i_dcache_instr_en(w_data_sram_read_okay),
                  .i_dcache_instr(dcache_op),
                  .i_dcache_instr_tag(cp0_tagLo0[31:(32 - `DCACHE_TAG_WIDTH)]),
                  .i_dcache_instr_addr(w_data_sram_paddr),
                  .o_d_cache_instr_valid(w_data_cache_op_valid),

                  .o_idle(w_mem_idle),

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
