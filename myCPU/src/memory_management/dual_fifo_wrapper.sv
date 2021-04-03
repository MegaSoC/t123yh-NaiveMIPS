`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 00:09:42
// Design Name: 
// Module Name: dual_fifo_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dual_fifo_wrapper #(
    parameter int unsigned DATA_WIDTH   = 32,   // default data width if the fifo is of type logic
    parameter int unsigned DEPTH        = 8,    // depth can be arbitrary from 0 to 2**32
    parameter type dtype                = logic [DATA_WIDTH-1:0]
)(
    input  logic  clk_i,            // Clock
    input  logic  rst_i,            // Reset active high
    input  logic  flush_i1,          // flush the queue
    input  logic  flush_i2,          // flush the queue
    // status flags
    output logic  full_o1,           // queue is full
    output logic  full_o2,           // queue is full
    
    input  dtype  data_i1,           // data to push into the queue
    input  logic  push_i1,           // data is valid and can be pushed to the queue
    input  dtype  data_i2,
    input  logic  push_i2,
    
    // as long as the queue is not empty we can pop new elements
    output dtype  data_o,           // output data
    input  logic  pop_i,             // pop head from queue
    output logic  empty_o1,          
    output logic  empty_o2
);

dtype data_o1, data_o2;
logic pop_i1, pop_i2;


fifo_v3_old #(.DEPTH(DEPTH), .DATA_WIDTH(DATA_WIDTH), .FALL_THROUGH(1)) 
  fifo_1 (
  .clk_i(clk_i),
  .rst_i(rst_i),
  .flush_i(flush_i1),
  .full_o(full_o1),
  .data_i(data_i1),
  .push_i(push_i1),
  
  .data_o(data_o1),
  .pop_i(pop_i1),
  .empty_o(empty_o1)
);

fifo_v3_old #(.DEPTH(DEPTH), .DATA_WIDTH(DATA_WIDTH), .FALL_THROUGH(1)) 
  fifo_2 (
  .clk_i(clk_i),
  .rst_i(rst_i),
  .flush_i(flush_i2),
  .full_o(full_o2),
  .data_i(data_i2),
  .push_i(push_i2),
  
  .data_o(data_o2),
  .pop_i(pop_i2),
  .empty_o(empty_o2)
);


reg last_read;

logic current_read;
logic force_switch;

always_comb begin
    current_read = 0;
    pop_i1 = 0;
    force_switch = 0;
    pop_i2 = 0;
    if (empty_o1 && empty_o2) begin
        data_o = 'bx;
    end else begin
        if (empty_o1 && ~empty_o2) begin
            current_read = 1;
            force_switch = 1;
        end else if (empty_o2 && ~empty_o1) begin
            current_read = 0;
            force_switch = 1;
        end else begin // both not empty
            current_read = ~last_read;
        end
    
        if (current_read) begin
            data_o = data_o2;
            pop_i2 = pop_i;
            pop_i1 = 0;
        end else begin
            data_o = data_o1;
            pop_i2 = 0;
            pop_i1 = pop_i;
        end
    end
end

always @(posedge clk_i) begin
    if (rst_i) begin
        last_read <= 1;
    end else begin
        if (pop_i) begin
            last_read <= current_read;
        end else if (force_switch) begin
            last_read <= ~current_read;
        end
    end
end
endmodule
