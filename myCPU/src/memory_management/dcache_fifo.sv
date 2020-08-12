`include "def.svh"

module dcache_fifo #(
    parameter DCACHE_INFIFO = 8
)
    (
    input logic i_clk,
    input logic i_rst,
    
    input logic i_valid,
    input word  i_va,
    input word  i_data,
    input logic i_dcache_stall,
    input logic [3:0] i_wbyteen,

    output logic o_valid,
    output word  o_data,
    output word  o_va,
    output logic [3:0] o_byteen,
    output logic o_stall,
    output logic o_full
);

logic w_full, w_empty, w_push, w_pop, w_valid, r_head_valid;
word w_out_addr, w_in_addr, r_head_data, r_head_addr;
logic [3:0] w_byteen, r_head_byteen;
logic [2:0] r_last_req; //0:none 1:read 2:write
logic [$clog2(DCACHE_INFIFO) - 1 : 0] r_cnt;
assign w_push = ~o_stall & i_valid;
assign w_in_addr = i_va;
assign o_datareq_valid = ~w_empty;
assign o_va = w_out_addr;
assign o_full = w_full;
assign o_valid = r_head_valid;
assign o_byteen = r_head_byteen;
assign w_pop = !i_dcache_stall && !w_empty;
assign o_stall = i_dcache_stall && (r_cnt == (DCACHE_INFIFO - 1) || r_last_req == 2'b01);

// always_comb begin
//     if(w_empty)begin
//         w_pop = 0;
//     end
//     else begin
//         if((i_read_stall && ~w_rorw)||(i_write_stall && w_rorw))begin
//             w_pop = 0;
//         end
//         else begin
//             w_pop = 1;
//         end
//     end
// end

always_ff @(posedge i_clk) begin
    if(i_rst)begin
        r_head_byteen <= 0;
        r_head_valid <= 0;
        r_last_req <= 0;
        r_cnt <= 0;
    end
    else begin
        if(!i_dcache_stall)begin
            r_head_byteen <= w_byteen;
            r_head_valid <= w_valid;
        end
        if(i_valid)begin
            r_last_req <= (!i_wbyteen) ? 2'b10 : 2'b01;
        end
        if(w_push)begin
            r_cnt <= w_pop ? r_cnt : r_cnt + 1;
        end
        else if(w_pop)begin
            r_cnt <= r_cnt - 1;
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
        .data_i({i_va,i_data,i_wbyteen,i_valid}),           // data to push into the queue
        .push_i(w_push),           // data is valid and can be pushed to the queue
        .data_o({o_va,o_data,w_byteen,w_valid}),           // output data
        .pop_i(w_pop)             // pop head from queue
    );


    
endmodule