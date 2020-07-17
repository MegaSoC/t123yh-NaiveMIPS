`include "def.svh"

module mem_read # (
    parameter LINE_BYTE_OFFSET =7,
    parameter LEN_UNIT = 8,
    parameter DATA_BURST = 128
    ) (
    input logic i_clk,
    input logic i_rst,

    output axi_req axi_bus_req,
    input  axi_resp axi_bus_resp,

    input mem_read_req i_req,
    input logic i_we,
    output mem_read_resp o_resp,
    output logic o_end,
    output logic o_start,
    output logic [31:0] o_start_pc,
    output logic [31:0] o_start_addr,
    output logic o_line_num,
    output logic o_empty
);

assign axi_bus_req.arid = 4'b0;
assign axi_bus_req.arburst = 2'b01;
assign axi_bus_req.arsize = $clog2(DATA_BURST / 8);  //16 bytes = 4 words
//assign axi_bus.arlen  =  7'b0111;
assign axi_bus_req.arlock =  2'b00  ;
assign axi_bus_req.arcache = 4'b0000;
assign axi_bus_req.arprot = 3'b000 ;

assign axi_bus_req.rready  =1'b1;

assign axi_bus_req.awsize = 3'b010;
assign axi_bus_req.awlen  =  7'b0111;
assign axi_bus_req.awvalid = '0;
assign axi_bus_req.awaddr =32'b0;
assign axi_bus_req.awlock =2'b0;
assign axi_bus_req.awcache =4'b0;
assign axi_bus_req.awprot =3'b0;
assign axi_bus_req.awburst =2'b10;
assign axi_bus_req.awid = 4'b0;

assign axi_bus_req.wvalid =1'b0;
assign axi_bus_req.wstrb =4'b0;
assign axi_bus_req.wdata =32'b0;
assign axi_bus_req.wid = 4'b0;
assign axi_bus_req.wid = '0;

mem_read_req r_req;
mem_read_resp w_resp;
logic [31:0] r_pc,r_addr;
logic w_axi_arvalid = 0,r_axi_arvalid, r_end, w_start;
assign axi_bus_req.arvalid = r_axi_arvalid;
assign o_start = r_axi_arvalid;
assign o_start_addr = w_dout[36+32-LINE_BYTE_OFFSET-1:4+32-LINE_BYTE_OFFSET];
assign o_start_pc = {w_dout[36-LINE_BYTE_OFFSET-1 : 4],{LINE_BYTE_OFFSET{1'b0}}};
assign o_line_num = ((axi_bus_req.arlen + 1) >> $clog2(LEN_UNIT)) == 2; //1:2 0:1
assign o_end = r_end;

always_comb begin
    if(w_axi_arvalid==0 && (w_push & empty) || (r_pop & ~empty))
        w_axi_arvalid = 1;
    else if(w_axi_arvalid == 1 && axi_bus_resp.arready)
        w_axi_arvalid = 0;
    else 
        w_axi_arvalid = r_axi_arvalid;
end
always_ff @(posedge i_clk) begin
    if(i_rst) begin
        r_req <= 0;
        r_push <= 0;
        r_pop <= 0;
        r_axi_arvalid <= 0;
        r_end <= 0;
    end
    else begin
        if(i_we) begin
            r_req <= i_req;
        end
        r_push <= w_push;
        r_pop <= w_pop;
        r_axi_arvalid <= w_axi_arvalid;
        r_end <= axi_bus_resp.rlast;
    end
end

assign o_resp.firstpc = r_pc - DATA_BURST / 8;
assign o_resp.firstaddr = r_addr - DATA_BURST / 8;
assign o_resp.data = axi_bus_resp.rdata;
assign o_resp.valid = axi_bus_resp.rvalid;
assign o_resp.last = axi_bus_resp.rlast;
assign o_empty = empty;

always_ff @(posedge i_clk) begin
    if(i_rst) begin
        r_pc <= 0;
        r_addr <= 0;
    end
    else if(w_axi_arvalid) begin
        r_pc <= {w_dout[4+32-LINE_BYTE_OFFSET-1:4],{LINE_BYTE_OFFSET{1'b0}}}; 
        r_addr <= w_dout[36+32-LINE_BYTE_OFFSET-1:4+32-LINE_BYTE_OFFSET];
    end
    else if (axi_bus_resp.rvalid) begin
        r_pc <= r_pc + DATA_BURST / 8;
        r_addr <= r_addr + DATA_BURST / 8;
    end
    
end

logic full,empty,r_push,w_push,w_pop,r_pop;
assign w_push = i_we;
assign w_pop = axi_bus_resp.rlast & ~empty;

logic [37:0] w_din,w_dout;
assign w_din = {r_req.startaddr,r_req.pc[31:LINE_BYTE_OFFSET],r_req.len};
assign axi_bus_req.arlen = w_dout[3:0]; //8 or 16
assign axi_bus_req.araddr = w_dout[36+32-LINE_BYTE_OFFSET-1:4+32-LINE_BYTE_OFFSET];

fifo_v3 #(
        .FALL_THROUGH(1'b1), // fifo is in fall-through mode
        .DATA_WIDTH  (36+32-LINE_BYTE_OFFSET),   // default data width if the fifo is of type logic
        .DEPTH       (8)    // depth can be arbitrary from 0 to 2**32
    ) fifo
    (
        .clk_i(i_clk),            // Clock
        .rst_i(i_rst),            // Reset active high
        .flush_i(0),          // flush the queue
        .testmode_i(0),       // test_mode to bypass clock gating
        .full_o(full),           // queue is full
        .empty_o(empty),          // queue is empty
        .usage_o(),  // fill pointer
        .data_i(w_din),           // data to push into the queue
        .push_i(r_push),           // data is valid and can be pushed to the queue
        .data_o(w_dout),           // output data
        .pop_i(w_pop)             // pop head from queue
    );
    
endmodule