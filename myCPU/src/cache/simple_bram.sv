module simple_bram
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

    input hit_write,    //回填的写使能
    input [3:0] byte_ben,
    input store ,

    input [DATA_WIDTH*8-1:0] din_all
    );
  wire [DATA_WIDTH*2-1:0] ram_out[3:0];
  wire [DATA_WIDTH*2-1:0] ram_in[3:0];
  wire [31:0] cpu_we_out;
  wire [31:0] final_wea ;//�?终的写使�?
  //assign ram_in = din;

  assign dout_all ={ram_out[3],ram_out[2],ram_out[1],ram_out[0]};
  assign {
    ram_in[3],ram_in[2],ram_in[1],ram_in[0]
  } = (store)? {8{din[31:0]}} : din_all[DATA_WIDTH*8-1:0];
  
  wire [ADDR_WIDTH-1:0] cur_addr;
  assign cur_addr = (store| hit_write ) ? waddr : raddr;

  genvar s0;
  generate 
  for(s0=0;s0<4'd4 ;s0=s0+1) begin : way_banks
    blk_mem_gen_2 my_way (
    .clka(clk),    // input wire clka
    .ena(1'b1),      // input wire ena
    .wea(final_wea[(s0+1)*8-1:s0*8]),      // input wire [ ] wea
    .addra(cur_addr[9:3]),  // input wire [6 : 0] addra
    .dina(ram_in[s0]),    // input wire [255 : 0] dina
    .douta(ram_out[s0])  // output wire [255 : 0] douta
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
input  [  2:0] offset; //word offset
output [ 31:0] dataout;

wire [7:0] hot_wire ;
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
input  [  2:0] offset; //word offset
output [ 31:0] out;
input [3:0]v;

genvar i;
generate
    for(i=0;i<= 3'b111;i=i+1)begin
        assign out[i*4+3:i*4] = ((offset == i) & enable )?  v:4'b0;
    end
endgenerate

endmodule