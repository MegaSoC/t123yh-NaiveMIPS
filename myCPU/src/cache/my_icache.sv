`timescale 1ns / 1ps
`include "def.svh"

`define TAG_WIDTH 5'D20
`define OFFSET_WIDTH 3'D3
`define INDEX_WIDTH 5'D7

`define IDLE 5'b00001
`define LOAD 5'b00010
`define LOAD_OVER 5'b00100
`define INVALIDATE 5'b10000


module my_icache
  #(
    parameter OPTION_OPERAND_WIDTH = 32,
    parameter OPTION_DCACHE_BLOCK_WIDTH = 5,
    parameter OPTION_DCACHE_SET_WIDTH = 7,
    parameter OPTION_DCACHE_WAYS = 2,
    parameter OPTION_DCACHE_LIMIT_WIDTH = 32
    )
   (
   input logic cache_reset,
    input logic reset ,
    input logic clk,
   
    
    
    input  logic [31:0] i_p_addr,
    input  logic [6:0]  i_p_tag_bit_raddr, 
    input  logic [31:0] i_p_addrAfterTrans, 
	input  logic [3:0]  i_p_byte_en,
    input  logic        dm_stall,
	input  logic        i_p_read,
	input  logic        i_p_write,  
	
    input  logic        i_p_hitwriteback,
	input  logic        i_p_hitinvalidate,
	input  logic [31:0] i_p_wrdata,
	output logic [31:0] o_p_rddata,
	output logic        o_p_stall,
    output logic [3 :0] arid    ,
    output logic [31:0] araddr  ,
    output logic [7 :0] arlen   ,
    output logic [2 :0] arsize  ,
    output logic [1 :0] arburst ,
    output logic [1 :0] arlock  ,
    output logic [3 :0] arcache ,
    output logic [2 :0] arprot  ,
    output logic        arvalid ,
    input  logic        arready ,

    input  logic [3 :0] rid     ,
    input  logic [31:0] rdata   ,
    input  logic [1 :0] rresp   ,
    input  logic        rlast   ,
    input  logic        rvalid  ,
    output logic        rready  ,
    
    output logic [3 :0] awid    ,
    output logic [31:0] awaddr  ,
    output logic [7 :0] awlen   ,
    output logic [2 :0] awsize  ,
    output logic [1 :0] awburst ,
    output logic [1 :0] awlock  ,
    output logic [3 :0] awcache ,
    output logic [2 :0] awprot  ,
    output logic        awvalid ,
    input  logic        awready ,
    
    output logic [3 :0] wid     ,
    output logic [31:0] wdata   ,
    output logic [3 :0] wstrb   ,
    output logic        wlast   ,
    output logic        wvalid  ,
    input               wready  ,
    
    input  logic [3 :0] bid     ,
    input  logic [1 :0] bresp   ,
    input               bvalid  ,
    output logic        bready  ,
    
    
    
    input  logic [31:0]   spr_bus_addr_i ,
    input 			      spr_bus_we_i   ,
    input 			      spr_bus_stb_i  ,
    input  [OPTION_OPERAND_WIDTH-1:0]  spr_bus_dat_i,

    output [OPTION_OPERAND_WIDTH-1:0] spr_bus_dat_o
    
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
    assign  arprot = 3'b000 ;
    assign awid =4'b0;
    assign awlock =2'b0;
    assign awcache =4'b0;
    assign awprot =3'b0;
    assign awburst =2'b10;
    assign wvlalid =1'b0;
    assign wstrb =4'b0;
    assign wid =4'b0;
    assign awaddr =32'b0;
    assign wdata =32'b0;

    logic  [2:0] counter;
    assign o_p_stall = ( i_p_read  &  ~hit ) | (state==`LOAD_OVER ) | ( rvalid & rready & rlast ) | queue  ;

   
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

   
   logic [4:0] 			      state;
   logic				      idle;
   logic				      read;
   logic				      write;
   logic				      refill;

   logic [WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH] invalidate_adr;
   logic [31:0] 			      next_refill_adr;
   logic 			      refill_done;
   logic 			      refill_hit;
   logic [(1<<(OPTION_DCACHE_BLOCK_WIDTH-2))-1:0] refill_valid;
   logic [(1<<(OPTION_DCACHE_BLOCK_WIDTH-2))-1:0] refill_valid_r;
   logic				      invalidate;

   
   logic [OPTION_DCACHE_SET_WIDTH-1:0]  tag_windex;
   
   
   logic [TAGMEM_WIDTH-1:0] 	          tag_dout;
   logic [TAG_LRU_WIDTH_BITS-1:0]      tag_lru_out;
   logic [TAGMEM_WAY_WIDTH-1:0] 	      tag_way_out [OPTION_DCACHE_WAYS-1:0];

   
   logic [TAGMEM_WIDTH-1:0] 	      tag_din;
   logic [TAG_LRU_WIDTH_BITS-1:0]       tag_lru_in;
   logic [TAGMEM_WAY_WIDTH-1:0] 	      tag_way_in [OPTION_DCACHE_WAYS-1:0];

   logic [TAGMEM_WAY_WIDTH-1:0] 	      tag_way_save[OPTION_DCACHE_WAYS-1:0];

   
   logic 				      tag_we;

   assign tag_we = ( |way_hit ) ;
   
   logic [TAG_WIDTH-1:0] 	      tag_wtag;

   
   logic [TAG_WIDTH-1:0] 	      tag_tag;

   
   logic [WAY_WIDTH-3:0] 	      way_raddr[OPTION_DCACHE_WAYS-1:0];
   logic [WAY_WIDTH-3:0] 	      way_waddr[OPTION_DCACHE_WAYS-1:0];
   logic [OPTION_OPERAND_WIDTH-1:0]    way_din[OPTION_DCACHE_WAYS-1:0];
   logic [OPTION_OPERAND_WIDTH-1:0]    way_dout[OPTION_DCACHE_WAYS-1:0];
   
   logic [OPTION_OPERAND_WIDTH*8-1:0]    way_dout_all[OPTION_DCACHE_WAYS-1:0];
   
   logic [OPTION_DCACHE_WAYS-1:0]       way_we;

   
   logic 			      hit;
   logic [OPTION_DCACHE_WAYS-1:0]      way_hit;
   logic [OPTION_DCACHE_WAYS-1:0]  load_bus_we;
   assign load_bus_we = tag_lru_out ? 2'b10: 2'b01 ;
   
   
   
   
   logic [OPTION_DCACHE_WAYS-1:0]      lru;

   
    logic queue;
    assign way_we =( state==`LOAD_OVER )? load_bus_we : 2'b00;

   
   logic [TAG_WIDTH-1:0]               check_way_tag [OPTION_DCACHE_WAYS-1:0];
   logic                               check_way_match [OPTION_DCACHE_WAYS-1:0];
   logic                               check_way_valid [OPTION_DCACHE_WAYS-1:0];
   logic                               check_way_dirty [OPTION_DCACHE_WAYS-1:0];
   
    logic [`TAG_WIDTH-1:0]     cache_addr_cpu_tag;
	logic  [`TAG_WIDTH-1:0]    cache_addr_mem_tag; 
	
	logic [`INDEX_WIDTH-1:0]  cache_addr_idx;
	logic [`OFFSET_WIDTH-1:0] cache_addr_cpu_off;
	logic  [`OFFSET_WIDTH-1:0] cache_addr_access_off;
	logic  [`OFFSET_WIDTH-1:0] cache_addr_mem_off;
	logic [1:0]               cache_addr_dropoff;
	
	assign {
		cache_addr_cpu_tag,  cache_addr_idx,
		cache_addr_cpu_off,  cache_addr_dropoff
	} = i_p_addr;
    assign tag_tag = i_p_addrAfterTrans[31:12];
    logic  [31:0] dbus_addr_pre;
    logic [`TAG_WIDTH-1:0]    cache_addr_cpu_tag_pre;
    logic [`INDEX_WIDTH-1:0]  cache_addr_idx_pre;
    logic [`OFFSET_WIDTH-1:0] cache_addr_cpu_off_pre;
    logic [1:0]               cache_addr_dropoff_pre;
    assign {
        cache_addr_cpu_tag_pre,  cache_addr_idx_pre,
        cache_addr_cpu_off_pre,  cache_addr_dropoff_pre
    } = i_p_addrAfterTrans;
    
    assign tag_wtag = araddr[31:12];
    assign tag_din[TAG_LRU_MSB:TAG_LRU_LSB] = tag_lru_in;
    assign tag_lru_out = tag_dout[TAG_LRU_MSB:TAG_LRU_LSB];
    genvar 			      i;
    
    generate
        for (i = 0; i < OPTION_DCACHE_WAYS; i=i+1) begin : ways
            assign way_raddr[i] = i_p_addr[WAY_WIDTH-1:2];
            assign way_waddr[i] = {araddr[11:2]};
            assign way_din[i] = 32'b0;

        
            assign check_way_tag[i] = tag_way_out[i][TAG_WIDTH-1:0];
            assign check_way_match[i] = (check_way_tag[i] == tag_tag);
            assign check_way_valid[i] = tag_way_out[i][TAGMEM_WAY_VALID];
            assign check_way_dirty[i] = tag_way_out[i][TAGMEM_WAY_DIRTY];
            assign way_hit[i] = check_way_valid[i] & check_way_match[i] & !queue ;

            
            assign tag_din[(i+1)*TAGMEM_WAY_WIDTH-1:i*TAGMEM_WAY_WIDTH] = tag_way_in[i];
            assign tag_way_out[i] = tag_dout[(i+1)*TAGMEM_WAY_WIDTH-1:i*TAGMEM_WAY_WIDTH];
            

            assign tag_way_in[i] = (tag_lru_out==i & state == `LOAD_OVER ) ? {2'b01,tag_wtag}  : 22'b0 ;
        end
    endgenerate

  
    logic [7:0] cs_a;
    logic  [7:0] word_valid;
    logic [7:0] cs_target;
    logic missFillBuffer_wen;
    assign missFillBuffer_wen = rvalid & rready;
    logic cs_ok;
    assign cs_ok = (|(word_valid & cs_target)) ;
    
    logic [OPTION_OPERAND_WIDTH*8-1:0] missFillBuffer;
    logic [OPTION_OPERAND_WIDTH-1:0] load_from_ram_bus[7:0] ;

    onehot_3s8 missFillOneHot(counter,cs_a);
    onehot_3s8 firstMiss(i_p_addrAfterTrans[4:2],cs_target);
    always_ff @(posedge clk )begin 
        if(reset  )begin
            word_valid<=8'b0;   
            missFillBuffer<=256'b0; 
        end else begin
            if(missFillBuffer_wen)begin
                word_valid <=word_valid | cs_a;
                case(counter)
                    3'b000: missFillBuffer[31:0]<=  rdata;
                    3'b001: missFillBuffer[63:32]<=  rdata;
                    3'b010: missFillBuffer[95:64]<=  rdata;
                    3'b011: missFillBuffer[127:96]<=  rdata;
                    3'b100: missFillBuffer[159:128]<=  rdata;
                    3'b101: missFillBuffer[191:160]<=  rdata;
                    3'b110: missFillBuffer[223:192]<=  rdata;
                    3'b111: missFillBuffer[255:224]<=  rdata;
                endcase
            end
            else if(state==`LOAD_OVER) begin
                word_valid <= 8'b0 ;
            end
        end
    end

    genvar s0;
    generate
            for( s0 =0 ; s0< 4'd8 ; s0=s0+1)begin
                assign load_from_ram_bus[s0] = missFillBuffer[(s0+1)*OPTION_OPERAND_WIDTH-1:s0*OPTION_OPERAND_WIDTH];
            end
    endgenerate


   assign hit = ((|way_hit )) | (i_p_addrAfterTrans[31:5] == araddr[31:5]  & cs_ok) | store ;


   assign tag_lru_in = (state ==`LOAD_OVER) ? !tag_lru_out :   
                       (|way_hit)? way_hit[0] : 1'b0;
   logic [31:0] wire_o_p_rddata;
   assign wire_o_p_rddata = (i_p_addrAfterTrans[31:5]== araddr[31:5] &cs_ok )? load_from_ram_bus[i_p_addrAfterTrans[4:2]]:
                                   way_hit[0]? way_dout[0]: way_dout[1];


   logic store ;
   logic [31:0] reg_o_p_rdata;
   always_ff @(posedge clk) begin
        if(reset /* | exp_flush */) begin
            store <=1'b0;
        end
        else if(/* (way_hit!=2'b0 )*/ hit & (dm_stall|o_p_stall)  & !store ) begin
            store<=1'b1;
            reg_o_p_rdata <=wire_o_p_rddata;
        end
        else if(!dm_stall & !o_p_stall ) begin
            store<=1'b0;
        end
    end
    assign o_p_rddata = store? reg_o_p_rdata : wire_o_p_rddata;



    
   assign idle = (state == `IDLE ) ;




    logic invalidate_ack;
   
 
   
    assign tag_windex  =    (state ==`LOAD_OVER     ) ? araddr[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH] :
                            ((|way_hit) & i_p_read  ) ? i_p_addrAfterTrans[11:5] :  0 ;

   integer w1;
   always_ff @(posedge clk) begin
        if (reset | !cache_reset ) begin
            araddr<=32'b0;
            wlast <=1'b0;
            state <= `IDLE;
            arvalid <=0;
            wvalid<=0;
            awvalid <=1'b0;
            bready <=1'b0;
            queue<=1'b0;
        end 
        else begin    
        case (state)
            `IDLE: begin
            if (invalidate) begin
                invalidate_adr <= spr_bus_dat_i[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH];
                state <= `INVALIDATE;
            end 
            else begin
                if( !hit & i_p_read ) begin
                    araddr<={i_p_addrAfterTrans[31:2] , 2'b0 };
                    arvalid <=1'b1; 
                    state <= `LOAD ;
                    counter<= i_p_addrAfterTrans[4:2];
                    queue <=1'b1;
                end
                end
            end
            `LOAD : begin
                if(arvalid & arready ) begin
                    arvalid <=1'b0;
                end
                if( !hit  & !queue & i_p_addrAfterTrans[31:5]!=araddr[31:5] ) begin
                    queue<=1'b1 ;
                end 
                else if(i_p_addrAfterTrans[31:5]== araddr[31:5] & cs_ok & queue) begin
                    queue<=1'b0;
                end
                if(rvalid & rready) begin
                    counter <= counter+1;
                    if(rlast)begin 
                        state<=`LOAD_OVER;
                    end
                end
            end
            `LOAD_OVER: begin 
                if(queue & !hit ) begin
                    araddr<={i_p_addrAfterTrans[31:2] , 2'b0 };
                    counter<=i_p_addrAfterTrans[4:2];
                    arvalid<=1'b1;
                    state<=`LOAD;
                end
                else  begin 
                    queue<=1'b0 ;
                    state<=`IDLE; 
                end
            end
            `INVALIDATE: begin
                if (invalidate) begin
                
                
                invalidate_adr <= spr_bus_dat_i[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH];

                state <= `INVALIDATE;
                end else begin
                    state <= `IDLE;
                end
            end

            default: begin
                state <= `IDLE;
            end
        endcase
        end
   end


   generate
      for (i = 0; i < OPTION_DCACHE_WAYS; i=i+1) begin : way_memories
	       new_simple_bram
	       #(
		   .ADDR_WIDTH(WAY_WIDTH-2),
		   .DATA_WIDTH(OPTION_OPERAND_WIDTH),
		   .ENABLE_BYPASS(1)
		   )
	       icache_way_data_ram
	       (
            
            .dout_all(way_dout_all[i]),
            .dout			(way_dout[i]),
            
            .clk			(clk),
            .raddr			(way_raddr[i][WAY_WIDTH-3:0]),
            .re			    (hit),
            .waddr			(way_waddr[i][WAY_WIDTH-3:0]),
            .we			    (way_we[i]),
            .din			(way_din[i][31:0]),
            .byte_ben       (i_p_byte_en),
            .hit_write      ( state ==`LOAD_OVER ),
            .store          (1'b0),
            .din_all        (missFillBuffer)
           );
      end

   endgenerate

      new2_my_tag_ram
      #(
       .ADDR_WIDTH(7),
       .DATA_WIDTH(TAGMEM_WIDTH),
       .ENABLE_BYPASS(0)
      )
      i_tag_ram
      (
      
      .dout				(tag_dout[TAGMEM_WIDTH-1:0]),
      .clk				(clk),
      .raddr			(cache_addr_idx),
      .re				(1'b1),
      .waddr			(tag_windex),
      .we				(tag_we),
      .din				(tag_din),
      .rst              (reset),
      .refill           (state==`LOAD_OVER),
      .select           (rlast & rvalid & rready ),
      .tag_bit_raddr    (i_p_tag_bit_raddr),
       .cache_reset    (cache_reset)
      );


endmodule
