`include "def.svh"

module mem_read # (
    parameter LEN_UNIT = 8,
    parameter LINE_BYTE_OFFSET = 6
    ) (
    input logic i_clk,
    input logic i_rst,

    input mem_read_req i_instr_req, 
    input logic i_icache_we,
    input logic i_isram_we,
    input mem_read_req i_data_req,
    input logic i_dcache_we,
    input logic i_dsram_we,
    input logic i_memread_stall,
    input logic i_write_process,
    input word  i_write_address,
    output mem_read_resp o_resp,
    output logic o_icache_end,
    output logic o_icache_start,
    output logic o_dcache_end,
    output logic o_dcache_start,
    output logic [31:0] o_start_va,
    output logic [31:0] o_start_addr,
    output logic o_line_num,
    output logic o_instr_empty,
    output logic o_data_empty,
    output logic o_empty,

    output axi_r_req axi_bus_req,
    input  axi_r_resp axi_bus_resp
);

mem_read_req r_instr_req, r_data_req;
mem_read_req w_din1,w_din2,w_dout;
logic [31:0] r_va,r_addr;
logic [1:0] r_status;
logic w_axi_arvalid,r_axi_arvalid, r_end, w_start,r_burst_process;
logic [3:0] r_dataid, r_instid, w_nowid;
logic full,w_empty,r_push1,w_push1,w_push2,r_push2,w_pop,r_pop;
always_comb begin
    if(w_empty)begin
        axi_bus_req.arvalid = 0;
    end
    else begin
        //axi_bus_req.arvalid = r_axi_arvalid && !(i_memread_stall && w_dout.status == 2'b10);
        axi_bus_req.arvalid = r_axi_arvalid && !(i_memread_stall && w_dout.status == 2'b10) 
        && !(i_write_process && i_write_address[31:LINE_BYTE_OFFSET]==w_dout.startaddr[31:LINE_BYTE_OFFSET]);

    end
end
assign o_icache_start = w_empty? 0:(axi_bus_req.arvalid && w_dout.status == 0);
assign o_dcache_start = w_empty? 0:(axi_bus_req.arvalid && w_dout.status == 2'b10);
assign o_start_addr = w_dout.startaddr;
assign o_start_va = w_dout.va;
assign o_line_num = ((axi_bus_req.arlen + 1) >> $clog2(LEN_UNIT)) == 2; //1:2 0:1
assign o_icache_end = r_end && r_status == 0;
assign o_dcache_end = r_end && r_status == 2'b10;
assign o_empty = w_empty;

logic w_empty1, w_empty2;
logic r_valid_flag;
assign w_empty = w_empty1 && w_empty2;
always_comb begin
    w_axi_arvalid = r_axi_arvalid;
    if(w_axi_arvalid == 0 && ((w_push1||w_push2) & w_empty) || (r_pop & ~w_empty))begin
            w_axi_arvalid = 1;
    end
    else if(w_axi_arvalid == 1 && axi_bus_resp.arready && axi_bus_req.arvalid)
            w_axi_arvalid = 0;
end


always_ff @(posedge i_clk) begin
    if(i_rst)begin
    r_valid_flag <= 0;
    end
    else begin
        if(axi_bus_req.arvalid)begin
            r_valid_flag <= 1;
        end
        else if(axi_bus_resp.rlast && axi_bus_resp.rvalid) begin
            r_valid_flag <= 0;
        end
    end
end
logic [4:0] r_icache_req_num, r_dcache_req_num, w_icache_req_num, w_dcache_req_num;
logic w_instr_we, w_data_we;
assign w_instr_we = i_icache_we | i_isram_we;
assign w_data_we = i_dcache_we | i_dsram_we;
always_comb begin
    w_icache_req_num = r_icache_req_num;
    w_dcache_req_num = r_dcache_req_num;
    if(w_pop)begin
        if(w_dout.status == 2'b10)begin
            w_dcache_req_num -=1;
        end
        if(w_dout.status == 0)begin
            w_icache_req_num -=1;
        end
    end
    if(i_icache_we)begin
        w_icache_req_num +=1;
    end
    if(i_dcache_we)begin
        w_dcache_req_num +=1;
    end
end

always_ff @(posedge i_clk) begin
    if(i_rst)begin
        r_icache_req_num <= 0;
        r_dcache_req_num <= 0;
    end
    else begin
        r_icache_req_num <= w_icache_req_num;
        r_dcache_req_num <= w_dcache_req_num;
    end
end

always_ff @(posedge i_clk) begin
    if(i_rst) begin
        r_instr_req <= '0;
        r_data_req <= '0;
        r_push1 <= 0;
        r_push2 <= 0;
        r_pop <= 0;
        r_axi_arvalid <= 0;
        r_end <= 0;
        r_instid <= i_rst ? '0 : r_instid;
        r_dataid <= i_rst ? 4'b1000 : r_dataid;
        r_status <= 2'b00;
    end
    else begin
        if(w_instr_we) begin
            r_instr_req <= i_instr_req;
            r_instid <= r_instid == 4'b0111 ? '0 : r_instid + 1; 
        end
        if(w_data_we)begin
            r_data_req <= i_data_req;
            r_dataid <= r_dataid == 4'b1111 ? 4'b1000 : r_dataid + 1;
        end
        r_push2 <= w_push2;
        r_status <= w_empty ? 0 :w_dout.status;
        r_push1 <= w_push1;
        r_pop <= w_pop;
        if(w_empty && !w_instr_we && !w_data_we) begin
            r_axi_arvalid <= 0;
        end
        else begin
            r_axi_arvalid <= w_axi_arvalid;
        end
        r_end <= w_empty ? 0:(axi_bus_resp.rlast && axi_bus_resp.rvalid );
    end
end
logic w_valid;
assign w_valid = w_empty ? 0 :(axi_bus_resp.rvalid );
assign o_resp.firstva = r_va;
assign o_resp.firstaddr = r_addr;
assign o_resp.data = axi_bus_resp.rdata;
assign o_resp.valid0 = w_valid && (w_empty? 0 : w_dout.status==2'b00);
assign o_resp.valid1 = w_valid && (w_empty? 0 : w_dout.status==2'b01);
assign o_resp.valid2 = w_valid && (w_empty? 0 : w_dout.status==2'b10);
assign o_resp.valid3 = w_valid && (w_empty? 0 : w_dout.status==2'b11);
assign o_resp.last = axi_bus_resp.rlast;
assign o_instr_empty = r_icache_req_num == 0;
assign o_data_empty = r_dcache_req_num == 0;

assign axi_bus_req.arid = w_nowid;
assign axi_bus_req.arburst = axi_bus_req.arlen == '0 ? '0: 2'b01;
assign axi_bus_req.arsize = w_dout.size;  //16 bytes = 4 words
assign axi_bus_req.arlock =  2'b00  ;
assign axi_bus_req.arcache = 4'b0000;
assign axi_bus_req.arprot = 3'b000 ;
assign axi_bus_req.arlen = w_dout.len; //8 or 16
assign axi_bus_req.araddr = w_dout.startaddr;

assign axi_bus_req.rready  =1'b1;

always_ff @(posedge i_clk) begin
    if(i_rst ) begin
        r_va <= 0;
        r_addr <= 0;
        r_burst_process <= 0;
    end
    else if(r_axi_arvalid) begin
        r_va <= w_dout.va; 
        r_addr <= w_dout.startaddr;
    end
    else if (axi_bus_resp.rvalid) begin
        r_va <= r_va + 4;
        r_addr <= r_addr + 4;
        r_burst_process <= ~axi_bus_resp.rlast;
    end
    
end

assign w_push2 = w_instr_we;
assign w_push1 = w_data_we;
always_comb begin
    w_pop = 0;
    if(axi_bus_resp.rlast && ~w_empty && axi_bus_resp.rvalid)begin
        w_pop = 1;
    end
end

assign w_din2 = r_instr_req;
assign w_din1 = r_data_req;

dual_fifo_wrapper #(
    .DATA_WIDTH($bits(w_din1)+$bits(r_dataid)),
    .DEPTH(8)
)
fifo_instance(
    .clk_i(i_clk),
    .rst_i(i_rst),
    .data_i1({w_din1,r_dataid}),
    .data_i2({w_din2,r_instid}),
    .push_i1(r_push1),
    .push_i2(r_push2),
    .pop_i(w_pop),
    .data_o({w_dout,w_nowid}),
    .empty_o1(w_empty1),
    .empty_o2(w_empty2),
    .full_o1(full),
    .full_o2(),
    .flush_i1('0),
    .flush_i2('0)
);
    
endmodule
