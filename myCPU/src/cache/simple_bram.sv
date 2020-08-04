`include "def.svh"

module simple_bram
  #(
    parameter ADDR_WIDTH = 10,
    parameter DATA_WIDTH = 32,
    parameter CLEAR_ON_INIT = 0,
    parameter ENABLE_BYPASS = 1
    )
   (
    input  logic		    clk,
    input  logic [ADDR_WIDTH-1:0]  raddr,
    input  logic 		    re,
    input  logic [ADDR_WIDTH-1:0]  waddr,
    input  logic we,
    input  logic [31:0]  din,
    output logic [DATA_WIDTH-1:0] dout,
    output logic [DATA_WIDTH*8-1:0] dout_all,

    input  logic hit_write,    
    input  logic [3:0] byte_ben,
    input  logic store ,

    input [DATA_WIDTH*8-1:0] din_all
    );
  logic [DATA_WIDTH*2-1:0] ram_out[3:0];
  logic [DATA_WIDTH*2-1:0] ram_in[3:0];
  logic [31:0] cpu_we_out;
  logic [31:0] final_wea ;
  

  assign dout_all ={ram_out[3],ram_out[2],ram_out[1],ram_out[0]};
  assign {
    ram_in[3],ram_in[2],ram_in[1],ram_in[0]
  } = (store)? {8{din[31:0]}} : din_all[DATA_WIDTH*8-1:0];
  
  logic [ADDR_WIDTH-1:0] cur_addr;
  assign cur_addr = (store| hit_write ) ? waddr : raddr;

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

module load_data_sel(datain, offset, dataout);
input  [255:0] datain;
input  [  2:0] offset; 
output [ 31:0] dataout;

logic [7:0] hot_wire ;
assign hot_wire[0] = offset==3'b000;
assign hot_wire[1] = offset==3'b001;
assign hot_wire[2] = offset==3'b010;
assign hot_wire[3] = offset==3'b011;
assign hot_wire[4] = offset==3'b100;
assign hot_wire[5] = offset==3'b101;
assign hot_wire[6] = offset==3'b110;
assign hot_wire[7] = offset==3'b111;
/*
assign dataout = ({32{offset==3'b000}} & datain[ 31:  0]) |
                 ({32{offset==3'b001}} & datain[ 63: 32]) |
                 ({32{offset==3'b010}} & datain[ 95: 64]) |
                 ({32{offset==3'b011}} & datain[127: 96]) |
                 ({32{offset==3'b100}} & datain[159: 128]) |
                 ({32{offset==3'b101}} & datain[191: 160]) |
                 ({32{offset==3'b110}} & datain[223: 192]) |
                 ({32{offset==3'b111}} & datain[255: 224]) ;
*/
assign dataout = ({32{hot_wire[0]}} & datain[ 31:  0]) |
                 ({32{hot_wire[1]}} & datain[ 63: 32]) |
                 ({32{hot_wire[2]}} & datain[ 95: 64]) |
                 ({32{hot_wire[3]}} & datain[127: 96]) |
                 ({32{hot_wire[4]}} & datain[159: 128]) |
                 ({32{hot_wire[5]}} & datain[191: 160]) |
                 ({32{hot_wire[6]}} & datain[223: 192]) |
                 ({32{hot_wire[7]}} & datain[255: 224]) ;
endmodule

module expand(enable,offset,out,v);
input   enable;
input  [  2:0] offset; 
output [ 31:0] out;
input [3:0]v;

genvar i;
generate
    for(i=0;i<= 3'b111;i=i+1)begin
        assign out[i*4+3:i*4] = ((offset == i) & enable )?  v:4'b0;
    end
endgenerate

endmodule