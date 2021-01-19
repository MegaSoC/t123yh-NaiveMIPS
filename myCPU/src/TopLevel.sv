`include "my_global.vh"
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

    wire reset = ! aresetn;

    reg myaresetn ;
    reg [6:0] resetCounter ;
    always_ff @(posedge Clk) begin
        if(!aresetn) begin
            myaresetn <=1'b0;
            resetCounter <=7'b0;
        end
        if(aresetn & !myaresetn) begin
            resetCounter <= resetCounter +1;
        end
        if(aresetn & !myaresetn & (&resetCounter))begin
            myaresetn <=1'b1;
        end
    end
    wire Myreset = !aresetn | !myaresetn;
    
    

    word w_dcache_instr_addr, w_icache_instr_addr;
    logic [`ICACHE_TAG_WIDTH - 1 : 0] w_icache_instr_tag;
    logic [`DCACHE_TAG_WIDTH - 1 : 0] w_dcache_instr_tag;
    logic [1:0]  w_icache_instr, w_dcache_instr;


    cache_op icache_op, dcache_op;

    always_comb begin
        icache_op = CACHE_NOP;
        dcache_op = CACHE_NOP;
        if(CACHE && E_origin[17:16] == 2'b00)begin
            case(E_origin[20:18])
                3'b000:begin
                    icache_op = CACHE_INDEX_WRITEBACK_INVALIDATE;
                end
                3'b010:begin
                    icache_op = CACHE_INDEX_STORE_TAG;
                end
                3'b100:begin
                    icache_op = CACHE_HIT_INVALIDATE;
                end
            endcase
        end
        if(CACHE && E_origin[17:16] == 2'b01)begin
            case(E_origin[20:18])
                3'b000:begin
                    dcache_op = CACHE_INDEX_WRITEBACK_INVALIDATE;
                end
                3'b010:begin
                    dcache_op = CACHE_INDEX_STORE_TAG;
                end
                3'b100:begin
                    dcache_op = CACHE_HIT_INVALIDATE;
                end
                3'b101:begin
                    dcache_op = CACHE_HIT_WRITEBACK_INVALIDATE;
                end
            endcase
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
    cache_soc(
                  .i_clk(Clk),
                  .i_rst(reset||!myaresetn),

                  .i_icache_npc(D_NewPC_Pass),
                  .i_icache_phyaddr(inst_sram_addr),
                  .i_icache_valid1(!dm_stall && !D_stall_Pass),
                  .i_icache_valid2(!inst_uncached),
                  .o_icache_inst(rdata_icache),
                  .o_i_stall(icache_stall),

                  .i_isram_addr(inst_sram_addr),
                  .i_isram_valid(inst_uncached & inst_sram_en),
                  .o_isram_valid(inst_sram_data_ok),
                  .o_isram_inst(inst_sram_rdata),

                  .i_dcache_va(dm_stall ? E_calLSaddr_is_dm_stall : E_calLSaddr_not_dm_stall),
                  .i_dcache_phyaddr(data_sram_addr),
                  .i_dcache_byteen(E_MemWriteEnable),
                  .i_dcache_read((!data_uncached) &read & !E_CurrentException),
                  .i_dcache_write((!data_uncached) &write & !E_CurrentException),
                  .i_dcache_indata(data_sram_wdata),
                  .i_dcache_outdata(rdata_dcache),
                  .o_d_stall(not_hit),

                  .i_dsram_addr(data_sram_addr),
                  .i_dsram_read(data_uncached &read & !E_CurrentException ),
                  .i_dsram_write(data_uncached &write & !E_CurrentException ),
                  .i_dsram_byteen(data_sram_wen),
                  .i_dsram_size(data_size),
                  .i_dsram_indata(data_sram_wdata),
                  .o_dsram_outdata(data_sram_rdata),
                  .o_dsram_valid(data_sram_data_ok),

                  .i_dcache_instr_tag(cp0.cp0_reg_TagLo0[31:(32 - `DCACHE_TAG_WIDTH)]),
	              .i_dcache_instr(dcache_op),
                  .i_dcache_instr_addr(E_Data), 
                
                  .i_icache_instr(icache_op),
	              .i_icache_instr_addr(E_Data),
                  .i_icache_instr_tag(cp0.cp0_reg_TagLo0[31:(32 - `ICACHE_TAG_WIDTH)]),

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
