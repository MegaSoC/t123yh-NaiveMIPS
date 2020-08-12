`include "def.svh"

module instr_fifo(
    input logic i_clk,
    input logic i_rst,
    
    input logic i_npc_valid,
    input word  i_npc,
    input logic i_inn_stall,
    input logic i_flush,

    output logic o_icache_valid,
    output word  o_npc
);

logic w_full, w_empty, w_push, w_pop;
word w_dout, w_din;
assign w_pop = ~w_empty & ~i_inn_stall;
assign w_push = i_npc_valid & (!i_rst);
assign w_din = i_npc;
assign o_icache_valid = ~w_empty && w_dout[1:0] == 2'b0;
assign o_npc = w_dout;

fifo_v3 #(
        .FALL_THROUGH(1'b1), // fifo is in fall-through mode
        .DATA_WIDTH  (32),   // default data width if the fifo is of type logic
        .DEPTH       (16)    // depth can be arbitrary from 0 to 2**32
    ) fifo
    (
        .clk_i(i_clk),            // Clock
        .rst_i(i_rst),            // Reset active high
        .flush_i(i_flush),          // flush the queue
        .testmode_i(0),       // test_mode to bypass clock gating
        .full_o(w_full),           // queue is full
        .empty_o(w_empty),          // queue is empty
        .usage_o(),  // fill pointer
        .data_i(w_din),           // data to push into the queue
        .push_i(w_push),           // data is valid and can be pushed to the queue
        .data_o(w_dout),           // output data
        .pop_i(w_pop)             // pop head from queue
    );


    
endmodule