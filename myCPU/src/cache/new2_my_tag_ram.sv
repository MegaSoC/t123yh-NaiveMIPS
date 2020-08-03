`timescale 1ns / 1ps
`include "def.svh"


module new2_my_tag_ram
  #(
    parameter ADDR_WIDTH = 7,
    parameter DATA_WIDTH = 45,
    parameter CLEAR_ON_INIT = 0,
    parameter ENABLE_BYPASS = 1
    )
   (
    input logic   clk,
    input logic [ADDR_WIDTH-1:0]  raddr,
    input logic      re,
    input logic [ADDR_WIDTH-1:0]  waddr,
    input logic      we,
    input logic [DATA_WIDTH-1:0]  din,
    output logic [DATA_WIDTH-1:0] dout,
    input  logic rst  ,
    input logic refill ,
    input logic select ,
    input logic [ADDR_WIDTH-1:0] tag_bit_raddr,
    input logic cache_reset 
    );
   logic tag_bit[(1<<ADDR_WIDTH)-1:0];
    
   
   logic [20:0] tag_way_in [1:0];
   logic [20:0] tag_way_out [1:0];
   assign tag_way_in[0] = !cache_reset ? 21'b0 : din[20:0] ;
   assign tag_way_in[1] = !cache_reset ? 21'b0 : din[42:22] ;
  
    
   logic  tag_bit_in;
   logic  tag_bit_out;
 //  logic [4:0] tag_bit_out;   
   
    
    
   assign tag_bit_in =  {din[44]};
    
   logic  [ADDR_WIDTH-1:0] reg_initial_addr; 
   logic [ADDR_WIDTH-1:0] cur_addr;
   logic [ADDR_WIDTH-1:0] cur_addr_pre;
   
   assign cur_addr = !cache_reset? reg_initial_addr: 
                    (refill| select ) ? waddr : raddr ;

   always @(posedge clk)begin
       if(rst)begin
           reg_initial_addr <= 0;
       end
       else if(!cache_reset) begin
            reg_initial_addr<=reg_initial_addr+1;
       end
   end
   
   genvar s0;
   generate
      for(s0=0;s0<=1;s0=s0+1) begin :way_tags
         tag_ram_bram way_tag(
            .clka(clk),    // input logic clka
            .ena(1'b1),      // input logic ena
            .wea(refill | !cache_reset),      // input logic [0 : 0] wea
            .addra(cur_addr),  // input logic [6 : 0] addra
            .dina(tag_way_in[s0]),    // input logic [19 : 0] dina
            .douta(tag_way_out[s0])  // output logic [19 : 0] douta
         );
      end
   endgenerate
   
   
    
    
   integer i;
   always @(posedge clk) begin
      if(rst)begin
         for(i=0;i<(1<<ADDR_WIDTH) ;i=i+1)
               tag_bit[i]<=0;
      end 
      else begin       
         if(refill) begin
            tag_bit[waddr] <= tag_bit_in;
         end else if (we) begin
            tag_bit[tag_bit_raddr] <= tag_bit_in;
         end
      end
      cur_addr_pre <= cur_addr;
   end
   
    assign tag_bit_out = tag_bit[cur_addr_pre];
  //  assign tag_bit_out = tag_bit[tag_bit_raddr] ;
    
    assign dout =
     {
      tag_bit_out ,1'b0 ,tag_way_out[1],1'b0,tag_way_out[0] 
     };
    
    
endmodule