`include "def.svh"

module new_icache#(
    parameter WORD_OUT_NUM = 16,  //读出数据的字�????????
	parameter WORD_PER_LINE = 32, //cache中一个line的字�????????,是DATA_OUT_NUM�????????2的幂次�?�，可�?�项 4 8 16 32
	parameter SET_ASSOC  = 4, //相连�???????? 2或�??4 
	parameter CACHE_SIZE = 64 * 1024, //byte
	parameter DATA_BURST = 128, //内存传输时数宽度 可�?�项�????????32 64 128
	parameter DATA_WIDTH = 256//数据ram中每个存储单元的位数,�????????大支�????????1024，是DATA_BURST�????????2的幂次�??
)(
    input logic i_clk,
	input logic i_rst,

	input [4:0] i_out_num, //�????????�????????16�???????? 可�?�项�????????16 8 4 2 1 0
	input i_flush,
	input i_uncached,   //当前地址是否经过icache
	input [31:0] i_phy_addr, //假设查tlb要花费一个周�????????
	input [31:0] i_npc, //提前�????????个周期进入cache
	output o_inn_stall,//传给外部表示cache中需要暂�????????

	output [31:0] o_mdata_start_pc, 
	output [31:0] o_mdata_final_pc,
	output [WORD_OUT_NUM << 5 - 1:0] o_mdata_instr,
    output o_mvalid,
    input i_mready,

	output axi_req axi_bus_req,
    input  axi_resp axi_bus_resp
);

localparam int BYTE_PER_LINE = WORD_PER_LINE << 2; //128
localparam int DATA_OUT_WIDTH = WORD_OUT_NUM <<5 ;//读出数据宽度
localparam int LINE_NUM    = CACHE_SIZE / BYTE_PER_LINE; //512 总line�????????
localparam int GROUP_NUM   = LINE_NUM / SET_ASSOC; //128 每路line�????????

localparam int WORD_BYTE_OFFSET = $clog2(32 / 8);//2
localparam int LINE_BYTE_OFFSET = $clog2(BYTE_PER_LINE);//7
localparam int LINE_WORD_OFFSET = LINE_BYTE_OFFSET - WORD_BYTE_OFFSET; //5
localparam int INDEX_WIDTH = $clog2(GROUP_NUM);//7
localparam int DATA_INDEX_WIDTH = $clog2((GROUP_NUM * BYTE_PER_LINE) <<3 /DATA_WIDTH ); //ram中data的索引，大于等于INDEX_WIDTH
localparam int TAG_WIDTH   = 32 - INDEX_WIDTH - LINE_BYTE_OFFSET;//18
localparam int PAGE_OFFEST = 12;
localparam int LRU_WIDTH = SET_ASSOC - 1; // 2->1, 4->3

typedef enum logic [2:0]{
	IDLE,
	RECEIVING,
	REFILL,
	WAITING,       //等待状�??
	IDLE_RECEIVING, //非阻塞访问，内存传输的同时流水线在不冲突的情况下正常流动
	INVALIDATING
} state;

typedef logic [31:0] word;
typedef struct packed {
	logic valid;
	logic [TAG_WIDTH-1:0] tag;
} tag;
typedef logic [INDEX_WIDTH - 1 : 0] index;
typedef logic [LRU_WIDTH - 1 : 0] lru;

function index get_index( input word addr );
	return addr[LINE_BYTE_OFFSET + INDEX_WIDTH - 1 : LINE_BYTE_OFFSET];
endfunction

function logic [LINE_WORD_OFFSET - 1 : 0] get_line_word_offset(input word addr);
	return addr[2 + LINE_WORD_OFFSET - 1 : 2];
endfunction

function logic [TAG_WIDTH-1:0] get_tag( input word addr );
	return addr[31 : LINE_BYTE_OFFSET + INDEX_WIDTH];
endfunction

function lru gen_new_lru(input lru old_lru, input logic [$clog2(SET_ASSOC) - 1 : 0] hit);
	if(LRU_WIDTH == 3) begin
		case (hit)
			2'b00 : return {old_lru[2],2'b00};
			2'b01 : return {old_lru[2],2'b01};
			2'b10 : return {2'b01,old_lru[0]};
			2'b11 : return {2'b11,old_lru[0]};
		endcase
	end
	else if (LRU_WIDTH == 1) begin
		return hit;
	end
endfunction

function logic [$clog2(SET_ASSOC) - 1 : 0] lru_select(input lru old_lru);
	if(LRU_WIDTH == 3) begin
		case (old_lru[1])
			1'b0 : return old_lru[2] ? 2'b10 : 2'b11;
			1'b1 : return old_lru[0] ? 2'b00 : 2'b01;
		endcase
	end
	else if(LRU_WIDTH == 1 ) begin
		return ~old_lru;
	end
endfunction

//goabal signal
logic w_inn_stall; //w_inn_stall：内部阻塞信�????????
state w_state,r_state;
index r_reset_cnt=0;
logic w_idle_miss,w_receiving_hit,w_idle_hita, w_idle_hitb, w_ir_wait; //ir: idle_receiving
logic [WORD_OUT_NUM << 5 - 1 : 0] w_instrs, r_instrs;
logic r_stall_flag, r_stall_flag_flag, w_mvalid;
word w_mdata_start_pc, w_mdata_final_pc;
assign o_mdata_instr = r_instrs;
assign o_mvalid = w_mvalid;
assign o_mdata_start_pc = w_mdata_start_pc;
assign o_mdata_final_pc = w_mdata_final_pc;
assign w_inn_stall = (w_state != IDLE_RECEIVING && w_state != IDLE) || r_state == INVALIDATING;
assign w_receiving_flag = r_state == RECEIVING;
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_reset_cnt <= 0;
		r_state <= INVALIDATING;
		r_instrs <= 0;
		r_stall_flag <= 0;
		r_stall_flag_flag <=0;
	end
	else begin
		r_stall_flag <= r_state == INVALIDATING ? 0 : w_inn_stall;
		r_stall_flag_flag <= r_stall_flag;
		r_state <= w_state;
		if(!r_stall_flag_flag && r_stall_flag) begin
			r_instrs <= w_instrs;
		end
	end
end
always_comb begin
	w_mvalid = 0;
	w_mdata_start_pc = 0;
	w_mdata_final_pc = 0;
	if(r_state == IDLE || r_state == IDLE_RECEIVING) begin
		w_mvalid = (r_p2_tag_num != 0 && r_idle_hit) || (!w_inn_stall && r_stall_flag);//TODO
		if(r_p2_tag_num != 0 && r_idle_hit)begin
			w_mdata_start_pc = r_pipe2_pc;
			w_mdata_final_pc = r_pipe2_pc_end;
		end
		else if(!w_inn_stall && r_stall_flag)begin
			w_mdata_start_pc = r_save_start_pc;
			w_mdata_final_pc = r_save_end_pc;
		end
	end

	w_idle_hita = 0;
	w_idle_hitb = 0;
	w_ir_wait = 0;
	if(r_state == IDLE)begin
		w_idle_hita = |w_way_hita;
		w_idle_hitb = |w_way_hitb;
	end
	else if (r_state ==IDLE_RECEIVING) begin
		w_idle_hita = ((|w_way_hita) || w_buffer_hita) && !w_waita;
		w_idle_hitb = ((|w_way_hitb) || w_buffer_hitb) && !w_waitb;
		w_ir_wait = w_waita || w_waitb;
	end
	w_idle_miss = 0;
	if((r_state == IDLE || r_state == IDLE_RECEIVING) && r_tag_num != '0 && !i_flush) begin
		if(r_tag_num == 2'b10)
			w_idle_miss = ~w_idle_hita || ~w_idle_hitb;
		else if(r_tag_num == 2'b1)
			w_idle_miss = ~w_idle_hita;
	end
	w_state = r_state;
	case (r_state)
		IDLE:begin
			if(w_idle_miss) begin
				w_state = RECEIVING;
			end
		end
		RECEIVING: begin
			if(w_receiving_hit && (w_resp.last && w_resp.valid))
				w_state = REFILL;
			else if(w_receiving_hit && !(w_resp.last && w_resp.valid))
				w_state = IDLE_RECEIVING;
		end
		IDLE_RECEIVING:begin
			if((w_resp.last && w_resp.valid) && !w_idle_miss && !w_ir_wait)
				w_state = REFILL;
			else if(!(w_resp.last && w_resp.valid) && w_ir_wait)
				w_state = WAITING;
			else if(!(w_resp.last && w_resp.valid) && w_idle_miss )
				w_state = RECEIVING;
		end
		REFILL: begin
			if(!w_empty) 
				w_state = RECEIVING;
			else begin
				w_state = IDLE;
			end
		end
		WAITING: begin
			if(w_resp.last && w_resp.valid)
				w_state = REFILL;
			else if(w_receiving_hit && !(w_resp.last && w_resp.valid))
				w_state = IDLE_RECEIVING;
		end
		INVALIDATING:begin
			r_reset_cnt <= (|r_reset_cnt) ? 0 : r_reset_cnt + 1;
			if(|r_reset_cnt)
				w_state = IDLE;
		end
	endcase
end

//pipeline1 process 
index w_indexa, w_indexb;
logic [1:0] tag_num;
logic [LINE_WORD_OFFSET - 1 : 0] w_start_offseta, w_start_offsetb, w_end_offseta, w_end_offsetb;
tag [SET_ASSOC-1 : 0] w_tag_resa, w_tag_resb;
word w_pc_end;
logic w_tag_wea;
tag w_tag_din;
assign w_tag_wea = w_resp.firstaddr[LINE_BYTE_OFFSET - 1 : 0] == {LINE_BYTE_OFFSET{1'b0}} && w_resp.valid;
always_comb begin
	w_pc_end = i_npc + (i_out_num - 1) << 2;
	w_indexa = w_tag_wea ? r_buffer_index1 : get_index (i_npc);
	w_indexb = get_index (w_pc_end);
	w_tag_din.tag = '0;
	w_tag_din.valid = 1'b0;
	if(~i_out_num || i_uncached)
		tag_num = '0;
	else if(w_pc_end[31 : PAGE_OFFEST] == i_npc[31 : PAGE_OFFEST]) begin
		tag_num = w_indexa == w_indexb ? 2'b1 : 2'b10;
	end
	else begin
		w_pc_end = i_npc[31 : PAGE_OFFEST] - 4;
		w_indexb = get_index(w_pc_end);
		tag_num = w_indexa == w_indexb ? 2'b1 : 2'b10;
	end
	w_start_offseta = i_npc[2 + LINE_WORD_OFFSET - 1 : 2];
	w_end_offseta = tag_num == 2'b10 ? {LINE_WORD_OFFSET{1'b1}} : w_pc_end[2 + LINE_WORD_OFFSET - 1 : 2];
	w_start_offsetb = '0;
	w_end_offsetb = tag_num == 2'b10 ? w_pc_end[2 + LINE_WORD_OFFSET - 1 : 2] :'0;
	if(r_state != INVALIDATING && w_resp.valid)begin
		w_tag_din.valid = 1'b1;
		w_tag_din.tag = w_resp.firstaddr[31 : 32 - TAG_WIDTH];
	end
end
for(genvar i = 0; i < SET_ASSOC; i++) begin :  gen_tag_mem
	xpm_memory_dpdistram #(
		// Common module parameters
		.MEMORY_SIZE($bits(TAG_WIDTH + 1) * GROUP_NUM),
		.CLOCKING_MODE("common_clock"),
		.USE_MEM_INIT(0),
		.MESSAGE_CONTROL(0),

		// Port A module parameters
		.WRITE_DATA_WIDTH_A($bits(TAG_WIDTH + 1)),
		.READ_DATA_WIDTH_A($bits(TAG_WIDTH + 1)),
		.READ_RESET_VALUE_A("0"),
		.READ_LATENCY_A(0),

		// Port B module parameters
		.READ_DATA_WIDTH_B($bits(TAG_WIDTH + 1)),
		.READ_RESET_VALUE_B("0"),
		.READ_LATENCY_B(0)
	) xpm_mem (
		// Port A module ports
		.clka           ( i_clk ),
		.rsta           ( i_rst ),
		.ena            ( 1'b1  ),
		.regcea         ( 1'b0  ),
		.wea            ( w_tag_wea   ),  //TODO
		.addra          ( w_indexa ),
		.dina           ( w_tag_din  ),  //TODO
		.douta          ( w_tag_resa[i] ),

		// Port B module ports
		.clkb           ( i_clk ),
		.rstb           ( i_rst ),
		.enb            ( 1'b1  ), 
		.regceb         ( 1'b0  ),
		.addrb          ( w_indexb ),
		.doutb          ( w_tag_resb[i] )
	);
end

//pipeline1-2 
tag [SET_ASSOC - 1 : 0] r_tag_resa,r_tag_resb; //res:result
index r_indexa, r_indexb;
word r_pipe1_pc, r_pipe1_pc_end;
logic [1:0] r_tag_num;
logic [4:0] r_out_num;
logic [LINE_WORD_OFFSET - 1 : 0] r_start_offseta, r_start_offsetb, r_end_offseta, r_end_offsetb;
always_ff @(posedge i_clk) begin
	if(i_rst || w_inn_stall)begin
		r_tag_resa <= '0;
		r_tag_resb <= '0;
		r_pipe1_pc <= '0;
		r_tag_num <= '0;
		r_indexa <= '0;
		r_indexb <= '0;
		r_out_num <= '0;
		r_pipe1_pc_end <= '0;
		r_start_offseta <= '0;
		r_start_offsetb <= '0;
		r_end_offseta <= '0;
		r_end_offsetb <= '0;
	end
	else begin
		r_tag_resa <= w_tag_resa;
		r_tag_resb <= w_tag_resb;
		r_pipe1_pc <= i_npc;
		r_tag_num <= tag_num;
		r_indexa <= w_indexa;
		r_indexb <= w_indexb;
		r_out_num <= i_out_num;
		r_pipe1_pc_end <= r_pipe1_pc_end;
		r_start_offseta <= w_start_offseta;
		r_start_offsetb <= w_start_offsetb;
		r_end_offseta <= w_end_offseta;
		r_end_offsetb <= w_end_offsetb;
	end
end

//pipeline2 process
logic [SET_ASSOC - 1 : 0] w_way_hita, w_way_hitb;
logic w_pipe_hit, w_pipe_miss;
word w_addr_end;
assign w_addr_end = i_phy_addr + r_pipe1_pc_end - r_pipe1_pc;
for(genvar i = 0; i < SET_ASSOC; ++i) begin : iswayhit
	assign w_way_hita[i] = r_tag_resa[i].tag == get_tag(i_phy_addr) && r_tag_resa[i].valid; 
	assign w_way_hitb[i] = r_tag_resb[i].tag == get_tag(w_addr_end) && r_tag_resb[i].valid; 
end
always_comb begin
	w_pipe_hit = 0;
	if(r_tag_num == 2'b1) begin
		w_pipe_hit = | w_way_hita;
	end
	else if(r_tag_num == 2'b10) begin
		w_pipe_hit = (|w_way_hita) && (|w_way_hitb);
	end
end

//pipeline2-3
word r_pipe2_pc,r_pipe2_pc_end,r_pipe2_phy_addr; //phy:physics
index w_data_indexa, w_data_indexb;
word [SET_ASSOC - 1 : 0][WORD_PER_LINE - 1 : 0] w_pipe_data_a, w_pipe_data_b;
logic [1:0] r_p2_tag_num;
logic [LINE_WORD_OFFSET - 1 : 0] r_p2_start_offseta, r_p2_start_offsetb, r_p2_end_offseta, r_p2_end_offsetb;//p2:pipeline2
logic [WORD_PER_LINE - 1: 0] w_ena, w_enb;
logic [WORD_OUT_NUM - 1: 0] w_ready;
logic r_idle_hit;
always_comb begin
	w_ena = 0;
	w_enb = 0;
	for(int i = 0; i < WORD_PER_LINE; i++)begin
		if(r_tag_num == 2'b1 && i >= get_line_word_offset(r_pipe1_pc) && i <= get_line_word_offset(r_pipe1_pc_end))
			w_ena[i] = 1;
		else if(r_tag_num == 2'b10)begin
			if(i >= get_line_word_offset(r_pipe1_pc))
				w_ena[i] = 1;
			if(i <= get_line_word_offset(r_pipe1_pc_end))
				w_enb[i] = 1;
		end
	end
end
always_ff @(posedge i_clk ) begin
	if(i_rst) begin
		r_pipe2_pc <= '0;
		r_pipe2_pc_end <= '0;
		r_p2_start_offseta <= '0;
		r_p2_start_offsetb <= '0;
		r_p2_end_offseta <= '0;
		r_p2_end_offsetb <= '0;
		r_p2_tag_num <= '0;
		r_idle_hit <= '0;
	end
	else begin
		r_pipe2_pc <= r_pipe1_pc;
		r_pipe2_pc_end <= r_pipe2_pc_end;
		r_p2_start_offseta <= r_start_offseta;
		r_p2_start_offsetb <= r_start_offsetb;
		r_p2_end_offseta <= r_end_offseta;
		r_p2_end_offsetb <= r_end_offsetb;
		r_p2_tag_num <= r_tag_num;
		r_idle_hit <= w_idle_hita && w_idle_hitb;
	end
end
assign w_data_indexa = wea ? r_buffer_index1 : get_index(r_pipe1_pc) << $clog2(WORD_PER_LINE);      
always_comb begin
	if(web)begin
		w_data_indexb = r_buffer_index2 == r_buffer_index1 ? r_buffer_index1 + 1 : r_buffer_index2; //防止写的时�?�两个地�????????相同，导致输出xxxx
	end
	else begin
		w_data_indexb = get_index(r_pipe1_pc_end) << $clog2(WORD_PER_LINE);
	end
end
logic wea, web; 
assign wea = w_memread_end && r_buffer_valid1;
assign web = w_memread_end && r_buffer_valid2;
//TODO!!!!!! lru
for(genvar i = 0; i < SET_ASSOC; i++) begin: gen_data_mem_group
	for(genvar j = 0; j < WORD_PER_LINE; j++) begin: gen_data_mem_word
		xpm_memory_tdpram #(
		// Common module parameters
		.MEMORY_SIZE(CACHE_SIZE << 8 / (SET_ASSOC * WORD_PER_LINE)),
		.MEMORY_PRIMITIVE("auto"),
		.CLOCKING_MODE("common_clock"),
		.USE_MEM_INIT(0),
		.WAKEUP_TIME("disable_sleep"),
		.MESSAGE_CONTROL(0),

		// Port A module parameters
		.WRITE_DATA_WIDTH_A(32),
		.READ_DATA_WIDTH_A(32),
		.READ_RESET_VALUE_A("0"),
		.READ_LATENCY_A(1),
		.WRITE_MODE_A("write_first"),

		// Port B module parameters
		.WRITE_DATA_WIDTH_B(32),
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
		.ena            ( w_way_hita[i] && w_ena[j]   ),
		.regcea         ( 1'b0  ),
		.wea            ( wea && i == r_buffer_way1   ), 
		.addra          ( w_data_indexa + j ), 
		.dina           ( r_mem_buffer[0][j]  ),
		.injectsbiterra ( 1'b0  ), // do not change
		.injectdbiterra ( 1'b0  ), // do not change
		.douta          ( w_pipe_data_a[i][j] ),
		.sbiterra       (       ), // do not change
		.dbiterra       (       ), // do not change
 
		// Port B module ports
		.clkb           ( i_clk   ),
		.rstb           ( i_rst   ),
		.enb            ( w_way_hitb[i] && w_enb[j]   ),
		.regceb         ( 1'b0  ),
		.web            ( web && i == r_buffer_way2   ), 
		.addrb          ( w_data_indexb + j ),
		.dinb           ( r_mem_buffer[j]  ), 
		.injectsbiterrb ( 1'b0  ), // do not change
		.injectdbiterrb ( 1'b0  ), // do not change
		.doutb          ( w_pipe_data_b[i][j] ),
		.sbiterrb       (       ), // do not change
		.dbiterrb       (       )  // do not change
		);
	end
end

//pipeline3

logic [LINE_WORD_OFFSET - 1 : 0] w_offset_numa, w_offset_numb;
assign w_offset_numa = r_p2_end_offseta - r_p2_start_offseta + 1;
assign w_offset_numb = r_p2_end_offsetb - r_p2_start_offsetb + 1;
always_comb begin
	if(w_idle_hita && r_p2_tag_num != 0) begin
		if(w_buffer_hita)begin
			for(int j = 0; j < w_offset_numa; j++)
				w_instrs[j] = r_mem_buffer[w_buffer_selecta * WORD_PER_LINE + r_p2_start_offseta + j];
		end
		else begin
			for(int i = 0; i < SET_ASSOC; i++)begin
				if(w_way_hita[i]) begin
					for(int j = 0; j < w_offset_numa; j++)
						w_instrs[j] = w_pipe_data_a[i][j + r_p2_start_offseta];
				end
			end
		end
	end
	if (w_idle_hitb && r_p2_tag_num == 2) begin
		if(w_buffer_hitb)begin
			for(int j = w_offset_numa; j < (w_offset_numa + w_offset_numb); j++) begin
				w_instrs[j] = r_mem_buffer[w_buffer_selectb * WORD_PER_LINE + j - w_offset_numa];
			end
		end
		else begin
			for(int i = 0; i < SET_ASSOC; i++)begin
				if(w_way_hitb[i]) begin
					for(int j = w_offset_numa; j < w_offset_numa + w_offset_numb; j++)
						w_instrs[j] = w_pipe_data_b[i][j - w_offset_numa];
				end
			end
		end
	end
end


//miss时保存现场的寄存�???????? 更新时机和pipeline2-3相同
word r_save_end_pc ,r_save_end_addr, r_save_start_addr,r_save_start_pc;
word r_need_start_addr, r_need_end_addr;
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_save_end_pc <= 0;
		r_save_start_pc <= 0;
		r_save_end_addr <= 0;
		r_save_start_addr <=0;
		r_need_start_addr <= '0;
		r_need_end_addr <= '0;
	end
	else if(!r_stall_flag && w_inn_stall)begin
		r_save_start_pc <= r_pipe1_pc;
		r_save_end_pc <= r_pipe1_pc_end;
		r_save_start_addr <= i_phy_addr;
		r_save_end_addr <= w_addr_end;
		r_need_start_addr <= w_idle_hita ? {w_addr_end[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}}:i_phy_addr;
		if(r_tag_num == 2'b1)
			r_need_end_addr <= w_addr_end;
		else if(r_tag_num == 2'b10)
			r_need_end_addr <= w_idle_hitb ? {w_addr_end[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}}-4:w_addr_end;
	end
end

//内存传输的内容写进输出信�????????
logic [WORD_OUT_NUM << 5 - 1 : 0] w_start_byte_off, w_end_byte_off; //off:offset
logic [$clog2(BURST_WORD_NUM) - 1 : 0] w_loadnum;
word [$clog2(BURST_WORD_NUM) - 1 : 0] w_word_position,p1,p2,p3,p0;
word burst_last_addr;
assign w_start_byte_off = (r_need_start_addr - r_save_start_addr) <<3;
assign w_end_byte_off = (r_need_end_addr - r_save_start_addr) <<3;
assign burst_last_addr = w_resp.firstaddr + (DATA_BURST >> 5 -1) << 2;
always_comb begin
	w_loadnum = 0;
	if(w_resp.valid && (r_state == RECEIVING || r_state == WAITING))begin
		for(int i = 0; i < BURST_WORD_NUM; i++)begin
			if(r_need_start_addr <= w_resp.firstaddr + i << 5 && w_resp.firstaddr <= r_need_end_addr)begin
				w_loadnum++;
				w_word_position[i] = r_need_start_addr + (w_loadnum -1) << 5;
			end
		end
	end
	w_receiving_hit = r_need_end_addr == r_need_start_addr;
end
always_ff @(posedge i_clk) begin
	if(w_resp.valid && (r_state == RECEIVING || r_state == WAITING))begin
		for(int i = 0; i < BURST_WORD_NUM; i++)begin
			if(r_need_start_addr <= w_resp.firstaddr + i << 5 && w_resp.firstaddr <= r_need_end_addr)begin
				r_instrs[w_word_position[i] + : 32] <= w_resp.data[i<<5 +: 32]; 
			end
		end
		r_need_start_addr <= r_need_start_addr + w_loadnum << 5;
	end
end


//内存通信模块
mem_read_req w_req;
mem_read_resp w_resp;
logic w_empty,w_mem_read_we, w_line_num;
logic w_memread_start,w_memread_end;
word w_memread_start_addr, w_memread_start_pc;
assign w_mem_read_we = w_idle_miss;
assign w_req.len = r_tag_num * WORD_PER_LINE << 5 / DATA_BURST - 1;
always_comb begin
	if(!w_idle_hita && !w_waita)begin  //既没有hit也没有wait那就�????????要提交请�????????
		w_req.startaddr = {i_phy_addr[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}};
		w_req.pc = {r_pipe1_pc[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}};
	end
	else if (!w_idle_hitb && r_tag_num == 2'b10 && !w_waitb)begin
		w_req.startaddr = {w_addr_end[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}};
		w_req.pc = {r_pipe1_pc_end[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}};
	end
end
mem_read # (
	.LINE_BYTE_OFFSET(LINE_BYTE_OFFSET),
	.LEN_UNIT(WORD_PER_LINE * 32 / DATA_BURST),
    .DATA_BURST(DATA_BURST)
) mem_read(
    .i_clk,
    .i_rst,
	.axi_bus_req,
	.axi_bus_resp,
    .i_req(w_req),
    .i_we(w_mem_read_we),
    .o_resp(w_resp),
	.o_empty(w_empty),
	.o_start(w_memread_start),
	.o_end(w_memread_end),
	.o_start_pc(w_memread_start_pc),
	.o_start_addr(w_memread_start_addr),
	.o_line_num(w_line_num)
);

//内存传输的buffer
localparam int BUFFER_NUM =  WORD_PER_LINE << 1; //64
localparam int BURST_WORD_NUM = DATA_BURST / 32; //4
word [$clog2( BUFFER_NUM ) - 1 : 0] r_mem_buffer;
logic [$clog2( BUFFER_NUM /BURST_WORD_NUM ) - 1 : 0] cnt_buffer;
tag r_buffer_tag1,r_buffer_tag2;
index r_buffer_index1, r_buffer_index2;
logic [LINE_WORD_OFFSET + 1 - 1 : 0] r_valid_offset1, r_valid_offset2;
logic r_buffer_valid1, r_buffer_valid2, w_buffer_selecta, w_buffer_selectb;
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_mem_buffer <= '0;
		cnt_buffer <= '0;
		r_buffer_tag1 <= '0;
		r_buffer_tag2 <= '0;
		r_valid_offset1 <= '0;
		r_valid_offset2 <= '0;
	end
	else if (w_memread_end) begin
		r_buffer_valid1 <= 0;
		r_buffer_valid2 <= 0;
	end
	else if(w_memread_start) begin
		cnt_buffer <= 0;
		r_buffer_tag1.valid <= 1;
		r_buffer_tag2.valid <= w_line_num;
		r_buffer_index1 <= get_index(w_memread_start_pc);
		r_buffer_index2 <= get_index(w_memread_start_pc) + 1;
		r_buffer_tag1.tag <= get_tag(w_memread_start_addr);
		r_buffer_tag2.tag <= get_tag(w_memread_start_addr + WORD_PER_LINE << 5);
		r_valid_offset1 <= '0;
		r_valid_offset2 <= '0;
	end
	else if (w_resp.valid) begin
		for(int i = 0; i< BURST_WORD_NUM; i++)begin
			r_mem_buffer[cnt_buffer * BURST_WORD_NUM + i] <= w_resp.data[i * 32 + : 32]; 
		end
		cnt_buffer <= (&cnt_buffer) ? '0 : cnt_buffer + 1;
		if(r_valid_offset1[LINE_WORD_OFFSET])
			r_valid_offset2 <= r_valid_offset2 + BURST_WORD_NUM;
		else begin
			r_valid_offset1 <= r_valid_offset1 + BURST_WORD_NUM;
		end 
	end
end

//idle_receiving时buffer是否hit或wait
logic w_buffer_hita, w_buffer_hitb, w_waita, w_waitb; 
always_comb begin
	w_buffer_hita = 0;
	w_buffer_hitb = 0;
	w_buffer_selecta = 0;
	w_buffer_selectb = 0;
	w_waita = 0;
	w_waitb = 0;
	if( r_state == IDLE_RECEIVING)begin
		if(get_tag(i_phy_addr) == r_buffer_tag1.tag && get_index(r_pipe1_pc) == r_buffer_index1 && r_buffer_tag1.valid && r_buffer_valid1) begin
			w_buffer_selecta = 0;
			w_buffer_hita = r_end_offseta <= r_valid_offset1 ;
			w_waita = ~w_buffer_hita;
		end
		else if(get_tag(i_phy_addr ) == r_buffer_tag2.tag && get_index(r_pipe1_pc) == r_buffer_index1 && r_buffer_tag2.valid && r_buffer_valid2) begin
			w_buffer_selecta = 1'b1;
			w_buffer_hita = r_end_offseta <= r_valid_offset2;
			w_waita = ~w_buffer_hita;
		end
		if(get_tag(w_addr_end) == r_buffer_tag1.tag && get_index(r_pipe1_pc_end) == r_buffer_index1 && r_buffer_tag1.valid && r_buffer_valid1) begin
			w_buffer_selectb = 0;	
			w_buffer_hitb = r_end_offsetb <= r_valid_offset1;
			w_waitb = ~w_buffer_hitb;
		end
		if(get_tag(w_addr_end) == r_buffer_tag2.tag && get_index(r_pipe1_pc_end) == r_buffer_index1 && r_buffer_tag2.valid && r_buffer_valid2) begin
			w_buffer_selectb = 1'b1;
			w_buffer_hitb = r_end_offsetb <= r_valid_offset2;
			w_waitb = ~w_buffer_hitb;
		end
	end
end

//lru位的读写 更新时机和pipeline2-3相同
lru [GROUP_NUM - 1 : 0] r_lru_ram;
lru [1:0] r_lru_buffer;
lru w_new_lrua, w_new_lrub;
logic [$clog2(SET_ASSOC) - 1 : 0] r_buffer_way1, r_buffer_way2;
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_lru_ram <= 0;
		r_lru_buffer <= 0;
		r_buffer_way1 <= 0;
		r_buffer_way2 <= 0;
	end
	else begin
		if( r_state == IDLE || r_state == IDLE_RECEIVING) begin
			if((w_buffer_hita || w_waita) && r_tag_num != '0 && r_state == IDLE_RECEIVING)begin
				r_lru_ram[r_indexa] <= gen_new_lru(r_lru_ram[r_indexa], w_buffer_selecta ? r_buffer_way2 : r_buffer_way1);
				r_lru_buffer[w_buffer_selecta] <= gen_new_lru(r_lru_ram[r_indexa], w_buffer_selecta ? r_buffer_way2 : r_buffer_way1);
			end
			else if (|w_way_hita && r_tag_num != '0 )begin
				for (int i = 0; i < SET_ASSOC; i++)begin
					if(w_way_hita[i])
						r_lru_ram[r_indexa] <= gen_new_lru(r_lru_ram[r_indexa],i);
				end
			end
			if((w_buffer_hitb || w_waitb) && r_tag_num == 2'b10 && r_state == IDLE_RECEIVING)begin
				r_lru_ram[r_indexb] <= gen_new_lru(r_lru_ram[r_indexb], w_buffer_selectb ? r_buffer_way2 : r_buffer_way1);
				r_lru_buffer[w_buffer_selectb] <= gen_new_lru(r_lru_ram[r_indexb], w_buffer_selectb ? r_buffer_way2 : r_buffer_way1);
			end
			if(|w_way_hitb && r_tag_num == 2'b10)begin
				for(int i = 0; i < SET_ASSOC; i++)begin
					if(w_way_hitb[i])
						r_lru_ram[r_indexb] <= gen_new_lru(r_lru_ram[r_indexb],i);
				end
			end
		end
		if(w_state == RECEIVING && r_state != RECEIVING)begin
			if(!w_idle_hita && !w_waita && r_tag_num != 0)begin
				r_lru_ram[r_indexa] <= gen_new_lru(r_lru_ram[r_indexa],lru_select(r_lru_ram[r_indexa]));
				r_buffer_way1 <= lru_select(r_lru_ram[r_indexa]);
				if(!w_idle_hitb && !w_waitb && r_tag_num == 2'b10)begin
					r_lru_ram[r_indexb] <= gen_new_lru(r_lru_ram[r_indexb],lru_select(r_lru_ram[r_indexb]));
					r_buffer_way2 <= lru_select(r_lru_ram[r_indexb]);
				end
			end
			else begin
				if(!w_idle_hitb && !w_waitb && r_tag_num == 2'b10)begin
					r_lru_ram[r_indexb] <= gen_new_lru(r_lru_ram[r_indexb],lru_select(r_lru_ram[r_indexb]));
					r_buffer_way1 <= lru_select(r_lru_ram[r_indexb]);
				end
			end
		end
	end	
end


endmodule