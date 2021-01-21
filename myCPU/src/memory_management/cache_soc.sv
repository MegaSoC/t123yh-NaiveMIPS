`include "def.svh"
module cache_soc #(
	parameter ICACHE_WORD_PER_LINE = 16, //cache?????line??????????????,??DATA_OUT_NUM??????????2????????????????? 4 8 16 32
	parameter ICACHE_SET_ASSOC  = 2, //?????????????? 2?????4 
	parameter ICACHE_SIZE = 8 * 1024, //byte
    parameter ICACHE_TAG_WIDTH = 32- $clog2(ICACHE_SIZE/ICACHE_SET_ASSOC), //equals to PFN
    parameter DCACHE_LINE_WORD_NUM = 16,
    parameter DCACHE_SET_ASSOC = 2,
    parameter DCACHE_SIZE = 8 * 1024,
    parameter DCACHE_TAG_WIDTH = 32 - $clog2(DCACHE_SIZE/DCACHE_SET_ASSOC),
    parameter MEM_WRITE_FIFO_DEPTH = 8
)(
    input logic i_clk,
    input logic i_rst,

    input word   i_icache_npc,//icache的pc，由npc模块产生，比物理地址（i_icache_phyaddr）前一个周期到达
    input word   i_icache_phyaddr,//icache的物理地址，时机与I级相同
    input logic  i_icache_valid1,//i_icache_npc的valid信号
    input logic  i_icache_valid2,//i_icache_phyaddr的valid信号
    output word  o_icache_inst,//icache的查询结果，I级出（i_icache_npc的下个周期）
    output logic o_i_stall,//icache产生的暂停信号

    input word   i_isram_addr,//不通过icache的指令物理地址（与i_icache_phyaddr时机相同）
    input logic  i_isram_valid,//i_isram_adddr的valid信号
    output logic o_isram_valid,//o_isram_inst的valid信号
    output word  o_isram_inst,//不通过icache的查询结果

    input word   i_dcache_va,//dcache的虚拟地址，由alu产生，比物理地址(i_dcache_phyaddr)前一个周期到达
    input word   i_dcache_phyaddr,//dcache的物理地址，时机与M级相同
    input logic  [3:0] i_dcache_byteen,//i_dcache_write拉高时表明哪些字节是有效的
    input logic  i_dcache_read,//与i_dcache_phyaddr时机相同，通过dcache的读信号
    input logic  i_dcache_write,//与i_dcache_phyaddr时机相同，通过dcache的写信号
    input word   i_dcache_indata,//与i_dcache_phyaddr时机相同，写的内容
    output word  i_dcache_outdata,//dcache的查询结果，D级出（i_dcache_va的下个周期）
    output logic o_d_stall,//dcache产生的暂停信号

    input word   i_dsram_addr,//不通过dcache的数据物理地址（时机与i_dcache_phyaddr相同）
    input logic  i_dsram_read,//不通过dcache的数据读信号（时机与i_dcache_phyaddr相同）
    input logic  i_dsram_write,//不通过dcache的数据写信号（时机与i_dcache_phyaddr相同）
    input logic  [3:0] i_dsram_byteen,//i_dsram_write拉高时表明哪些字节有效
    input logic  [2:0] i_dsram_size,//不通过dcache时传输的字节数，直接与axi传输的arsize或awsize相连
    input word   i_dsram_indata,//i_dsram_write拉高时写入的内容
    output word  o_dsram_outdata,//不通过dcache的查询结果
    output logic o_dsram_valid,//o_dsram_outdata的valid信号

	input [DCACHE_TAG_WIDTH - 1 : 0] i_dcache_instr_tag,//mu级传入 index storetag指令中的tag 对dcache有效
	input cache_op i_dcache_instr, //m级传入 表明是哪个cache指令 对dcache有效 
    input word i_dcache_instr_addr, //m级传入 cache指令的32位地址，含义根据不同指令不同 对dcache有效
    
    input cache_op i_icache_instr, //m级传入 表明是哪个cache指令 对icache有效 
	input word i_icache_instr_addr,   //m级传入 cache指令的32位地址，含义根据不同指令不同 对icache有效
	input [ICACHE_TAG_WIDTH - 1 : 0] i_icache_instr_tag,//m级传入 index storetag指令中的tag 对icache有效

    output logic [3 :0] arid ,
    output logic [31:0] araddr ,
    output logic [7 :0] arlen ,
    output logic [2 :0] arsize ,
    output logic [1 :0] arburst ,
    output logic [1 :0] arlock ,
    output logic [3 :0] arcache ,
    output logic [2 :0] arprot ,
    output logic arvalid ,
    input logic arready ,

    input logic [3 :0] rid ,
    input logic [31:0] rdata ,
    input logic [1 :0] rresp ,
    input logic rlast ,
    input logic rvalid ,
    output logic rready ,

    output logic [3 :0] awid ,
    output logic [31:0] awaddr ,
    output logic [7 :0] awlen ,
    output logic [2 :0] awsize ,
    output logic [1 :0] awburst ,
    output logic [1 :0] awlock ,
    output logic [3 :0] awcache ,
    output logic [2 :0] awprot ,
    output logic awvalid ,
    input logic awready ,

    output logic [3 :0] wid ,
    output logic [31:0] wdata ,
    output logic [3 :0] wstrb ,
    output logic wlast ,
    output logic wvalid ,
    input  logic wready ,

    input logic [3 :0] bid ,
    input logic [1 :0] bresp ,
    input bvalid ,
    output logic bready
);

logic [$clog2(MEM_WRITE_FIFO_DEPTH) - 1 : 0] w_key;
logic [$clog2(MEM_WRITE_FIFO_DEPTH) - 2 : 0] w_dcache_lock;
logic w_write_process;
word w_write_addr;
mem_read_resp w_resp;
mem_read_req w_dcache_rreq, w_icache_rreq, w_isram_req, w_dsram_rreq;
logic w_data_empty,w_dcache_start,w_dcache_end,w_memread_stall;
logic w_inst_empty,w_icache_start,w_icache_end, w_dsram_wend;
logic w_dcache_memread_we, w_dcache_memwrite_start,w_dcache_memwrite_end;
logic w_dcache_memwrite_we, w_icache_memread_we;
logic r_isram_valid, r_dsram_read, r_dsram_write, w_isram_valid, w_dsram_read, w_dsram_write;
word w_memread_start_pc, w_memread_start_addr;
word [DCACHE_LINE_WORD_NUM - 1 : 0] w_dcache_memwrite_data;
word r_isram_inst, r_dsram_data, w_isram_inst, w_dsram_data;
mem_write_req w_dcache_wreq, w_dsram_wreq;
axi_r_resp w_axi_r_resp;
axi_r_req  w_axi_r_req;
axi_w_resp w_axi_w_resp;
axi_w_req  w_axi_w_req;

always_ff @(posedge i_clk) begin
    if(i_rst)begin
        r_isram_inst <= '0;
        r_dsram_data <= '0;
    end
    else begin
        r_isram_inst <= w_isram_inst;
        r_dsram_data <= w_dsram_data;
    end
end

always_comb begin
    w_isram_inst = r_isram_inst;
    w_dsram_data = r_dsram_data;
    if(o_isram_valid)begin
        w_isram_inst = w_resp.data;
    end
    if(o_dsram_valid)begin
        w_dsram_data = w_resp.data;
    end
end

assign w_isram_req.startaddr = i_isram_addr;
assign w_isram_req.va = '0;
assign w_isram_req.size = 3'b010;
assign w_isram_req.len = 0;
assign w_isram_req.status = 2'b01;
assign o_isram_valid = w_resp.valid1 && w_resp.last;
assign o_isram_inst = w_isram_inst;

new_icache #(
    .WORD_PER_LINE(ICACHE_WORD_PER_LINE),
    .SET_ASSOC(ICACHE_SET_ASSOC),
    .CACHE_SIZE(ICACHE_SIZE),
    .TAG_WIDTH(ICACHE_TAG_WIDTH)
)
icache1(
    .i_clk,
    .i_rst,

    .i_valid1(i_icache_valid1), 
    .i_valid2(i_icache_valid2),
    .i_phy_addr(i_icache_phyaddr), 
    .i_va(i_icache_npc), 
    .o_inn_stall(o_i_stall),
    .o_mdata_data(o_icache_inst),

    .i_cache_instr(i_icache_instr),
    .i_cache_instr_addr(i_icache_instr_addr),
    .i_cache_instr_tag(i_icache_instr_tag),

    .i_resp(w_resp), //TODO
    .i_memread_empty(w_inst_empty),// TODO
    .i_memread_start(w_icache_start),
    .i_memread_end(w_icache_end),
    .o_memread_req(w_icache_rreq),
    .o_mem_read_we(w_icache_memread_we)
);

assign w_dsram_rreq.status = 2'b11;
assign w_dsram_rreq.startaddr = i_dsram_addr;
assign w_dsram_rreq.va = '0;
assign w_dsram_rreq.size = i_dsram_size;
assign w_dsram_rreq.len = 0;

assign w_dsram_wreq.len = 0;
assign w_dsram_wreq.wen = i_dsram_byteen;
assign w_dsram_wreq.addr = i_dsram_addr;
assign w_dsram_wreq.size = i_dsram_size;

assign o_dsram_outdata = w_dsram_data;
assign o_dsram_valid = (w_resp.valid3 && w_resp.last) || w_dsram_wend;

new_dcache #(
    .WORD_PER_LINE(DCACHE_LINE_WORD_NUM),
    .SET_ASSOC(DCACHE_SET_ASSOC),
    .CACHE_SIZE(DCACHE_SIZE),
    .TAG_WIDTH(DCACHE_TAG_WIDTH),
    .FIFO_DEPTH(MEM_WRITE_FIFO_DEPTH)
)
dcache1(
    .i_clk,
    .i_rst,

    .i_valid(i_dcache_read | i_dcache_write), 
    .i_phy_addr(i_dcache_phyaddr), 
    .i_va(i_dcache_va), 
    .i_wen(i_dcache_byteen),
    .i_in_data(i_dcache_indata),
    .o_inn_stall(o_d_stall),
    .o_mdata_data(i_dcache_outdata),

    .i_cache_instr(i_dcache_instr),
    .i_cache_instr_addr(i_dcache_instr_addr),
    .i_cache_instr_tag(i_dcache_instr_tag),

    .i_resp(w_resp), //TODO
    .i_memread_empty(w_data_empty),// TODO
    .i_memread_start(w_dcache_start),
    .i_memread_end(w_dcache_end),
    .o_memread_stall(w_memread_stall),  //TODO
    .i_memread_start_va(w_memread_start_pc),
    .i_memread_start_addr(w_memread_start_addr),
    //.i_line_num,
    .o_memread_req(w_dcache_rreq),
    .o_mem_read_we(w_dcache_memread_we),

    .i_lock(w_dcache_lock),
    .i_key(w_key),
    .i_memwrite_start(w_dcache_memwrite_start),
    .i_memwrite_end(w_dcache_memwrite_end),
    .o_memwrite_req(w_dcache_wreq),
    .o_write_data(w_dcache_memwrite_data),
    .o_mem_write_we(w_dcache_memwrite_we) 
);

always_ff @(posedge i_clk) begin
    if(i_rst)begin
        r_isram_valid <= 0;
        r_dsram_read <= 0;
        r_dsram_write <= 0;
    end
    else begin
        r_isram_valid <= ~o_isram_valid && (i_isram_valid || r_isram_valid);
        r_dsram_read <= ~o_dsram_valid && (i_dsram_read || r_dsram_read);
        r_dsram_write <= ~o_dsram_valid && (i_dsram_write || r_dsram_write);
    end
end

assign w_isram_valid = i_isram_valid && ~r_isram_valid;
assign w_dsram_read  = i_dsram_read && ~r_dsram_read;
assign w_dsram_write = i_dsram_write && ~r_dsram_write;

mem_read # (
    .LEN_UNIT(ICACHE_WORD_PER_LINE),
    .LINE_BYTE_OFFSET($clog2(DCACHE_LINE_WORD_NUM)+2)
) mem_read(
    .i_clk,
    .i_rst,
    .i_flush(0),
    .i_write_process(w_write_process),
    .i_write_address(w_write_addr),
    .i_instr_req(w_isram_valid ? w_isram_req : w_icache_rreq),
    .i_icache_we(w_icache_memread_we),
    .i_isram_we(w_isram_valid),
    .i_data_req(w_dsram_read ? w_dsram_rreq : w_dcache_rreq),
    .i_dcache_we(w_dcache_memread_we),
    .i_dsram_we(w_dsram_read),
    .i_memread_stall(w_memread_stall),
    .o_resp(w_resp),
    .o_instr_empty(w_inst_empty),
    .o_data_empty(w_data_empty),
	.o_icache_start(w_icache_start),
    .o_icache_end(w_icache_end),
    .o_dcache_start(w_dcache_start),
    .o_dcache_end(w_dcache_end),
	.o_start_va(w_memread_start_pc),
	.o_start_addr(w_memread_start_addr),
    .o_line_num(),
    .axi_bus_req(w_axi_r_req),
	.axi_bus_resp(w_axi_r_resp)
);


mem_write #(
    .FIFO_DEPTH(MEM_WRITE_FIFO_DEPTH),
    .LINE_WORD_NUM(DCACHE_LINE_WORD_NUM)
)mem_write(
    .i_clk,
    .i_rst,
    .o_write_process(w_write_process),
    .o_write_address(w_write_addr),
    .i_dcache_we(w_dcache_memwrite_we),
    .i_sram_we(w_dsram_write),
    .i_dcache_data(w_dcache_memwrite_data),
    .i_sram_data(i_dsram_indata),
    .o_dcache_lock(w_dcache_lock),
    .o_sram_lock(),
    .o_key(w_key),
    .i_dcache_req(w_dcache_wreq),
    .i_sram_req(w_dsram_wreq),
    //.o_empty(),
    .o_sram_full(),
    .o_sram_start(),
    .o_sram_end(w_dsram_wend),
    .o_dcache_start(w_dcache_memwrite_start),
    .o_dcache_end(w_dcache_memwrite_end),
    .axi_bus_req(w_axi_w_req),
    .axi_bus_resp(w_axi_w_resp)
);

assign arid    = w_axi_r_req.arid;
assign araddr  = w_axi_r_req.araddr; 
assign arlen   = w_axi_r_req.arlen;
assign arsize  = w_axi_r_req.arsize; 
assign arburst = w_axi_r_req.arburst;
assign arlock  = w_axi_r_req.arlock;
assign arcache = w_axi_r_req.arcache;
assign arprot  = w_axi_r_req.arprot;
assign arvalid = w_axi_r_req.arvalid;
assign rready   = w_axi_r_req.rready;

assign awid    = w_axi_w_req.awid;
assign awaddr  = w_axi_w_req.awaddr;
assign awlen   = w_axi_w_req.awlen;
assign awsize  = w_axi_w_req.awsize;
assign awburst = w_axi_w_req.awburst;
assign awlock  = w_axi_w_req.awlock;
assign awcache = w_axi_w_req.awcache;
assign awprot  = w_axi_w_req.awprot;
assign awvalid = w_axi_w_req.awvalid;
assign wid     = w_axi_w_req.wid;
assign wdata   = w_axi_w_req.wdata;
assign wstrb   = w_axi_w_req.wstrb;
assign wlast   = w_axi_w_req.wlast;
assign wvalid  = w_axi_w_req.wvalid;
assign bready  = w_axi_w_req.bready;

assign w_axi_r_resp.arready = arready;
assign w_axi_r_resp.rid     = rid;
assign w_axi_r_resp.rdata   = rdata;
assign w_axi_r_resp.rresp   = rresp;
assign w_axi_r_resp.rlast   = rlast;
assign w_axi_r_resp.rvalid  = rvalid;

assign w_axi_w_resp.awready   = awready;
assign w_axi_w_resp.wready    = wready;
assign w_axi_w_resp.bid       = bid;
assign w_axi_w_resp.bresp     = bresp;
assign w_axi_w_resp.bvalid    = bvalid;

    
endmodule