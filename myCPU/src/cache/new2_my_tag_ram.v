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

module new2_my_tag_ram
  #(
    parameter ADDR_WIDTH = 7,
    parameter DATA_WIDTH = 45,//(20+1+1)*2+1
    parameter CLEAR_ON_INIT = 0,
    parameter ENABLE_BYPASS = 1
    )
   (
    input       clk,
    input [ADDR_WIDTH-1:0]  raddr,
    input       re,
    input [ADDR_WIDTH-1:0]  waddr,
    input       we,
    input [DATA_WIDTH-1:0]  din,
    output wire [DATA_WIDTH-1:0] dout,
    input  rst  ,
    input refill ,
    input select ,
    input [ADDR_WIDTH-1:0] tag_bit_raddr,  //现在的pc的中间7位
    input cache_reset 
    );
   reg tag_bit[(1<<ADDR_WIDTH)-1:0]; //lru
    
   
   wire [20:0] tag_way_in [1:0];
   wire [20:0] tag_way_out [1:0];
   assign tag_way_in[0] = !cache_reset ? 21'b0 : din[20:0] ;
   assign tag_way_in[1] = !cache_reset ? 21'b0 : din[42:22] ;
  
    
   wire  tag_bit_in; 
   wire  tag_bit_out;
 //  reg [4:0] tag_bit_out;   
   
    
    
   assign tag_bit_in =  {din[44]};
    
   reg  [ADDR_WIDTH-1:0] reg_initial_addr; 
   wire [ADDR_WIDTH-1:0] cur_addr;
   reg [ADDR_WIDTH-1:0] cur_addr_pre;
   
   assign cur_addr = !cache_reset? reg_initial_addr: 
                    (refill| select ) ? waddr : raddr ;
   //复位时此变量依次递增让所有内存清0，读或写时分别用读写的地址

   always @(posedge clk)begin
       if(rst)begin
           reg_initial_addr <= 0;
       end
       else if(!cache_reset) begin
            reg_initial_addr<=reg_initial_addr+1;//复位时每个地址都清0
       end
   end
   
   genvar s0;
   generate
      for(s0=0;s0<=1;s0=s0+1) begin :way_tags
         tag_ram_bram way_tag(
            .clka(clk),    // input wire clka
            .ena(1'b1),      // input wire ena
            .wea(refill | !cache_reset),      // input wire [0 : 0] wea
            .addra(cur_addr),  // input wire [6 : 0] addra
            .dina(tag_way_in[s0]),    // input wire [19 : 0] dina
            .douta(tag_way_out[s0])  // output wire [19 : 0] douta
         );
      end
   endgenerate
   
   
    
    
   integer i;
   always @(posedge clk) begin
      if(rst)begin
         for(i=0;i<(1<<ADDR_WIDTH) ;i=i+1)
               tag_bit[i]<=0;  //迷惑行为
      end 
      else begin       
         if(refill) begin
            tag_bit[waddr] <= tag_bit_in; //重填时更改lru位
         end else if (we) begin
            tag_bit[tag_bit_raddr] <= tag_bit_in;//命中时改写lru
            //用mmu转换过的npc和用npc查找结果花一个周期，下一个周期到pc了，结果也出来了，所以此处lru对应的pc没问题，不存在时序出错的问题（lru对应npc）
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