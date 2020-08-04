`timescale 1ns / 1ps

`define TAG_WIDTH 5'd20
`define OFFSET_WIDTH 3'd3
`define INDEX_WIDTH 5'd7


`define IDLE       5'b00001
`define WRITEBACK  5'b01000
`define WRITEBACK_OVER 5'b01001
`define LOAD       5'b00010
`define LOAD_OVER  5'b00100
`define LOAD_OVER1  5'b00110
`define STORE      5'b10000
module my_dcache
  #(
    parameter OPTION_OPERAND_WIDTH = 32,
    parameter OPTION_DCACHE_BLOCK_WIDTH = 5,
    parameter OPTION_DCACHE_SET_WIDTH = 7,
    parameter OPTION_DCACHE_WAYS = 2,
    parameter OPTION_DCACHE_LIMIT_WIDTH = 32
    )
   (
   input  logic cache_reset,
   input  logic reset,
   input  logic clk,
   
   
   input  logic [31:0]  i_p_addr,
   input  logic [6 :0]  i_p_tag_bit_raddr,
   input  logic [31:0]  i_p_addrAfterTrans,
   input  logic         i_p_nextIsRead, 
   input  logic         i_p_nextIsLS, 
   input  logic         i_p_nextIsSave,
   input  logic [3 :0]  i_p_byte_en,
   input  logic         i_p_read,
                       
   input  logic         i_p_write,  
   input  logic         i_p_hitwriteback,
   input  logic         i_p_hitinvalidate,
   input  logic [31:0]  i_p_wrdata,
   output logic [31:0]  o_p_rddata,
   output logic         o_p_stall,
   output logic         o_p_EstallClear,
   output logic [3 :0]  arid    ,
   output logic [31:0]  araddr  ,
   output logic [7 :0]  arlen   ,
   output logic [2 :0]  arsize  ,
   output logic [1 :0]  arburst ,
   output logic [1 :0]  arlock  ,
   output logic [3 :0]  arcache ,
   output logic [2 :0]  arprot  ,
   output logic         arvalid ,
   input  logic         arready ,
   
   input  logic [3 :0]  rid     ,
   input  logic [31:0]  rdata   ,
   input  logic [1 :0]  rresp   ,
   input  logic         rlast   ,
   input  logic         rvalid  ,
   output logic         rready  ,
   
   output logic [3 :0]  awid    ,
   output logic [31:0]  awaddr  ,
   output logic [7 :0]  awlen   ,
   output logic [2 :0]  awsize  ,
   output logic [1 :0]  awburst ,
   output logic [1 :0]  awlock  ,
   output logic [3 :0]  awcache ,
   output logic [2 :0]  awprot  ,
   output logic         awvalid ,
   input  logic         awready ,

   output logic [3 :0]  wid     ,
   output logic [31:0]  wdata   ,
   output logic [3 :0]  wstrb   ,
   output logic         wlast   ,
   output logic         wvalid  ,
   input                wready  ,

   input  logic [3 :0]  bid     ,
   input  logic [1 :0]  bresp   ,
   input                bvalid  ,
   output logic         bready  ,
   
   input  logic [31:0]                     spr_bus_addr_i,
   input  logic			                   spr_bus_we_i  ,
   input  logic			                   spr_bus_stb_i ,
   input  logic [OPTION_OPERAND_WIDTH-1:0] spr_bus_dat_i ,

   output logic [OPTION_OPERAND_WIDTH-1:0] spr_bus_dat_o
   
   );
   assign arid =4'b1111;
   assign arburst = 2'b10;
   assign rready  =1'b1;
   assign arsize = 3'b010;
   assign awsize = 3'b010;
   assign arlen  =  7'b0111;
   assign awlen  =  7'b0111;
   assign arlock =  2'b00  ;
   assign arcache = 4'b0000;
   assign arprot = 3'b000 ;
   assign awid =4'b0;
   assign awlock =2'b0;
   assign awcache =4'b0;
   assign awprot =3'b0;
   assign awburst =2'b10;
   assign wstrb =4'b1111;
   assign wid =4'b0;
   

   
   localparam WAY_WIDTH = OPTION_DCACHE_BLOCK_WIDTH + OPTION_DCACHE_SET_WIDTH; 
   localparam TAG_WIDTH = (OPTION_DCACHE_LIMIT_WIDTH - WAY_WIDTH);
   localparam TAGMEM_WAY_WIDTH = TAG_WIDTH + 2;
   localparam TAGMEM_WAY_VALID = TAGMEM_WAY_WIDTH - 2;
   localparam TAGMEM_WAY_DIRTY = TAGMEM_WAY_WIDTH - 1;
   localparam TAG_LRU_WIDTH = OPTION_DCACHE_WAYS*(OPTION_DCACHE_WAYS-1) >> 1;
   localparam TAG_LRU_WIDTH_BITS = (OPTION_DCACHE_WAYS >= 2) ? TAG_LRU_WIDTH : 1;
   localparam TAGMEM_WIDTH = TAGMEM_WAY_WIDTH * OPTION_DCACHE_WAYS + TAG_LRU_WIDTH;
   localparam TAG_LRU_MSB = TAGMEM_WIDTH - 1;
   localparam TAG_LRU_LSB = TAG_LRU_MSB - TAG_LRU_WIDTH + 1;


   logic                                         busyS ;
   logic [4:0] 			                         state;
   logic                                         idle;
   logic [WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH] invalidate_adr;
   logic				                               invalidate;
   logic [OPTION_DCACHE_SET_WIDTH-1:0]           tag_windex;
   logic [TAGMEM_WIDTH-1:0] 	                   tag_dout;
   logic [TAG_LRU_WIDTH_BITS-1:0]                tag_lru_out;
   logic [TAGMEM_WAY_WIDTH-1:0] 	                tag_way_out [OPTION_DCACHE_WAYS-1:0]; 
   logic [TAGMEM_WIDTH-1:0] 	                   tag_din;
   logic [TAG_LRU_WIDTH_BITS-1:0]                tag_lru_in;
   logic [TAGMEM_WAY_WIDTH-1:0] 	                tag_way_in [OPTION_DCACHE_WAYS-1:0];
   logic [TAG_WIDTH-1:0] 	                      tag_wtag;
   logic [TAG_WIDTH-1:0] 	                      tag_tag;   
   logic [WAY_WIDTH-3:0] 	                      way_raddr[OPTION_DCACHE_WAYS-1:0];
   logic [WAY_WIDTH-3:0] 	                      way_waddr[OPTION_DCACHE_WAYS-1:0];
   logic [31:0]                                  way_din[OPTION_DCACHE_WAYS-1:0];
   logic [31:0]                                  way_dout[OPTION_DCACHE_WAYS-1:0];
   logic [OPTION_OPERAND_WIDTH*8-1:0]            way_dout_all[OPTION_DCACHE_WAYS-1:0]; 
   logic [OPTION_DCACHE_WAYS-1:0]                way_we;
   logic 			                               hit;
   logic [OPTION_DCACHE_WAYS-1:0]                way_hit; 
   logic [OPTION_DCACHE_WAYS-1:0]                lru;
   logic [1:0]                                   reg_way_we;
   logic [31:0]                                  reg_wdata;
   logic [31:0]                                  reg_waddr;
   logic [3:0]                                   reg_byte_en;
  
   assign o_p_stall  = ((i_p_read|i_p_write) & !hit ) | (state!=`IDLE) | (i_p_nextIsRead & |reg_byte_en) ;

   logic  m_canwrite_buffer;
   assign m_canwrite_buffer = i_p_addrAfterTrans[31:5] == missFillBuffer_addr[31:5] & state ==`LOAD; 
   always_ff @(posedge clk) begin
         if(reset)begin
            reg_byte_en <=4'b0;
            reg_waddr<=32'b0;
            reg_way_we<=2'b0;
            reg_wdata<=32'b0;
         end
         else begin
         if( i_p_write  & way_hit!=2'b0 ) begin
            reg_way_we <= way_hit ;
            reg_wdata  <= i_p_wrdata ;
            reg_waddr  <=  i_p_addrAfterTrans ;
            reg_byte_en <= i_p_byte_en ;
         end
         else begin
            reg_byte_en <=  4'b0;
            reg_way_we <= 2'b0;
         
         end
      end
   end

   
   logic [TAG_WIDTH-1:0]     check_way_tag   [OPTION_DCACHE_WAYS-1:0];
   logic                     check_way_match [OPTION_DCACHE_WAYS-1:0];
   logic                     check_way_valid [OPTION_DCACHE_WAYS-1:0];
   logic                     check_way_dirty [OPTION_DCACHE_WAYS-1:0];
   logic [`TAG_WIDTH-1:0]    cache_addr_cpu_tag;
	logic [`INDEX_WIDTH-1:0]  cache_addr_idx;
	logic [`OFFSET_WIDTH-1:0] cache_addr_cpu_off;
	logic [1:0]               cache_addr_dropoff;
	
	assign {
		cache_addr_cpu_tag,  cache_addr_idx,
		cache_addr_cpu_off,  cache_addr_dropoff
	} = i_p_addr;
    
   assign tag_tag = i_p_addrAfterTrans[31:12] ;
    
   logic [`TAG_WIDTH-1:0]    cache_addr_cpu_tag_pre;
   logic [`INDEX_WIDTH-1:0]  cache_addr_idx_pre;
   logic [`OFFSET_WIDTH-1:0] cache_addr_cpu_off_pre;
   logic [1:0]               cache_addr_dropoff_pre;
   assign {
        cache_addr_cpu_tag_pre,  cache_addr_idx_pre,
        cache_addr_cpu_off_pre,  cache_addr_dropoff_pre
   } = i_p_addrAfterTrans;

   logic do_store;
   assign do_store = |reg_way_we & |reg_byte_en ;
   logic [31:0] missFillBuffer_addr;
   logic reg_rewrite;


   assign tag_wtag = missFillBuffer_addr[31:12];
   assign tag_din[TAG_LRU_MSB:TAG_LRU_LSB] = tag_lru_in;
   assign tag_lru_out = tag_dout[TAG_LRU_MSB:TAG_LRU_LSB];

   
  
   

   logic reg_canwrite;
   assign reg_canwrite  = |reg_way_we ;

   logic  [OPTION_DCACHE_WAYS-1:0]  load_bus_we;
   assign load_bus_we = (!tag_lru_out) ? 2'b01:2'b10  ;
   
   assign way_we = (state==`LOAD_OVER1 )? load_bus_we :
                   (|reg_byte_en )    ? reg_way_we  : 
                    2'b0   ;
                     
   genvar i;
   generate
      for (i = 0; i < OPTION_DCACHE_WAYS; i=i+1) begin : ways
         assign way_raddr[i] = ( state ==`LOAD_OVER ) ? missFillBuffer_addr[11:2]  : i_p_addr[WAY_WIDTH-1:2];

         assign way_waddr[i] = ( state==`LOAD_OVER | state ==`LOAD_OVER1 ) ? missFillBuffer_addr[WAY_WIDTH-1:2]:
                               ( reg_canwrite          ) ? reg_waddr[WAY_WIDTH-1:2] :  0;                      
         assign way_din[i] = reg_wdata;
         assign check_way_tag[i] = tag_way_out[i][TAG_WIDTH-1:0];
         assign check_way_match[i] = (check_way_tag[i] == tag_tag);
         assign check_way_valid[i] = tag_way_out[i][TAGMEM_WAY_VALID];
         assign check_way_dirty[i] = tag_way_out[i][TAGMEM_WAY_DIRTY];
         assign way_hit[i] =  busyS? 1'b0 :   (check_way_valid[i] & check_way_match[i]); 
  
         assign tag_din[(i+1)*TAGMEM_WAY_WIDTH-1:i*TAGMEM_WAY_WIDTH] = tag_way_in[i];
         assign tag_way_out[i] = tag_dout[(i+1)*TAGMEM_WAY_WIDTH-1:i*TAGMEM_WAY_WIDTH];
         assign tag_way_in[i] =  (reg_canwrite & reg_way_we[i] ) ?  {1'b1 , 1'b1 , reg_waddr[31:12]} :
                                 (state == `LOAD_OVER1 & tag_lru_out == i ) ? {reg_rewrite , 1'b1 , missFillBuffer_addr[31:12] }:
                                  22'b0;
      end
   endgenerate
   
   logic [OPTION_OPERAND_WIDTH*8-1:0] missFillBuffer;
   logic [31:0]                       load_from_ram_bus[7:0] ;
    
   genvar s0;
   generate
        for( s0 =0 ; s0<= 3'b111 ; s0=s0+1)begin
            assign load_from_ram_bus[s0] = missFillBuffer[(s0+1)*32-1:s0*32];
        end
   endgenerate
   
   logic [2:0] counter;
   logic [7:0] cs_a;
   logic [7:0] word_valid;
   logic [7:0] cs_target;
   logic [7:0] cs_target1;

   logic missFillBuffer_wen;
   assign missFillBuffer_wen = rvalid & rready;
   assign wdata = load_from_ram_bus[counter]; 
   
   logic [31:0] reg_Missaddr   ;
 
   

   logic [31:0] wire_o_p_rddata ;
   logic reg_o_p;
   logic [31:0] reg_o_p_rddata;


   onehot_3s8 missFillOneHot(counter,cs_a);
   onehot_3s8 firstMiss(i_p_addrAfterTrans[4:2],cs_target);

   logic [31:0] protect_bit ;
   logic [31:0] write_cs_m ;
   logic  [255:0] refill_bytes ;
   logic [31:0] refill_cs_a    ;
   logic [31:0] assemble_data;
   genvar vs ;
   genvar vx ;
   generate 
      for(vs=0; vs<=3'b111 ;vs=vs+1) begin
         assign refill_cs_a[vs*4+3: vs*4] = (cs_a[vs] & rvalid & rready )? 4'b1111: 4'b0;
      end
      for(vs=0 ; vs<4'd8 ; vs= vs+1) begin
         for( vx=0 ; vx<4'd4 ; vx = vx+1) begin
            assign refill_bytes[ (vs*4+vx)*8+7 : (vs*4+vx)*8 ] = write_cs_m[vs*4+vx   ] ? i_p_wrdata[vx*8+7 : vx*8 ] : 
                                                rdata[vx*8+7      : vx*8 ] ;
         end
      end
      for(vs=0; vs<=3'd7 ;vs=vs+1) begin
         assign word_valid[vs]= &protect_bit[vs*4+3:vs*4];
         assign write_cs_m[vs*4+3: vs*4]  =(i_p_addrAfterTrans[31:5] == missFillBuffer_addr[31:5] & state ==`LOAD & i_p_write & i_p_addrAfterTrans[4:2]==vs )? i_p_byte_en : 4'b0 ;
      end 
      for(vs=0 ; vs<4'd4 ;vs=vs+1) begin 
         assign assemble_data[vs*8+7:vs*8] = reg_byte_en[vs]? reg_wdata[vs*8+7:vs*8] :
                                             way_hit[0]     ? way_dout[0][vs*8+7:vs*8]:
                                                              way_dout[1][vs*8+7:vs*8];  
      end
   endgenerate 
   genvar vb ;

   logic [31:0] mFB_wen ;
   assign mFB_wen = write_cs_m  ;

   integer a0;
   always_ff @(posedge clk )begin
      if(reset) begin
         missFillBuffer<=256'b0;
         reg_rewrite<=1'b0;
      end
      else begin
      if( state==`LOAD_OVER1 & check_way_dirty[tag_lru_out]  ) begin
         missFillBuffer <= way_dout_all[tag_lru_out ]; 
      end
      else if( state==`LOAD_OVER1 | state==`IDLE ) begin
         missFillBuffer<=256'b0;
         reg_rewrite<=1'b0;
      end
      else begin
         if(mFB_wen)begin
            reg_rewrite<=1'b1;
         end
         for(a0 = 0 ; a0 < 32 ; a0 = a0 + 1) begin
            if(mFB_wen[a0]  | (protect_bit[a0]==1'b0  & refill_cs_a[a0]==1'b1 )) begin
               missFillBuffer[ (a0*8+7)-:8] <= refill_bytes[(a0*8+7)-:8];
            end
         end
      end
      end
   end

   logic cs_ok;
   assign cs_ok = (|(word_valid & cs_target)) ;

   logic   m_buffer_hit;
   assign m_buffer_hit =  i_p_addrAfterTrans[31:5] == missFillBuffer_addr[31:5] ;
   assign hit = (|way_hit) | ( i_p_write  & m_buffer_hit & state==`LOAD  ) | (i_p_read & m_buffer_hit & cs_ok & state ==`LOAD ) | reg_o_p ;
   

   assign tag_lru_in =( state ==`LOAD_OVER1 )   ? !tag_lru_out  :
                      ( i_p_read &  (|way_hit) ) ? way_hit[0] : 
                      ( reg_canwrite ) ? reg_way_we[0] : tag_lru_out ;
   
  
   
   assign wire_o_p_rddata =  (m_buffer_hit  & cs_ok & state ==`LOAD ) ? load_from_ram_bus[i_p_addrAfterTrans[4:2]] :
                             (i_p_addrAfterTrans[31:2]== reg_waddr[31:2] & reg_byte_en!=4'b0 ) ?   assemble_data: 
                             (way_hit[0] )   ? way_dout[0]:  way_dout[1];

   assign o_p_rddata = reg_o_p ? reg_o_p_rddata: wire_o_p_rddata ;        
   


   assign idle = (state == `IDLE);
   
   assign o_p_EstallClear =   (i_p_write & hit )  &o_p_stall ;

   always_ff @(posedge clk) begin
      if (reset | !cache_reset ) begin
         wlast <=1'b0;
	     state <= `IDLE;
         arvalid <=0;
         wvalid<=0;
         awvalid <=1'b0;
         bready <=1'b1;
         protect_bit<=32'b0;
         busyS<=1'b0;
         reg_o_p <= 1'b0;
         reg_o_p_rddata<=32'b0;
      end 
      else begin   
      if(!o_p_stall )begin
         reg_o_p <= 1'b0;
         reg_o_p_rddata<=32'b0;
      end
      else if(i_p_read & o_p_stall & hit & !reg_o_p )begin
         reg_o_p<=1'b1;
         reg_o_p_rddata <= wire_o_p_rddata;
      end
      if(!busyS & !hit & (i_p_read| i_p_write) ) begin
            busyS <= 1'b1;
      end 
      else if( busyS & ( (i_p_write & m_canwrite_buffer) | ( i_p_read  & m_buffer_hit & cs_ok )) ) begin
         busyS<=1'b0;
      end
      case (state)
         `IDLE: 
         begin
            protect_bit<=32'b0;
            if( (!hit) & ( i_p_read | i_p_write ) ) begin 
               araddr <= { i_p_addrAfterTrans[31:2] ,  2'b0}; 
               missFillBuffer_addr<=  { i_p_addrAfterTrans[31:2] ,  2'b0} ;        
               counter<=i_p_addrAfterTrans[4:2];
               arvalid<=1'b1;
               state  <=`LOAD;
            end
         end
         `WRITEBACK: begin
            if(awvalid & awready) begin
               awvalid <=1'b0;
               wvalid<=1'b1;
            end
            if(wvalid & wready )begin 
               counter <= counter + 1;
               if(counter ==3'b110 ) begin
                  wlast <=1'b1 ;
               end
            end
            if(bvalid & bready )begin
               state<=`WRITEBACK_OVER;
            end
         end
         `WRITEBACK_OVER: begin
            state<=`IDLE;  
         end
         `LOAD : begin
            if(mFB_wen!=32'b0 | refill_cs_a !=32'b0) 
                protect_bit <= protect_bit | mFB_wen | refill_cs_a ;
            if(arvalid & arready ) begin
               arvalid <=1'b0;
            end
            if(rvalid & rready) begin
               counter <= counter+1;
            end
            if(rvalid & rready & rlast)begin
               if(  i_p_write & hit )begin
                  state<=`STORE;
               end
               else begin
                  state<=`LOAD_OVER;
               end
            end
         end
         `LOAD_OVER: begin
            state <= `LOAD_OVER1;
          end
         `LOAD_OVER1: begin 
            protect_bit<=32'b0;
            if(  check_way_dirty[tag_lru_out] ) begin
               awaddr<= {tag_way_out[tag_lru_out][19:0],missFillBuffer_addr[11:5],5'b0}  ;
               state<=`WRITEBACK;
               awvalid <=1'b1;
             
               counter <= 3'b0;
               wlast<=1'b0;
            end
            else begin 
               state<=`IDLE ;
            end
         end
         `STORE  : begin  
             state<=`LOAD_OVER;    
         end
         default: begin
            state <= `IDLE;
         end
         endcase
      end
   end

   assign tag_windex  = ( |reg_byte_en )? reg_waddr[11:5]: 
                        (state == `LOAD_OVER | state ==`LOAD_OVER1 )?    missFillBuffer_addr[11:5] :  0 ;
   
   generate
      for (i = 0; i < OPTION_DCACHE_WAYS; i=i+1) begin : way_memories
	       simple_bram
	       #(
		    .ADDR_WIDTH(WAY_WIDTH-2),
		    .DATA_WIDTH(OPTION_OPERAND_WIDTH),
		    .ENABLE_BYPASS(1)
		     )
	       d_way_data_ram
	       (
         
         .dout_all(way_dout_all[i]),
         .dout			(way_dout[i]),
         
         .clk			(clk),
         .raddr		(way_raddr[i][WAY_WIDTH-3:0]),
         .re			(1'b1),
         .waddr		(way_waddr[i][WAY_WIDTH-3:0]),
         .we			(way_we[i]),
         .din			(way_din[i][31:0]),
         .byte_ben   (reg_byte_en),
         .hit_write  ( state ==`LOAD_OVER1  ),
         .store      ( do_store ),
         .din_all    ( missFillBuffer ));
      end
   endgenerate

   my_tag_ram
   #(
      .ADDR_WIDTH(7),
      .DATA_WIDTH(TAGMEM_WIDTH),
      .ENABLE_BYPASS(0)
   )
   d_tag_ram
   (
   
   
   .dout				(tag_dout[TAGMEM_WIDTH-1:0]),
   
   .clk				(clk),
   .raddr		   (cache_addr_idx),
   .re				(1'b1),
   .waddr		   (tag_windex),
   .we				(way_we),
   .din				(tag_din),
   .rst           (reset),
   .refill        (state==`LOAD_OVER1),
   .cache_reset    (cache_reset) ,
   .load_over      (state==`LOAD_OVER)
   );


endmodule

module onehot_3s8(in,out);
input [2:0] in ;
output logic [7:0] out ;
always_ff @(*) begin
    case(in)
                3'b000:out=8'b00000001;
                3'b001:out=8'b00000010;
                3'b010:out=8'b00000100;
                3'b011:out=8'b00001000;
                3'b100:out=8'b00010000;
                3'b101:out=8'b00100000;
                3'b110:out=8'b01000000;
                3'b111:out=8'b10000000;
    endcase
end

endmodule