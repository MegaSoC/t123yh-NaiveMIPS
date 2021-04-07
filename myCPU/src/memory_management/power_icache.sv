`include "def.svh"

module new_icache#(
	parameter WORD_PER_LINE = 8, //cache中一个line的字�?????????????,是DATA_OUT_NUM�?????????????2的幂次�?�，可�?�项 4 8 16 32
	parameter SET_ASSOC  = 4, //相连�????????????? 2或�??4 
	parameter CACHE_SIZE = 16 * 1024, //byte
	parameter TAG_WIDTH = 20, //equals to PFN
    parameter C_ASIC_SRAM = 0
)(
    input logic i_clk,
	input logic i_rst,

    input logic i_valid2,
	//input logic i_uncached,   //当前地址是否经过icache
	input logic [31:0] i_phy_addr, //假设查tlb要花费一个周�?????????????
	input logic [31:0] i_va, //提前�?????????????个周期进入cache
	output logic o_inn_stall,//传给外部表示cache中需要暂�?????????????
	output logic [31:0] o_mdata_data,
	output logic o_valid,
	output logic o_ready,

	input mem_read_resp i_resp,
	input logic i_memread_empty,
	input logic i_memread_start,
	input logic i_memread_end,
	output mem_read_req o_memread_req,
	output logic o_mem_read_we,

	input cache_op i_cache_instr, //m级传入
	input word i_cache_instr_addr,   //m级传入
	input [TAG_WIDTH - 1 : 0] i_cache_instr_tag,
	output logic o_cache_instr_valid

);

localparam int BYTE_PER_LINE = WORD_PER_LINE << 2; //32
localparam int LINE_NUM    = CACHE_SIZE / BYTE_PER_LINE; //512 总line�?????????????
localparam int GROUP_NUM   = LINE_NUM / SET_ASSOC; //128 每路line�?????????????
localparam int LINE_BYTE_OFFSET = $clog2(BYTE_PER_LINE);//5
localparam int LINE_WORD_OFFSET = $clog2(WORD_PER_LINE); //3
localparam int INDEX_WIDTH = $clog2(GROUP_NUM);//7
localparam int PAGE_OFFEST = 12;
localparam int LRU_WIDTH = SET_ASSOC - 1; // 2->1, 4->3

typedef enum logic [2:0]{
	IDLE,
	RECEIVING,
	RECEIVING2,
	REFILL,
	READ_WAITING,       //等待状�??
	IDLE_RECEIVING, //非阻塞访问，内存传输的同时流水线在不冲突的情况下正常流动
	INVALIDATING
} state;

typedef struct packed {
	logic valid;
	logic [TAG_WIDTH-1:0] tag;
} tag;
typedef logic [INDEX_WIDTH - 1 : 0] index;
typedef logic [LRU_WIDTH - 1 : 0] lru;

function index get_index( input word addr );
	return addr[LINE_BYTE_OFFSET + INDEX_WIDTH - 1 : LINE_BYTE_OFFSET];
endfunction

function logic [3:0] onehot2to4(input logic [2:0] in);
	case(in)
		2'b00: return 4'b0001;
		2'b01: return 4'b0010;
		2'b10: return 4'b0100;
		2'b11: return 4'b1000;
	endcase
endfunction

function logic [1:0] onehot1to2(input logic in);
	case(in)
		1'b0: return 2'b01;
		1'b1: return 2'b10;
	endcase
endfunction

function logic [SET_ASSOC - 1 : 0] get_cache_inst_way(input word addr);
	if(SET_ASSOC == 2)
		return onehot1to2(addr[LINE_BYTE_OFFSET + INDEX_WIDTH]);
	else begin
		return onehot2to4(addr[LINE_BYTE_OFFSET + INDEX_WIDTH + 1 : LINE_BYTE_OFFSET + INDEX_WIDTH]);
	end
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
	if(SET_ASSOC == 2)
		return ~old_lru;
	else begin
		case (old_lru[1])
			1'b0 : return old_lru[2] ? 2'b10 : 2'b11;
			1'b1 : return old_lru[0] ? 2'b00 : 2'b01;
		endcase
	end
endfunction

function logic [SET_ASSOC - 1 : 0] lru_onehot(input lru old_lru);
	if(SET_ASSOC == 2)
		return old_lru ? 2'b01 : 2'b10;
	else begin
		case (old_lru[1])
			1'b0 : return old_lru[2] ? 4'b0100 : 4'b1000;
			1'b1 : return old_lru[0] ? 4'b0001 : 4'b0010;
		endcase
	end
endfunction

//goabal signal
logic w_inn_stall; //w_inn_stall：内部阻塞信�?????????????
state w_state,r_state;
index r_reset_cnt;
logic w_idle_miss,w_receiving_hit,w_idle_hita; //ir: idle_receiving
word w_data, r_data;
logic r_stall_flag, r_stall_flag_flag, w_mvalid;
word w_mdata_start_va;
tag w_reset_tag;

//pipe1 signal
index w_indexa, w_cache_inst_index;
logic [SET_ASSOC - 1 : 0] w_cache_inst_way;
logic [$clog2(SET_ASSOC) - 1 : 0] r_save_select_way, r_rbuffer_way2;
logic [SET_ASSOC - 1 : 0] r_save_onehot_way;
logic [SET_ASSOC - 1 : 0][GROUP_NUM - 1 : 0] r_dirty;
logic [LINE_WORD_OFFSET - 1 : 0] w_start_offseta, w_start_offsetb, w_end_offseta;
tag [SET_ASSOC-1 : 0] w_tag_res;
tag w_cache_inst_tag;
logic w_cache_inst_tag_wen;
word w_va_end;
logic w_tag_wea;
tag w_tag_din;

//pipe1-2 siganl
index r_indexa;
word r_pipe1_va, r_pipe1_va_end;
logic [LINE_WORD_OFFSET - 1 : 0] r_start_offseta, r_end_offseta;

//pipe 2 signal
logic  w_tag_num;
logic [SET_ASSOC - 1 : 0] w_way_hita;
logic [SET_ASSOC : 0] [$clog2(SET_ASSOC) - 1 : 0]w_whichway_hita;
logic [$clog2(SET_ASSOC) - 1 : 0] w_hit_way;
logic w_pipe_hit, w_pipe_miss;
word w_phy_addr;

// pipe 2-3 signal
word r_pipe2_va,r_pipe2_phy_addr; //phy:physics
index w_data_indexa, w_data_indexb, r_pipe2_indexa;
logic [INDEX_WIDTH + LINE_WORD_OFFSET- 1 : 0] w_data_raddr, w_data_waddr;
word [SET_ASSOC - 1 : 0] w_data_out;
word [SET_ASSOC - 1 : 0][WORD_PER_LINE - 1 : 0] w_pipe_data_a, w_pipe_data_b;
logic [1:0] r_p2_tag_num;
logic [LINE_WORD_OFFSET - 1 : 0] r_p2_start_offseta, r_p2_end_offseta;//p2:pipeline2
logic r_idle_hit, r_rbuffer_hita, r_idle_hita, web;
logic [SET_ASSOC - 1 : 0] r_way_hita;
logic [$clog2(SET_ASSOC) - 1 : 0] r_whichway_hita;

// pipe 3-4 signal
logic r_web_w;
logic wea, web_refill; 
index r_pipe3_indexa, r_web_delay;
logic [$clog2(SET_ASSOC) - 1 : 0] r_p3_whichway_hita;
logic [LINE_WORD_OFFSET - 1 : 0] r_p3_start_offseta;

//miss sigbal
word r_save_addr,r_save_start_va;
logic [LINE_WORD_OFFSET - 1 : 0] r_save_offset, r_reqstart_offset;
logic r_save_dirty;
tag r_save_tag, r_save_new_tag;
index r_save_index;

//rbuffer
localparam int BUFFER_NUM =  WORD_PER_LINE; //16
word [BUFFER_NUM  - 1 : 0] r_mem_rbuffer_n;
word [BUFFER_NUM  - 1 : 0] r_mem_rbuffer_q;


word r_writeback_addr;
logic [$clog2( BUFFER_NUM  ) - 1 : 0] cnt_rbuffer;
logic [BUFFER_NUM - 1 : 0] r_rbuffer_valid;
tag r_rbuffer_tag, r_old_tag;
index r_rbuffer_index1, r_rbuffer_index2;
logic [LINE_WORD_OFFSET : 0] r_valid_offset1, r_valid_offset2, w_valid_offset1, w_valid_offset2;
logic r_rbuffer_valid1, w_rbuffer_selectb, r_replace_dirty;

logic r_receiving_hit;

mem_read_req w_memread_req;
mem_read_resp w_resp;
logic w_memread_empty,w_mem_read_we, w_line_num;
logic w_memread_start,w_memread_end;
word w_memread_start_addr, w_memread_start_va;
logic [$clog2(SET_ASSOC) - 1 : 0] r_rbuffer_way;
logic [SET_ASSOC - 1 : 0] r_rbuffer_onehot_way;

logic w_rbuffer_hita, w_waita; 

//lru signal
lru [GROUP_NUM - 1 : 0] r_lru_ram;
lru w_new_lrua, w_new_lrub;
logic [$clog2(SET_ASSOC) - 1 : 0] w_lru_select;

always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_reset_cnt <= 0;
		r_state <= INVALIDATING;
		r_data <= 0;
		r_stall_flag <= 0;
	end
	else begin
		r_stall_flag <= r_state == INVALIDATING ? 0 : w_inn_stall;
		r_state <= w_state;
		r_data <= w_data;
	end
	if(r_state == INVALIDATING)begin
		r_reset_cnt <= (&r_reset_cnt) ? r_reset_cnt : r_reset_cnt + 1;
	end
end
always_comb begin
	w_mvalid = 0;
	w_mdata_start_va = 0;
	if(r_state == IDLE || r_state == IDLE_RECEIVING || r_state == REFILL) begin
		w_mvalid = (r_p2_tag_num != 0 && r_idle_hit ) || (r_receiving_hit);//TODO
		if(r_p2_tag_num != 0 && r_idle_hit)begin
			w_mdata_start_va = r_pipe2_va;
		end
		else if(r_receiving_hit)begin
			w_mdata_start_va = r_save_start_va;
		end
	end

	w_idle_hita = w_pipe_hit || w_rbuffer_hita;
	w_idle_miss = (r_state == IDLE || r_state == IDLE_RECEIVING) && w_tag_num && ~w_idle_hita && ~w_waita;
	w_state = r_state;
	case (r_state)
		IDLE:begin
			if(w_idle_miss) begin
				w_state = RECEIVING;
			end
		end
		RECEIVING: begin
			if(w_resp.last && w_resp.valid0)
				w_state = REFILL;
			else if(w_receiving_hit && !(w_resp.last && w_resp.valid0))
				w_state = IDLE_RECEIVING;
		end
		RECEIVING2: begin
		    if(w_resp.last && w_resp.valid0)
				w_state = REFILL;
		end
		IDLE_RECEIVING:begin
			if((w_resp.last && w_resp.valid0))
				w_state = REFILL;
			else if(!(w_resp.last && w_resp.valid0) && w_waita)
				w_state = READ_WAITING;
			else if(!(w_resp.last && w_resp.valid0) && w_idle_miss )
				w_state = RECEIVING2;
		end
		REFILL: begin
			if(!w_memread_empty) 
				w_state = RECEIVING;
			else begin
				w_state = IDLE;
			end
		end
		READ_WAITING: begin
			if(w_resp.last && w_resp.valid0)
				w_state = REFILL;
			else if(w_receiving_hit && !(w_resp.last && w_resp.valid0))
				w_state = IDLE_RECEIVING;
		end
		INVALIDATING:begin
			if(&r_reset_cnt && ~i_rst)
				w_state = IDLE;
		end
	endcase
end


// assign o_mdata_data = r_receiving_hit ? r_data : w_data;
assign o_mdata_data = w_data;
assign w_inn_stall = w_state != IDLE_RECEIVING && w_state != IDLE;
assign o_inn_stall = w_inn_stall;
assign o_ready = r_state != REFILL && r_state != INVALIDATING && w_memread_start != 1;

//pipeline1 process 
assign w_tag_wea = w_memread_end ;
assign w_cache_inst_index = get_index(i_cache_instr_addr);
assign w_cache_inst_way = i_cache_instr == CACHE_HIT_INVALIDATE ? {SET_ASSOC{1'b1}} : get_cache_inst_way(i_cache_instr_addr);
assign w_cache_inst_tag.tag = i_cache_instr_tag;
assign w_cache_inst_tag.valid = i_cache_instr == CACHE_INDEX_STORE_TAG;
assign w_cache_inst_tag_wen = i_cache_instr == CACHE_INDEX_STORE_TAG || i_cache_instr == CACHE_INDEX_WRITEBACK_INVALIDATE || i_cache_instr == CACHE_HIT_INVALIDATE;
assign w_reset_tag.tag = '0;
assign w_reset_tag.valid = 0;

always_comb begin
	w_va_end = i_va;
	w_indexa = get_index (i_va);
	w_tag_din.tag = '0;
	w_tag_din.valid = 1'b0;
	w_start_offseta = i_va[2 + LINE_WORD_OFFSET - 1 : 2];
	w_end_offseta = w_va_end[2 + LINE_WORD_OFFSET - 1 : 2];
	w_start_offsetb = '0;
	if(r_state != INVALIDATING && w_resp.valid0)begin
		w_tag_din.valid = 1'b1;
		w_tag_din.tag = w_resp.firstaddr[31 : 32 - TAG_WIDTH];
	end
end
for(genvar i = 0; i < SET_ASSOC; i++) begin :  gen_tag_mem
	tag_ram #(
		.INDEX_WIDTH(INDEX_WIDTH),
		.TAG_WIDTH(TAG_WIDTH),
		.C_ASIC_SRAM(C_ASIC_SRAM)
	)tag_ram(
		.i_clk,
		.i_rst,
		.i_wen((w_memread_start && r_save_onehot_way[i]) || (w_cache_inst_tag_wen && w_cache_inst_way[i]) || r_state == INVALIDATING),
		.i_raddr(w_indexa),
		.i_waddr(w_cache_inst_tag_wen ? w_cache_inst_index : r_state == INVALIDATING ? r_reset_cnt : get_index(r_save_addr)),
		.i_wtag(w_cache_inst_tag_wen ? w_cache_inst_tag: r_state == INVALIDATING ? w_reset_tag: r_save_new_tag),
		.o_rtag(w_tag_res[i])

	);
end

//pipeline1-2 
always_ff @(posedge i_clk) begin
	if(i_rst || w_inn_stall)begin
		r_pipe1_va <= '0;
		r_indexa <= '0;
		r_pipe1_va_end <= '0;
		r_start_offseta <= '0;
		r_end_offseta <= '0;
	end
	else begin
		r_pipe1_va <= i_va;
		r_indexa <= w_indexa;
		r_pipe1_va_end <= w_va_end;
		r_start_offseta <= w_start_offseta;
		r_end_offseta <= w_end_offseta;
	end
end

//pipeline2 process
assign w_phy_addr = i_phy_addr;
assign w_tag_num = i_valid2;
assign w_whichway_hita[0] = 0;
for(genvar i = 0; i < SET_ASSOC; ++i) begin : iswayhit
	assign w_way_hita[i] = w_tag_res[i].tag == get_tag(w_phy_addr) && w_tag_res[i].valid; 
	assign w_whichway_hita[i+1] = w_whichway_hita[i] | (w_way_hita[i]?i:0);
end
assign w_pipe_hit = |w_way_hita && (r_state == IDLE || r_state == IDLE_RECEIVING);
assign w_hit_way = w_whichway_hita[SET_ASSOC];

//pipeline2-3
always_ff @(posedge i_clk ) begin
	if(i_rst) begin
		r_pipe2_va <= '0;
		r_p2_start_offseta <= '0;
		r_p2_end_offseta <= '0;
		r_p2_tag_num <= '0;
		r_idle_hit <= '0;
		r_rbuffer_hita <= '0;
		r_way_hita <= '0;
		r_idle_hita <= '0;
		r_whichway_hita <= '0;
		r_pipe2_indexa <= '0;
	end
	else begin
		r_p2_tag_num <= w_tag_num;
			r_pipe2_va <= r_pipe1_va;
			r_p2_start_offseta <= r_start_offseta;
			r_p2_end_offseta <= r_end_offseta;
			r_idle_hit <= w_idle_hita ;
			r_rbuffer_hita <= w_rbuffer_hita;
			r_way_hita <= w_way_hita;
			r_idle_hita <= w_idle_hita;
			r_whichway_hita <= w_whichway_hita[SET_ASSOC];
			r_pipe2_indexa <= get_index(r_pipe1_va);
	end
end

assign w_data_indexa = get_index(i_va);   
assign w_data_indexb = r_rbuffer_index1; 
assign w_data_raddr = {get_index(i_va), w_start_offseta};
assign w_data_waddr = {r_rbuffer_index1, cnt_rbuffer};
assign wea = 0;
assign web_refill = w_resp.valid0;
assign web = 0 ;
//TODO!!!!!! lru
for(genvar i = 0; i < SET_ASSOC; i++) begin: gen_data_mem_group
	data_ram #(
	    .INDEX_WIDTH(INDEX_WIDTH + LINE_WORD_OFFSET),
		.C_ASIC_SRAM(C_ASIC_SRAM)
	)data_ram(
	    .i_clk,
	    .i_rst,
	    .i_wen(web_refill && r_rbuffer_onehot_way[i]),
	    .i_wbyteen(4'b1111),
	    .i_raddr(w_data_raddr),
	    .i_waddr(w_data_waddr),
	    .i_wdata(w_resp.data),
	    .o_rdata(w_data_out[i])
	);	
end

//pipeline3
assign o_valid = w_rbuffer_hita | w_receiving_hit | (w_pipe_hit && !w_waita);
assign o_cache_instr_valid = o_ready;

always_comb begin
	w_data = r_data;
	if(w_rbuffer_hita)begin
		w_data = r_mem_rbuffer_n[r_start_offseta];
	end
	else if(w_receiving_hit)begin
		w_data = w_resp.data;
	end
	else if(w_pipe_hit)begin
		w_data = w_data_out[w_hit_way];
	end
end


//miss时保存现场的寄存�????????????? 更新时机和pipeline2-3相同
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_save_start_va <= 0;
		r_save_addr <=0;
		r_save_offset <= '0;
		r_reqstart_offset <= '0;
		r_save_dirty <= 0;
		r_save_tag <= '0;
		r_save_index <= '0;
		r_save_new_tag <= '0;
	end
	else if(w_idle_miss || w_waita)begin
		r_save_start_va <= r_pipe1_va;
		r_save_addr <= w_phy_addr;
		r_save_offset <= r_start_offseta;
		r_reqstart_offset <= (w_memread_req.startaddr[LINE_WORD_OFFSET + 1 : 2]);
		r_save_dirty <= r_dirty[w_lru_select][w_indexa];
		r_save_index <= get_index(r_pipe1_va);
		r_save_tag <= w_tag_res[w_lru_select]; //old tag
		r_save_new_tag.tag <= get_tag(w_phy_addr);
		r_save_new_tag.valid <= 1'b1;
	end
end

//内存传输的内容写进输出信�?????????????
assign w_receiving_hit = cnt_rbuffer == r_save_offset && w_resp.valid0 &&(r_state == READ_WAITING || r_state == RECEIVING);
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_receiving_hit <= 0;
	end
	else begin
		r_receiving_hit <= w_receiving_hit;
	end
end


//内存通信模块
assign w_mem_read_we = w_idle_miss ;
assign w_memread_req.len = WORD_PER_LINE - 1;
assign w_memread_req.size = 3'b010;
assign w_memread_req.status = 2'b00;
assign w_memread_req.startaddr = {w_phy_addr[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}};
assign w_memread_req.va = {r_pipe1_va[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}};

assign w_resp = i_resp;
assign w_memread_empty = i_memread_empty;
assign w_memread_start = i_memread_start;
assign w_memread_end = i_memread_end;
assign o_memread_req = w_memread_req;
assign o_mem_read_we = w_mem_read_we;

//内存传输的rbuffer
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_mem_rbuffer_q <= '0;
		cnt_rbuffer <= '0;
		r_rbuffer_tag <= '0;
		r_old_tag <= '0;
		r_valid_offset2 <= '0;
		r_rbuffer_way <= '0;
		r_writeback_addr <= '0;
		r_replace_dirty <= 0;
		r_rbuffer_valid <= '0;
		r_rbuffer_index1 <= '0;
		r_rbuffer_onehot_way <= '0;
		r_rbuffer_valid1 <= 0;
	end
	else begin
	    r_mem_rbuffer_q <= r_mem_rbuffer_n;
		if(w_memread_start) begin
			r_old_tag <= r_save_tag;
			r_rbuffer_valid1 <=1;
			r_rbuffer_index1 <= get_index(r_save_addr);
			r_rbuffer_tag <= r_save_new_tag;
			cnt_rbuffer <= '0;
			r_rbuffer_way <= r_save_select_way;
			r_rbuffer_onehot_way <= r_save_onehot_way;
			r_writeback_addr <= {r_save_tag.tag,get_index(r_save_addr),{LINE_BYTE_OFFSET{1'b0}}};
			r_replace_dirty <= r_save_dirty;
		end
		else if (w_resp.valid0) begin
			cnt_rbuffer <= cnt_rbuffer + 1'b1;
			r_rbuffer_valid[cnt_rbuffer] <= 1'b1;
		end
		else if (w_memread_end) begin
			r_rbuffer_valid1 <= 0;
			cnt_rbuffer <= '0;
			r_rbuffer_valid <= '0;
		end
	end
end

//idle_receiving时rbuffer是否hit或wait
always_comb begin
	w_rbuffer_hita = 0;
	w_rbuffer_selectb = 0;
	w_waita = 0;
	if( r_state == IDLE_RECEIVING  && w_tag_num)begin
		if(get_tag(w_phy_addr) == r_rbuffer_tag.tag && get_index(r_pipe1_va) == r_rbuffer_index1 && r_rbuffer_tag.valid && r_rbuffer_valid1) begin
			w_rbuffer_hita =  r_rbuffer_valid[r_start_offseta] || (cnt_rbuffer == r_start_offseta && w_resp.valid0); 
			w_waita = ~w_rbuffer_hita;
		end
	end
end


always_comb begin
	r_mem_rbuffer_n = r_mem_rbuffer_q;
	if (w_resp.valid0) begin
        r_mem_rbuffer_n[cnt_rbuffer] = w_resp.data; 
	end
	
end

//lru位的读写 更新时机和pipeline2-3相同
assign w_lru_select = lru_select(r_lru_ram[r_indexa]);
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_lru_ram <= 0;
		r_save_select_way <= 0;
		r_rbuffer_way2 <= 0;
		r_save_onehot_way <= '0;
	end
	else begin
		if(w_rbuffer_hita || w_waita)begin
			r_lru_ram[r_indexa] <= gen_new_lru(r_lru_ram[r_indexa], r_rbuffer_way);
		end
		else if (w_pipe_hit)begin
			r_lru_ram[r_indexa] <= gen_new_lru(r_lru_ram[r_indexa],w_whichway_hita[SET_ASSOC]);
		end
		else if(w_idle_miss)begin
			r_lru_ram[r_indexa] <= gen_new_lru(r_lru_ram[r_indexa],lru_select(r_lru_ram[r_indexa]));
			r_save_select_way <= lru_select(r_lru_ram[r_indexa]);
			r_save_onehot_way <= lru_onehot(r_lru_ram[r_indexa]);
		end
	end	
end

endmodule
