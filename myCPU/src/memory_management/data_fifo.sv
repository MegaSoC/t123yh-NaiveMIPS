`include "def.svh"

module data_fifo(
    input logic i_clk,
    input logic i_rst,
    
    input logic i_va_valid,
    input word  i_rva,
    input word  i_wva,
    input word  i_data,
    input logic i_read_stall,
    input logic i_write_stall,
    input logic i_ren,
    input logic i_wen,
    input logic [3:0] i_wbyteen,
    input logic  [3:0] i_rbyteen,

    output logic o_datareq_valid,
    output word  o_data,
    output word  o_va,
    output logic o_ren,
    output logic o_wen,
    output logic [3:0] o_byteen,
    output logic o_full
);

logic w_full, w_empty, w_push, w_pop, w_rorw;
word w_dout, w_din;
logic [3:0] w_byteen;
assign w_byteen =i_ren ? i_rbyteen : i_wbyteen;
assign w_push = i_va_valid & (!i_rst);
assign w_din = i_ren ? i_rva : i_wva;
assign o_datareq_valid = ~w_empty;
assign o_va = w_dout;
assign o_ren = ~w_rorw;
assign o_wen = w_rorw;
assign o_full = w_full;

always_comb begin
    if(w_empty)begin
        w_pop = 0;
    end
    else begin
        if((i_read_stall && ~w_rorw)||(i_write_stall && w_rorw))begin
            w_pop = 0;
        end
        else begin
            w_pop = 1;
        end
    end
end

fifo_v3 #(
        .FALL_THROUGH(1'b1), // fifo is in fall-through mode
        .DATA_WIDTH  (32+32+4+1),   // default data width if the fifo is of type logic
        .DEPTH       (16)    // depth can be arbitrary from 0 to 2**32
    ) fifo
    (
        .clk_i(i_clk),            // Clock
        .rst_i(i_rst),            // Reset active high
        .flush_i(0),          // flush the queue
        .testmode_i(0),       // test_mode to bypass clock gating
        .full_o(w_full),           // queue is full
        .empty_o(w_empty),          // queue is empty
        .usage_o(),  // fill pointer
        .data_i({w_din,i_data,w_byteen,i_wen}),           // data to push into the queue
        .push_i(w_push),           // data is valid and can be pushed to the queue
        .data_o({w_dout,o_data,o_byteen,w_rorw}),           // output data
        .pop_i(w_pop)             // pop head from queue
    );


    
endmodule