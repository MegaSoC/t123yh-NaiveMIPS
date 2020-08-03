`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/05 16:50:53
// Design Name: 
// Module Name: my_tag_ram
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

module my_tag_ram
  #(
    parameter ADDR_WIDTH = 7,
    parameter DATA_WIDTH = 45,
    parameter CLEAR_ON_INIT = 0,
    parameter ENABLE_BYPASS = 1
    )
   (
    input       clk,
    input [ADDR_WIDTH-1:0]  raddr,
    input       re,
    input [ADDR_WIDTH-1:0]  waddr,
    input [1:0] we,
    input [DATA_WIDTH-1:0]  din,
    output logic [DATA_WIDTH-1:0] dout,
    input  rst  ,
    input refill ,
    
    input cache_reset ,


    input load_over 
    );
   logic [2:0]     tag_bit[(1<<ADDR_WIDTH)-1:0];
    
   
   logic [20:0] tag_way_in [1:0];
   logic [20:0] tag_way_out [1:0];
   assign tag_way_in[0] = (!cache_reset| !we[0]) ? 21'b0 : din[20:0] ;
   assign tag_way_in[1] = (!cache_reset| !we[1]) ? 21'b0 : din[42:22] ;
  
    
   logic [2:0] tag_bit_in;
   logic [2:0] tag_bit_out;
 //  logic [4:0] tag_bit_out;   
   
    
    
   assign tag_bit_in =  {din[44:43],din[21]};
    
   logic  [ADDR_WIDTH-1:0] reg_initial_addr; 
   
   
   logic [ADDR_WIDTH-1:0] tag_addr;
   assign tag_addr  = !cache_reset? reg_initial_addr :
                                     (refill | load_over )? waddr :
                                                  raddr ;
     logic [ADDR_WIDTH-1:0] tag_addr_pre ;
     always_ff @(posedge clk)begin
             tag_addr_pre <= tag_addr;
     end
     assign  tag_bit_out = tag_bit[ tag_addr_pre ] ; 
//   always_ff @(posedge clk)begin
//      tag_bit_out <=tag_bit[tag_addr];
//   end


   genvar s0;
   generate
      for(s0=0;s0<=1;s0=s0+1) begin :way_tags
         tag_ram_bram way_tag(
            .clka(clk),    // input logic clka
            .ena(1'b1),      // input logic ena
            .wea( (refill& we[s0])  | !cache_reset),      // input logic [0 : 0] wea
            .addra(tag_addr),  // input logic [6 : 0] addra
            .dina(tag_way_in[s0]),    // input logic [19 : 0] dina
            .douta(tag_way_out[s0])  // output wire [19 : 0] douta
         );
      end
   endgenerate
   
  

   integer i;
   always_ff @(posedge clk) begin
      if(rst | !cache_reset )begin
         for(i=0;i<(1<<ADDR_WIDTH) ;i=i+1)
               tag_bit[i]<=3'b0;
    //     tag_bit_out <=5'b0;
      end 
      else begin
         for(i =0;i<2;i=i+1) begin
                if(we[i]) begin
                  tag_bit[waddr][i] <= tag_bit_in[i];
                end
         end
         if(|we)
            tag_bit[waddr][2] <= tag_bit_in[2];
      end 
   end
   
   // logic next_re ;
   // always_ff @(posedge clk )begin
   //      if(rst) begin 
   //          next_re <=1'b0;
   //      end
   //      else 
   //          next_re<= re;
   // end

   
   assign dout =
   {
      tag_bit_out[2:1] ,tag_way_out[1],tag_bit_out[0],tag_way_out[0] 
   };
    






   always_ff @(posedge clk)begin
      if(rst)begin
         reg_initial_addr <= 0;
      end
      else if(!cache_reset) begin
         reg_initial_addr<=reg_initial_addr+1;
      end
   end
    

endmodule