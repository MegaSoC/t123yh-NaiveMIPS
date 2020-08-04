`include "def.svh"

module new_simple_bram
  #(
    parameter ADDR_WIDTH = 10,
    parameter DATA_WIDTH = 32,
    parameter CLEAR_ON_INIT = 0,
    parameter ENABLE_BYPASS = 1
    )
   (
    input 		    clk,
    input [ADDR_WIDTH-1:0]  raddr,
    input 		    re,
    input [ADDR_WIDTH-1:0]  waddr,
    input 		    we,
    input [31:0]  din,
    output [DATA_WIDTH-1:0] dout,
    output [DATA_WIDTH*8-1:0] dout_all,

    input hit_write,    
    input [3:0] byte_ben,
    input store ,

    input [DATA_WIDTH*8-1:0] din_all
    );
  logic [DATA_WIDTH*2-1:0] ram_out[3:0];
  logic [DATA_WIDTH*2-1:0] ram_in[3:0];
  logic [31:0] wea_out;
  logic [31:0] cpu_we_out;
  logic [31:0] final_wea ;

  assign dout_all ={ram_out[3],ram_out[2],ram_out[1],ram_out[0]};
  assign {
    ram_in[3],ram_in[2],ram_in[1],ram_in[0]
  } = (store)? {8{din[31:0]}} : din_all[DATA_WIDTH*8-1:0];
  
  logic [ADDR_WIDTH-1:0] cur_addr;
  assign cur_addr = (we ) ? waddr : raddr;

  genvar s0;
  generate 
  for(s0=0;s0<4'd4 ;s0=s0+1) begin : way_banks
    blk_mem_gen_2 my_way (
    .clka(clk),   
    .ena(1'b1),      
    .wea(final_wea[(s0+1)*8-1:s0*8]),      
    .addra(cur_addr[9:3]),  
    .dina(ram_in[s0]),    
    .douta(ram_out[s0])  
    );
  end
  endgenerate



  
  logic [2:0] addr_pre ;
  always_ff @(posedge clk) begin
      addr_pre <= raddr[2:0];
  end

  load_data_sel user_load(
    .datain(dout_all),
    .offset(addr_pre[2:0]),
    .dataout(dout)
  );
  
  expand cpu_8_1(
      .enable(we) ,
      .offset(waddr[2:0]) ,
      .out(cpu_we_out) ,
      .v(byte_ben) 
  );

  assign final_wea = hit_write ?  {32{we}} : cpu_we_out ; 
    
    
endmodule
