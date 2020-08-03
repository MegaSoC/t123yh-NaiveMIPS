`include "def.svh"

module new_simple_bram
  #(
    parameter ADDR_WIDTH = 10,
    parameter DATA_WIDTH = 32,
    parameter CLEAR_ON_INIT = 0,
    parameter ENABLE_BYPASS = 1
    )
   (
    input logic  clk,
    input logic [ADDR_WIDTH-1:0]  raddr,
    input	logic  re,
    input logic [ADDR_WIDTH-1:0]  waddr,
    input logic   we,
    input logic [31:0]  din,
    output logic [DATA_WIDTH-1:0] dout,
    output logic [DATA_WIDTH*8-1:0] dout_all,

    input logic hit_write,    //回填的写使能
    input logic [3:0] byte_ben,
    input logic store ,

    input logic [DATA_WIDTH*8-1:0] din_all
    );
  logic [DATA_WIDTH*2-1:0] ram_out[3:0];
  logic [DATA_WIDTH*2-1:0] ram_in[3:0];
  logic [31:0] wea_out;
  logic [31:0] cpu_we_out;
  logic [31:0] final_wea ;//�?终的写使�?
  //assign ram_in = din;

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
    .clka(clk),    // input logic clka
    .ena(1'b1),      // input logic ena
    .wea(final_wea[(s0+1)*8-1:s0*8]),      // input logic [ ] wea
    .addra(cur_addr[9:3]),  // input logic [6 : 0] addra
    .dina(ram_in[s0]),    // input logic [255 : 0] dina
    .douta(ram_out[s0])  // output logic [255 : 0] douta
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
