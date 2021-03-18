`include "def.svh"
 module mem_write #(
    parameter FIFO_DEPTH = 16, 
    parameter LINE_WORD_NUM = 8 
 )(
    input logic i_clk,
    input logic i_rst,

    input logic i_dcache_we,
    input logic i_sram_we,
    input word [LINE_WORD_NUM - 1 : 0] i_dcache_data,
    input word i_sram_data,
    output logic [$clog2(FIFO_DEPTH) - 2 : 0] o_dcache_lock,
    output logic [$clog2(FIFO_DEPTH) - 2 : 0] o_sram_lock,

    output logic [$clog2(FIFO_DEPTH) - 1 : 0] o_key,
    input mem_write_req i_dcache_req,
    input mem_write_req i_sram_req,

    output logic o_empty,
    output logic o_sram_empty,
    output logic o_sram_full,
    output logic o_sram_start,
    output logic o_sram_end,
    output logic o_dcache_start,
    output logic o_dcache_end,
    output logic o_write_process,
    output word  o_write_address,

    input  axi_w_resp axi_bus_resp,
    output axi_w_req axi_bus_req
 );

 localparam int BUFFER_NUM = FIFO_DEPTH >> 1;

 function logic [$clog2(BUFFER_NUM) - 1 : 0] first_zero(input logic [BUFFER_NUM - 1 : 0] in);
    if(BUFFER_NUM == 8) begin
        casez(in)
            8'b???????0: return 3'b000;
            8'b??????01: return 3'b001;
            8'b?????011: return 3'b010;
            8'b????0111: return 3'b011;
            8'b???01111: return 3'b100;
            8'b??011111: return 3'b101;
            8'b?0111111: return 3'b110;
            8'b01111111: return 3'b111;
            default: return 3'b0;
        endcase
    end
    else if(BUFFER_NUM == 4)begin
        casez(in)
            4'b???0: return 2'b00;
            4'b??01: return 2'b01;
            4'b?011: return 2'b10;
            4'b0111: return 2'b11;
            default: return 2'b0;
        endcase
    end
    else if (BUFFER_NUM == 2) begin
        casez(in)
            2'b?0: return 1'b0;
            2'b01: return 1'b1;
            default: return 1'b0;
        endcase
    end
endfunction

 function logic [$clog2(FIFO_DEPTH) - 2 : 0] gen_lock( input logic [BUFFER_NUM - 1 : 0] history );
	return first_zero(history);
endfunction

word [LINE_WORD_NUM - 1 : 0] r_data;
word w_sram_data, r_sram_data;
logic [$clog2(LINE_WORD_NUM) - 1 : 0] r_cnt, w_cnt;
logic [1:0] [BUFFER_NUM - 1 : 0] r_buffer_history;
logic w_push1, r_push1, w_push2, r_push2, w_pop, r_pop, w_empty, w_empty1,w_empty2, w_full, w_lock_select, w_key_select;
logic w_sram_start, w_dcache_start, r_write_process, w_start, w_write_process;
logic w_axi_awvalid, r_axi_awvalid, w_axi_wvalid, r_axi_wvalid;
logic [$clog2(FIFO_DEPTH) - 1 : 0] r_key1, r_key2,w_key;
logic [$clog2(FIFO_DEPTH) - 2 : 0] w_dcache_lock, w_sram_lock, w_lock, r_sram_req_num;
mem_write_req r_dcache_req, r_sram_req, w_out_req;
assign w_empty = w_empty1 && w_empty2;
assign o_sram_empty = w_empty1;
assign w_dcache_lock = gen_lock(r_buffer_history[0]);
assign w_sram_lock = gen_lock(r_buffer_history[1]);
assign o_dcache_lock = w_dcache_lock;
assign o_sram_lock = w_sram_lock;
assign o_empty = w_empty;
assign o_sram_full = r_sram_req_num >= (BUFFER_NUM - 1);
assign w_push1 = i_sram_we;
assign w_push2 = i_dcache_we;
assign w_key_select = w_key[$clog2(FIFO_DEPTH) - 1];
assign o_key = w_key;
assign w_sram_start = axi_bus_resp.awready && r_axi_awvalid && w_key_select;
assign w_dcache_start = axi_bus_resp.awready && r_axi_awvalid && ~w_key_select;
assign w_start = w_sram_start | w_dcache_start;
assign o_dcache_start = w_dcache_start;
assign o_sram_start = w_sram_start;
assign w_pop = axi_bus_resp.bvalid && r_write_process;
assign o_sram_end = w_pop && w_key_select;
assign o_dcache_end = w_pop && ~w_key_select;
assign o_write_process = r_write_process;
assign o_write_address = w_empty ? '0: w_out_req.addr;

always_comb begin 
    w_write_process = r_write_process;
    if(axi_bus_resp.bvalid && w_write_process)begin
        w_write_process = 1'b0;
    end
    if(w_start) begin
        w_write_process = 1'b1;
    end
end

always_ff @(posedge i_clk) begin
    if(i_rst)begin
        r_buffer_history <= '0;
        r_push1 <= 0;
        r_pop <= 0;
        r_push2 <= 0;
        r_dcache_req <= '0;
        r_sram_req <= '0;
        r_data <= '0;
        r_axi_awvalid <= 0;
        r_axi_wvalid <= 0;
        r_write_process <= 0;
        r_cnt <= '0;
        r_key1 <= '0;
        r_key2 <= '0;
        r_sram_data <= '0;
        r_sram_req_num <= '0;
    end
    else begin
        if (i_dcache_we)begin
            r_key2 <= {1'b0, w_dcache_lock};
            r_buffer_history[0][w_dcache_lock] <= 1'b1;
            r_dcache_req <= i_dcache_req;
        end
        if (i_sram_we)begin
            r_key1 <= {1'b1,w_sram_lock};
            r_sram_data <= i_sram_data;
            r_buffer_history[1][w_sram_lock] <= 1'b1;
            r_sram_req <= i_sram_req;
        end
        if (axi_bus_resp.bvalid && r_write_process)begin
            r_buffer_history[w_key] <= 1'b0;
        end//与w_pop坌时
        r_sram_req_num <= r_sram_req_num + i_sram_we - (axi_bus_resp.bvalid && r_write_process && w_key_select);
        r_write_process <= w_write_process;
        r_push1 <= w_push1;
        r_push2 <= w_push2;
        r_pop <= w_pop;
        r_axi_awvalid <= w_axi_awvalid;
        r_axi_wvalid <= w_axi_wvalid;
        r_cnt <= w_cnt;
        if(w_start)begin
            r_cnt <= '0;
            if(w_key_select)
                r_data[0] <= w_sram_data;
            else begin
                r_data <= i_dcache_data;
                if(LINE_WORD_NUM == 8) begin
                    r_data[0] <= i_dcache_data[0];
                    r_data[1] <= i_dcache_data[1];
                    r_data[2] <= i_dcache_data[2];
                    r_data[3] <= i_dcache_data[3];
                    r_data[4] <= i_dcache_data[4];
                    r_data[5] <= i_dcache_data[5];
                    r_data[6] <= i_dcache_data[6];
                    r_data[7] <= i_dcache_data[7];
                end
                else if(LINE_WORD_NUM == 16)begin
                    r_data[0] <=  i_dcache_data[0];
                    r_data[1] <=  i_dcache_data[1];
                    r_data[2] <=  i_dcache_data[2];
                    r_data[3] <=  i_dcache_data[3];
                    r_data[4] <=  i_dcache_data[4];
                    r_data[5] <=  i_dcache_data[5];
                    r_data[6] <=  i_dcache_data[6];
                    r_data[7] <=  i_dcache_data[7];
                    r_data[8] <=  i_dcache_data[8];
                    r_data[9] <=  i_dcache_data[9];
                    r_data[10] <= i_dcache_data[10];
                    r_data[11] <= i_dcache_data[11];
                    r_data[12] <= i_dcache_data[12];
                    r_data[13] <= i_dcache_data[13];
                    r_data[14] <= i_dcache_data[14];
                    r_data[15] <= i_dcache_data[15];
                end
            end
        end
    end
end

always_comb begin
    w_cnt = r_cnt;
    if(axi_bus_resp.wready)begin
        w_cnt += 1;
    end
end
always_comb begin
    w_axi_awvalid = r_axi_awvalid;
    if(w_axi_awvalid==0 && ((w_push1 || w_push2) & w_empty) || (r_pop & ~w_empty))
        w_axi_awvalid = 1;
    else if(w_axi_awvalid == 1 && axi_bus_resp.awready)
        w_axi_awvalid = 0;
end
always_comb begin
    w_axi_wvalid = r_axi_wvalid;
    if(~w_axi_wvalid && w_start)begin
        w_axi_wvalid = 1'b1;
    end
    else if(axi_bus_resp.wready && r_cnt == w_out_req.len && w_axi_wvalid)begin
        w_axi_wvalid = 0;
    end
end

assign axi_bus_req.awid = 4'b0;
assign axi_bus_req.awaddr = w_out_req.addr;
assign axi_bus_req.awlen = w_out_req.len;
assign axi_bus_req.awsize = w_out_req.size;
assign axi_bus_req.awburst = axi_bus_req.awlen == '0 ? '0: 2'b01;
assign axi_bus_req.awlock = '0;
assign axi_bus_req.awprot = '0;
assign axi_bus_req.awcache = '0;
assign axi_bus_req.awvalid = r_axi_awvalid;

assign axi_bus_req.wid = 4'b0;
assign axi_bus_req.wvalid = r_axi_wvalid;
assign axi_bus_req.wdata = r_data[r_cnt];
assign axi_bus_req.wlast = r_axi_wvalid && r_cnt == w_out_req.len;
assign axi_bus_req.wstrb = w_out_req.wen;

assign axi_bus_req.bready = 1'b1;

dual_fifo_wrapper #(
        .DATA_WIDTH  ($clog2(FIFO_DEPTH) + $bits(r_sram_req) + $bits(r_sram_data)),   // default data width if the fifo is of type logic
        .DEPTH       (FIFO_DEPTH)    // depth can be arbitrary from 0 to 2**32
    ) fifo
    (
        .clk_i(i_clk),            // Clock
        .rst_i(i_rst),            // Reset active high
        .flush_i1('0),          // flush the queue
        .flush_i2('0),
        .full_o1(w_full),           // queue is full
        .full_o2(),
        .empty_o1(w_empty1),          // queue is empty
        .empty_o2(w_empty2),
        .data_i1({r_key1,r_sram_req,r_sram_data}),           // data to push into the queue
        .data_i2({r_key2,r_dcache_req,32'b0}),
        .push_i1(r_push1),           // data is valid and can be pushed to the queue
        .push_i2(r_push2),
        .data_o({w_key,w_out_req,w_sram_data}),           // output data
        .pop_i(w_pop)             // pop head from queue
    );
endmodule
