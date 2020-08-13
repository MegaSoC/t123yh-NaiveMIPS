`include "def.svh"

module new_dcache#(
	parameter WORD_PER_LINE = 8, //cache中一个line的字�?????????????,是DATA_OUT_NUM�?????????????2的幂次�?�，可�?�项 4 8 16 32
	parameter SET_ASSOC  = 4, //相连�????????????? 2或�??4 
	parameter CACHE_SIZE = 16 * 1024, //byte
	parameter TAG_WIDTH = 20, //equals to PFN
	parameter FIFO_DEPTH = 16

)(
    input logic i_clk,
	input logic i_rst,

	input logic i_valid, //�?????????????�?????????????16�????????????? 可�?�项�?????????????16 8 4 2 1 0
	//input logic i_uncached,   //当前地址是否经过icache
	input logic [31:0] i_phy_addr, //假设查tlb要花费一个周�?????????????
	input logic [1:0] i_cache_instr, //m级传入
	input word i_cache_instr_addr,   //m级传入
	input [TAG_WIDTH - 1 : 0] i_cache_instr_tag,
	input logic [31:0] i_va, //提前�?????????????个周期进入cache
	input logic [3:0] i_wen,
	input logic [31:0] i_in_data,
	output logic o_inn_stall,//传给外部表示cache中需要暂�?????????????
	output logic [31:0] o_mdata_data,

	input mem_read_resp i_resp,
	input logic i_memread_empty,
	input logic i_memread_start,
	input logic i_memread_end,
	input word i_memread_start_va,
	input word i_memread_start_addr,
	input logic i_line_num,
	output mem_read_req o_memread_req,
	output logic o_mem_read_we,
	output logic o_memread_stall, //阻塞读内�???

	input logic [$clog2(FIFO_DEPTH) - 2 : 0] i_lock,
	input logic [$clog2(FIFO_DEPTH) - 1 : 0] i_key,
	input logic i_memwrite_start,
	input logic i_memwrite_end,
	output mem_write_req o_memwrite_req,
	output word [WORD_PER_LINE - 1 : 0] o_write_data,
	output logic o_mem_write_we

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
	WRITE_WAITING,
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

// generate;
// 	if(SET_ASSOC == 2)begin
// 		function logic [$clog2(SET_ASSOC) - 1 : 0] lru_select(input lru old_lru);
// 			return ~old_lru;
// 		endfunction

// 		function logic [SET_ASSOC - 1 : 0] lru_onehot(input lru old_lru);
// 			return old_lru ? 2'b01 : 2'b10;
// 		endfunction
// 	end
// 	else if(SET_ASSOC == 4)begin
// 		function logic [$clog2(SET_ASSOC) - 1 : 0] lru_select(input lru old_lru);
// 			case (old_lru[1])
// 				1'b0 : return old_lru[2] ? 2'b10 : 2'b11;
// 				1'b1 : return old_lru[0] ? 2'b00 : 2'b01;
// 			endcase
// 		endfunction

// 		function logic [SET_ASSOC - 1 : 0] lru_onehot(input lru old_lru);
// 			case (old_lru[1])
// 				1'b0 : return old_lru[2] ? 4'b0100 : 2'b1000;
// 				1'b1 : return old_lru[0] ? 4'b0000 : 2'b0001;
// 			endcase
// 		endfunction

// 	end
// endgenerate

// function logic [$clog2(SET_ASSOC) - 1 : 0] lru_select(input lru old_lru);
// 	if(LRU_WIDTH == 3) begin
// 		case (old_lru[1])
// 			1'b0 : return old_lru[2] ? 2'b10 : 2'b11;
// 			1'b1 : return old_lru[0] ? 2'b00 : 2'b01;
// 		endcase
// 	end
// 	else if(LRU_WIDTH == 1 ) begin
// 		return ~old_lru;
// 	end
// endfunction

// function logic [SET_ASSOC - 1 : 0] lru_onehot(input lru old_lru);
// 	if(LRU_WIDTH == 3) begin
// 		case (old_lru[1])
// 			1'b0 : return old_lru[2] ? 4'b0100 : 2'b1000;
// 			1'b1 : return old_lru[0] ? 4'b0000 : 2'b0001;
// 		endcase
// 	end
// 	else if(LRU_WIDTH == 1 ) begin
// 		return old_lru ? 2'b01 : 2'b10;
// 	end
// endfunction

function word byte_fill(input word r_data, input word w_data,input logic [3:0] s );
    return { 
        s[3] ? w_data[31:24] : r_data[31:24],
        s[2] ? w_data[23:16] : r_data[23:16],
        s[1] ? w_data[15:8]  : r_data[15:8],
        s[0] ? w_data[7:0]   : r_data[7:0]
    };
endfunction

//goabal signal
state w_state,r_state;
index r_reset_cnt=0;
logic w_idle_miss,w_receiving_hit,w_idle_hita; //ir: idle_receiving
word w_data, r_data;
tag w_reset_tag;

//pipe1 signal
index w_indexa, w_cache_inst_index;
logic [SET_ASSOC - 1 : 0] w_cache_inst_way;
logic [$clog2(SET_ASSOC) - 1 : 0] r_save_select_way,w_cache_inst_hitway;
logic [SET_ASSOC - 1 : 0] r_save_onehot_way;
logic [SET_ASSOC - 1 : 0][GROUP_NUM - 1 : 0] r_dirty;
logic [LINE_WORD_OFFSET - 1 : 0] w_start_offseta, w_start_offsetb, w_end_offseta;
tag [SET_ASSOC-1 : 0] w_tag_res;
tag w_cache_inst_tag;
logic w_cache_inst_hit, w_cache_inst_tag_wen, r_cache_hit_flag;
word w_va_end;
logic w_tag_wea;
tag w_tag_din;

//pipe1-2 siganl
index r_indexa;
word r_pipe1_va, r_pipe1_va_end, r_pipe1_indata;
logic r_tag_num;
logic [3:0] r_pipe1_wena;
logic [LINE_WORD_OFFSET - 1 : 0] r_start_offseta, r_end_offseta;

//pipe 2 signal
logic  w_tag_num;
logic [SET_ASSOC - 1 : 0] w_way_hita;
logic [SET_ASSOC : 0] [$clog2(SET_ASSOC) - 1 : 0]w_whichway_hita;
logic [$clog2(SET_ASSOC) - 1 : 0] w_hit_way;
logic w_pipe_hit;
word w_phy_addr;
logic [TAG_WIDTH - 1 : 0] w_phy_tag;

// pipe 2-3 signal
index w_data_indexa, w_data_indexb ;
word [SET_ASSOC - 1 : 0][WORD_PER_LINE - 1 : 0] w_pipe_data_a, w_pipe_data_b;

// pipe 3-4 signal
logic web_refill, web_w; 


//miss sigbal
word r_save_addr,r_save_start_va;
logic [LINE_WORD_OFFSET - 1 : 0] r_save_offset, r_reqstart_offset;
word   r_save_indata;
logic [3:0] r_save_wen;
logic r_save_dirty;
tag r_save_tag, r_save_new_tag;
index r_save_index;

//rbuffer
localparam int RBUFFER_WORD_NUM =  WORD_PER_LINE; //16
word [RBUFFER_WORD_NUM  - 1 : 0] r_mem_rbuffer_n;
word [RBUFFER_WORD_NUM  - 1 : 0] r_mem_rbuffer_q;


word r_writeback_addr;
logic [$clog2( RBUFFER_WORD_NUM  ) - 1 : 0] cnt_rbuffer;
logic [RBUFFER_WORD_NUM - 1 : 0] r_rbuffer_valid;
tag r_rbuffer_tag, r_old_tag;
index r_rbuffer_index1, r_rbuffer_index2;
logic [LINE_WORD_OFFSET : 0] r_valid_offset1, r_valid_offset2, w_valid_offset1, w_valid_offset2;
logic r_rbuffer_valid1, r_replace_dirty;

logic r_receiving_hit;
logic w_fill_flag, r_fill_flag;
word burst_last_addr;

mem_read_req w_memread_req;
mem_read_resp w_resp;
logic w_memread_empty,w_mem_read_we, w_line_num;
logic w_memread_start,w_memread_end;
word w_memread_start_addr, w_memread_start_va;
logic [$clog2(SET_ASSOC) - 1 : 0] r_rbuffer_way;
logic [SET_ASSOC - 1 : 0] r_rbuffer_onehot_way;

logic w_rbuffer_hita, w_waita, w_waitb; 


//wbuffer
localparam int WBUFFER_NUM =  FIFO_DEPTH >> 1; //2
word [WBUFFER_NUM - 1 : 0][WORD_PER_LINE - 1 :0] r_mem_wbuffer;
tag [WBUFFER_NUM - 1 : 0] r_wbuffer_tag;
logic [WBUFFER_NUM - 1 : 0] r_wbuffer_r, r_wbuffer_v, w_wbuffer_hits; //r_wbuffer_r : 0:replaceable,1:not replaceable
index [WBUFFER_NUM - 1 : 0] r_wbuffer_index;
index [WBUFFER_NUM : 0] w_wbuffer_hitidx;
index w_wbuffer_hitindex, r_wbuffer_hitindex;
logic r_wbuffer_full, w_wbuffer_hit, r_wbuffer_hit;

logic w_memwrite_start, w_memwrite_end, w_memwrite_we;
mem_write_req w_memwrite_req;
word [3:0] r_fifo_addr;
logic [1:0] w_fifo_point = 0, w_fifo_posi = 0;
logic w_fifo_empty;
logic [$clog2(FIFO_DEPTH) - 1 : 0] w_key ;


//lru signal
lru [GROUP_NUM - 1 : 0] r_lru_ram;
lru w_new_lrua, w_new_lrub;
logic [$clog2(SET_ASSOC) - 1 : 0] w_lru_select;

always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_reset_cnt <= 0;
		r_state <= INVALIDATING;
		r_data <= 0;
	end
	else begin
		r_state <= w_state;
		r_data <= w_data;
	end
	if(r_state == INVALIDATING)begin
		r_reset_cnt <= (&r_reset_cnt) ? r_reset_cnt : r_reset_cnt + 1;
	end
end
always_comb begin

	w_idle_hita = w_pipe_hit || w_rbuffer_hita || w_wbuffer_hit;
	w_idle_miss = (r_state == IDLE || r_state == IDLE_RECEIVING) && w_tag_num && ~w_idle_hita && ~w_waita && i_cache_instr != 2'b11;
	w_state = r_state;
	case (r_state)
		IDLE:begin
			if(w_idle_miss||w_cache_inst_hit) begin
				w_state = RECEIVING;
			end
		end
		RECEIVING: begin
			if(w_resp.last && w_resp.valid2 && r_old_tag.valid)
				w_state = WRITE_WAITING;
			else if(w_resp.last && w_resp.valid2)
				w_state = REFILL;
			// else if(w_resp.last && w_resp.valid2 && !r_replace_dirty)
			// 	w_state = REFILL;
			else if(w_receiving_hit && !(w_resp.last && w_resp.valid2))
				w_state = IDLE_RECEIVING;
		end
		RECEIVING2: begin
			if(w_resp.last && w_resp.valid2 && r_old_tag.valid)
				w_state = WRITE_WAITING;
			else if(w_resp.last && w_resp.valid2)
				w_state = REFILL;
			// else if(w_resp.last && w_resp.valid2 && !r_replace_dirty)
			// 	w_state = REFILL;
		end
		IDLE_RECEIVING:begin
			if((w_resp.last && w_resp.valid2)&& r_old_tag.valid)
				w_state = WRITE_WAITING;
			else if((w_resp.last && w_resp.valid2))
				w_state = REFILL;
			// else if((w_resp.last && w_resp.valid2) &&  !r_replace_dirty)
			// 	w_state = REFILL;
			else if(!(w_resp.last && w_resp.valid2) && w_waita)
				w_state = READ_WAITING;
			else if(!(w_resp.last && w_resp.valid2) && (w_idle_miss||w_cache_inst_hit) )
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
			if((w_resp.last && w_resp.valid2)&& r_old_tag.valid)
				w_state = WRITE_WAITING;
			else if(w_resp.last && w_resp.valid2)
				w_state = REFILL;
			else if(w_receiving_hit && !(w_resp.last && w_resp.valid2))
				w_state = IDLE_RECEIVING;
		end
		WRITE_WAITING: begin
			if(!r_wbuffer_full)begin
				w_state = REFILL;
			end
		end
		INVALIDATING:begin
			if(&r_reset_cnt && ~i_rst)
				w_state = IDLE;
		end
	endcase
end


// assign o_mdata_data = r_receiving_hit ? r_data : w_data;
assign o_mdata_data = w_data;
assign o_inn_stall = w_state != IDLE_RECEIVING && w_state != IDLE;
assign o_memread_stall = w_state == WRITE_WAITING;

//pipeline1 process 
assign w_tag_wea = w_memread_end ;
assign w_cache_inst_index = get_index(i_cache_instr_addr);
assign w_cache_inst_way = get_cache_inst_way(i_cache_instr_addr);
assign w_cache_inst_tag.tag = i_cache_instr_tag;
assign w_cache_inst_tag.valid = i_cache_instr != 2'b01;
assign w_cache_inst_tag_wen = i_cache_instr == 2'b01 || i_cache_instr == 2'b10;
assign w_cache_inst_hit = (w_pipe_hit || w_rbuffer_hita || w_waita) && i_cache_instr == 2'b11;
assign w_cache_inst_hitway = (w_hit_way & {2{w_pipe_hit}}) | (r_rbuffer_way & ({2{w_waita}} | {2{w_rbuffer_hita}}));
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
	if(r_state != INVALIDATING && w_resp.valid2)begin
		w_tag_din.valid = 1'b1;
		w_tag_din.tag = w_resp.firstaddr[31 : 32 - TAG_WIDTH];
	end
end
for(genvar i = 0; i < SET_ASSOC; i++) begin :  gen_tag_mem

	tag_ram #(
		.INDEX_WIDTH(INDEX_WIDTH),
		.TAG_WIDTH(TAG_WIDTH)
	)tag_ram(
		.i_clk,
		.i_rst,
		.i_wen((w_memread_end && r_rbuffer_onehot_way[i]) || (w_cache_inst_tag_wen && w_cache_inst_way[i]) || r_state == INVALIDATING),
		.i_raddr(w_indexa),
		.i_waddr(w_cache_inst_tag_wen ? w_cache_inst_index : r_state == INVALIDATING ? r_reset_cnt : r_rbuffer_index1),
		.i_wtag(w_cache_inst_tag_wen ? w_cache_inst_tag: r_state == INVALIDATING ? w_reset_tag: r_rbuffer_tag),
		.o_rtag(w_tag_res[i])

	);
end

//pipeline1-2 
always_ff @(posedge i_clk) begin
	if(i_rst || o_inn_stall)begin
		r_pipe1_va <= '0;
		r_tag_num <= '0;
		r_indexa <= '0;
		r_pipe1_va_end <= '0;
		r_start_offseta <= '0;
		r_end_offseta <= '0;
		r_pipe1_wena <= '0;
		r_pipe1_indata <= '0;
	end
	else begin
		r_pipe1_va <= i_va;
		r_tag_num <= i_valid;
		r_indexa <= w_indexa;
		r_pipe1_va_end <= w_va_end;
		r_start_offseta <= w_start_offseta;
		r_end_offseta <= w_end_offseta;
		r_pipe1_wena <= i_wen;
		r_pipe1_indata <= i_in_data;
	end
end

//pipeline2 process
//assign web_w = (|r_pipe1_wena) && (|w_way_hita) && !w_rbuffer_hita && (r_state == IDLE || r_state == IDLE_RECEIVING) && w_tag_num;
assign web_w = (|i_wen) && w_pipe_hit; 
assign w_phy_tag = get_tag(w_phy_addr);
assign w_phy_addr = i_phy_addr;
assign w_tag_num = i_valid;
assign w_whichway_hita[0] = 0;
for(genvar i = 0; i < SET_ASSOC; ++i) begin : iswayhit
	assign w_way_hita[i] = w_tag_res[i].tag == w_phy_tag && w_tag_res[i].valid; 
	assign w_whichway_hita[i+1] = w_whichway_hita[i] | (w_way_hita[i]?i:0);
end
assign w_pipe_hit = |w_way_hita && (r_state == IDLE || r_state == IDLE_RECEIVING) && w_tag_num;
assign w_hit_way = w_whichway_hita[SET_ASSOC];

assign w_data_indexa = w_state == WRITE_WAITING ? r_rbuffer_index1 : get_index(i_va);   
assign w_data_indexb = web_refill ? r_rbuffer_index1 : r_indexa; 
assign web_refill = r_state == REFILL;
//TODO!!!!!! lru
for(genvar i = 0; i < SET_ASSOC; i++) begin: gen_data_mem_group
	for(genvar j = 0; j < WORD_PER_LINE; j++) begin: gen_data_mem_word

		data_ram #(
		      .INDEX_WIDTH(INDEX_WIDTH)
		)data_ram(
		    .i_clk,
		    .i_rst,
		    .i_wen((web_refill && r_rbuffer_onehot_way[i]) || (web_w && w_way_hita[i] && j == r_start_offseta)),
		    .i_wbyteen(web_refill?4'b1111:i_wen),
		    .i_raddr(w_data_indexa),
		    .i_waddr(w_data_indexb),
		    .i_wdata(web_refill ? r_mem_rbuffer_q[j] : i_in_data),
		    .o_rdata(w_pipe_data_a[i][j])
		);	
	end
end

//pipeline3

always_comb begin
	w_data = r_data;
	if(w_rbuffer_hita)begin
		w_data = r_mem_rbuffer_n[r_start_offseta];
	end
	else if(w_wbuffer_hit)begin
		w_data = r_mem_wbuffer[w_wbuffer_hitindex][r_start_offseta];
	end
	else if(w_receiving_hit)begin
		w_data = w_resp.data;
	end
	else if(w_pipe_hit)begin
		w_data = w_pipe_data_a[w_hit_way][r_start_offseta];
	end
end


//miss时保存现场的寄存�????????????? 更新时机和pipeline2-3相同
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_save_start_va <= 0;
		r_save_addr <=0;
		r_save_offset <= '0;
		r_reqstart_offset <= '0;
		r_save_wen <= '0;
		r_save_indata <= '0;
		// r_save_dirty <= 0;
		r_save_tag <= '0;
		r_save_index <= '0;
		r_save_new_tag <= '0;
		r_cache_hit_flag <= 0;
	end
	else if(w_idle_miss || w_waita || w_cache_inst_hit)begin
		r_save_start_va <= r_pipe1_va;
		r_save_addr <= w_phy_addr;
		r_save_offset <= r_start_offseta;
		r_reqstart_offset <= ({LINE_WORD_OFFSET{w_cache_inst_hit}})|(w_memread_req.startaddr[LINE_WORD_OFFSET + 1 : 2]);
		r_save_wen <= {4{~w_cache_inst_hit}} & i_wen;
		r_save_indata <= i_in_data;
		// r_save_dirty <= r_dirty[w_lru_select][w_indexa];
		r_save_index <= get_index(r_pipe1_va);
		r_save_tag <= w_tag_res[w_lru_select]; //old tag
		r_save_new_tag.tag <= w_phy_tag;
		r_save_new_tag.valid <= 1;
		r_cache_hit_flag <= w_cache_inst_hit;
	end
end

//内存传输的内容写进输出信�?????????????
assign w_receiving_hit = cnt_rbuffer == r_save_offset && w_resp.valid2 &&(r_state == READ_WAITING || r_state == RECEIVING);
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_receiving_hit <= 0;
	end
	else begin
		r_receiving_hit <= w_receiving_hit;
	end
end


//内存通信模块
assign w_mem_read_we = (w_idle_miss ) || w_cache_inst_hit;
assign w_memread_req.len = WORD_PER_LINE - 1;
assign w_memread_req.size = 3'b010;
assign w_memread_req.status = 2'b10;
assign w_memread_req.startaddr = {w_phy_addr[31:2], 2'b0};
assign w_memread_req.va = {r_pipe1_va[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}};

assign w_resp = i_resp;
assign w_memread_empty = i_memread_empty;
assign w_memread_start = i_memread_start;
assign w_memread_end = i_memread_end;
assign w_memread_start_va = i_memread_start_va;
assign w_memread_start_addr = i_memread_start_addr;
assign w_line_num = i_line_num;
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
		// r_replace_dirty <= 0;
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
			r_rbuffer_tag.tag <= r_save_new_tag.tag;
			r_rbuffer_tag.valid <= ~r_cache_hit_flag;
			cnt_rbuffer <= {LINE_WORD_OFFSET{~r_cache_hit_flag}}&r_reqstart_offset;
			r_rbuffer_way <= r_save_select_way;
			r_rbuffer_onehot_way <= r_save_onehot_way;
			r_writeback_addr <= {r_save_tag.tag,get_index(r_save_addr),{LINE_BYTE_OFFSET{1'b0}}};
			// r_replace_dirty <= r_save_dirty;
		end
		else if (w_resp.valid2) begin
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
	w_waita = 0;
	w_waitb = 0;
	if( r_state == IDLE_RECEIVING  && w_tag_num)begin
		if(w_phy_tag == r_rbuffer_tag.tag && get_index(r_pipe1_va) == r_rbuffer_index1 && r_rbuffer_tag.valid && r_rbuffer_valid1) begin
			w_rbuffer_hita =  r_rbuffer_valid[r_start_offseta] || (cnt_rbuffer == r_start_offseta && w_resp.valid2); 
			w_waita = ~w_rbuffer_hita;
		end
	end
end

// logic [SET_ASSOC- 1 : 0][GROUP_NUM - 1 : 0] w_dirty_n;
// always_comb begin
// 	w_dirty_n = r_dirty;
// 	if(w_rbuffer_hita && (|i_wen)) begin
// 		w_dirty_n[r_rbuffer_way][r_rbuffer_index1] = 1'b1;
// 	end//写时机和pipeline2-3相同
// 	if(w_receiving_hit && (|r_save_wen)) begin
// 		w_dirty_n[r_rbuffer_way][r_rbuffer_index1] = 1'b1;
// 	end
// 	if(web_w)begin
// 		w_dirty_n[r_whichway_hita][r_pipe2_indexa] = 1'b1;
// 	end
// end
// always_ff @(posedge i_clk) begin
// 	if(i_rst)begin
// 		r_dirty <= '0;
// 	end
// 	else begin
// 		r_dirty <= w_dirty_n;
// 	end
// end

always_comb begin
	r_mem_rbuffer_n = r_mem_rbuffer_q;
	if (w_resp.valid2) begin
		if(w_receiving_hit && (|r_save_wen)) begin
	       r_mem_rbuffer_n[cnt_rbuffer] = byte_fill(w_resp.data,r_save_indata,r_save_wen);
		end 
		else begin //r_state == RECEIVING
            r_mem_rbuffer_n[cnt_rbuffer] = w_resp.data; 
        end
	end
    if(w_rbuffer_hita && (|i_wen)) begin
	   r_mem_rbuffer_n[r_start_offseta] = byte_fill(r_mem_rbuffer_n[r_start_offseta], i_in_data, i_wen);
    end //r_state == IDLE_RECEIVING
	
end

//wbuffer
assign r_wbuffer_full = &r_wbuffer_r;
assign w_wbuffer_hitidx[0] = 0;
assign w_key = i_key[$clog2(FIFO_DEPTH) - 2 : 0];
for(genvar i = 0; i < WBUFFER_NUM; i++)begin: hit
	assign w_wbuffer_hits[i] = get_index(r_pipe1_va) == r_wbuffer_index[i] && w_phy_tag == r_wbuffer_tag[i].tag 
		&& r_wbuffer_tag[i].valid && r_wbuffer_v[i] && !(w_memwrite_start&&i==w_key);
    assign w_wbuffer_hitidx[i+1] = w_wbuffer_hitidx[i] | (w_wbuffer_hits[i] ? i : 0);
end
assign w_wbuffer_hit = |w_wbuffer_hits && w_tag_num && (r_state == IDLE || r_state == IDLE_RECEIVING);
assign w_wbuffer_hitindex = w_wbuffer_hitidx[WBUFFER_NUM];
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_mem_wbuffer <= '0;
		r_wbuffer_tag <= '0;
		r_wbuffer_v <= '0;
		r_wbuffer_index <= '0;
		r_wbuffer_r <= '0;
		r_wbuffer_hit <= 0;
		r_wbuffer_hitindex <= '0;
	end
	else begin
		if(w_wbuffer_hit && (|i_wen)) begin
			r_mem_wbuffer[w_wbuffer_hitindex][r_start_offseta] <= byte_fill(r_mem_wbuffer[w_wbuffer_hitindex][r_start_offseta], i_in_data, i_wen);
		end//写时机和pipeline2-3相同
		r_wbuffer_hit <= w_wbuffer_hit;
		r_wbuffer_hitindex <= w_wbuffer_hitindex;
		if(w_state != WRITE_WAITING && r_state == WRITE_WAITING)begin
			r_mem_wbuffer[i_lock] <= w_pipe_data_a[r_rbuffer_way];
			r_wbuffer_tag[i_lock] <= r_old_tag;
			r_wbuffer_index[i_lock] <= r_rbuffer_index1;
			r_wbuffer_v[i_lock] <= 1'b1;
			r_wbuffer_r[i_lock] <= 1'b1;
		end
		if(w_memwrite_start)begin
			r_wbuffer_v[w_key] <= 1'b0;
		end
		if(w_memwrite_end)begin
			r_wbuffer_r[w_key] <= 1'b0;
		end
	end
end

//mem_write signal

assign w_fifo_empty = w_fifo_point == w_fifo_posi;
assign w_memwrite_req.wen = 4'b1111;
assign w_memwrite_req.len = WORD_PER_LINE - 1;
assign w_memwrite_req.addr = {r_writeback_addr[31:LINE_BYTE_OFFSET],{LINE_BYTE_OFFSET{1'b0}}};
assign w_memwrite_req.size = 3'b010;
assign w_memwrite_we = r_state == WRITE_WAITING && w_state != WRITE_WAITING;
assign w_memwrite_start = i_memwrite_start;
assign w_memwrite_end = i_memwrite_end;
assign o_write_data = r_mem_wbuffer[w_key];
assign o_mem_write_we = w_memwrite_we;
assign o_memwrite_req = w_memwrite_req;

//lru位的读写 更新时机和pipeline2-3相同
assign w_lru_select = lru_select(r_lru_ram[r_indexa]);
always_ff @(posedge i_clk) begin
	if(i_rst)begin
		r_lru_ram <= 0;
		r_save_select_way <= 0;
		r_save_onehot_way <= '0;
	end
	else begin
		if(w_cache_inst_hit)begin
			r_save_select_way <= w_cache_inst_hitway;
			r_save_onehot_way <= SET_ASSOC == 2?onehot1to2(w_cache_inst_hitway):onehot2to4(w_cache_inst_hitway);
		end
		else if(w_rbuffer_hita || w_waita)begin
			r_lru_ram[r_indexa] <= gen_new_lru(r_lru_ram[r_indexa], r_rbuffer_way);
		end
		else if (w_pipe_hit)begin
			r_lru_ram[r_indexa] <= gen_new_lru(r_lru_ram[r_indexa],w_hit_way);
		end
		else if(w_idle_miss)begin
			r_lru_ram[r_indexa] <= gen_new_lru(r_lru_ram[r_indexa],lru_select(r_lru_ram[r_indexa]));
			r_save_select_way <= lru_select(r_lru_ram[r_indexa]);
			r_save_onehot_way <= lru_onehot(r_lru_ram[r_indexa]);
		end
	end	
end

endmodule