`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/07 07:51:00
// Design Name: 
// Module Name: my_dcache
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
   input wire cache_reset,
    input wire reset ,
    input wire clk,
   // input wire exp_flush,
    //todo:first
    //exchange with cpu
    input  wire [31:0] i_p_addr,
    input  wire [6:0]  i_p_tag_bit_raddr, 
    input  wire [31:0] i_p_addrAfterTrans, 
	input  wire [3:0]  i_p_byte_en,
    input wire dm_stall,
	input  wire        i_p_read,
	input  wire        i_p_write,  
	
    input  wire        i_p_hitwriteback,
	input  wire        i_p_hitinvalidate,
	input  wire [31:0] i_p_wrdata,
	output wire [31:0] o_p_rddata,
	output wire        o_p_stall,
    output      [3 :0] arid    ,
    output reg  [31:0] araddr  ,
    output [7 :0] arlen        ,
    output [2 :0] arsize       ,
    output [1 :0] arburst      ,
    output [1 :0] arlock       ,
    output [3 :0] arcache      ,
    output [2 :0] arprot       ,
    output reg    arvalid      ,
    input  wire   arready      ,
    //r           
    input  [3 :0] rid          ,
    input  [31:0] rdata        ,
    input  [1 :0] rresp        ,
    input         rlast        ,
    input         rvalid       ,
    output        rready       ,
    //aw          
    output [3 :0] awid         ,
    output  [31:0] awaddr   ,
    output [7 :0] awlen        ,
    output [2 :0] awsize       ,
    output [1 :0] awburst      ,
    output [1 :0] awlock       ,
    output [3 :0] awcache      ,
    output [2 :0] awprot       ,
    output reg    awvalid      ,
    input         awready      ,
    //w          
    output [3 :0] wid          ,
    output [31:0] wdata        ,
    output [3 :0] wstrb        ,
    output reg    wlast        ,
    output reg    wvalid       ,
    input         wready       ,
    //b           
    input  [3 :0] bid          ,
    input  [1 :0] bresp        ,
    input         bvalid       ,
    output reg    bready       ,
    
    
    // SPR interface
    input wire [31:0]     spr_bus_addr_i ,
    input 			      spr_bus_we_i   ,
    input 			      spr_bus_stb_i  ,
    input [OPTION_OPERAND_WIDTH-1:0]  spr_bus_dat_i,

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

    reg  [2:0] counter;
    assign o_p_stall = ( i_p_read  &  ~hit ) | (state==`LOAD_OVER ) | ( rvalid & rready & rlast ) | queue  ;

   // States


   // Address space in bytes for a way
   localparam WAY_WIDTH = OPTION_DCACHE_BLOCK_WIDTH + OPTION_DCACHE_SET_WIDTH;
   /*
    * Tag memory layout
    *            +---------------------------------------------------------+
    * (index) -> | LRU | wayN valid | wayN tag |...| way0 valid | way0 tag |
    *            +---------------------------------------------------------+
    */

   // The tag is the part left of the index
   localparam TAG_WIDTH = (OPTION_DCACHE_LIMIT_WIDTH - WAY_WIDTH);

   // The tag memory contains entries with OPTION_DCACHE_WAYS parts of
   // each TAGMEM_WAY_WIDTH. Each of those is tag and a valid flag.
   localparam TAGMEM_WAY_WIDTH = TAG_WIDTH + 2;
   localparam TAGMEM_WAY_VALID = TAGMEM_WAY_WIDTH - 2;
   localparam TAGMEM_WAY_DIRTY = TAGMEM_WAY_WIDTH - 1;
   
   // Additionally, the tag memory entry contains an LRU value. The
   // width of this is 0 for OPTION_DCACHE_LIMIT_WIDTH==1
   localparam TAG_LRU_WIDTH = OPTION_DCACHE_WAYS*(OPTION_DCACHE_WAYS-1) >> 1;

   // We have signals for the LRU which are not used for one way
   // caches. To avoid signal width [-1:0] this generates [0:0]
   // vectors for them, which are removed automatically then.
   localparam TAG_LRU_WIDTH_BITS = (OPTION_DCACHE_WAYS >= 2) ? TAG_LRU_WIDTH : 1;

   // Compute the total sum of the entry elements
   localparam TAGMEM_WIDTH = TAGMEM_WAY_WIDTH * OPTION_DCACHE_WAYS + TAG_LRU_WIDTH;

   // For convenience we define the position of the LRU in the tag
   // memory entries
   localparam TAG_LRU_MSB = TAGMEM_WIDTH - 1;
   localparam TAG_LRU_LSB = TAG_LRU_MSB - TAG_LRU_WIDTH + 1;

   // FSM state signals
   reg [4:0] 			      state;
   wire				      idle;
   wire				      read;
   wire				      write;
   wire				      refill;

   reg [WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH] invalidate_adr;
   wire [31:0] 			      next_refill_adr;
   wire 			      refill_done;
   wire 			      refill_hit;
   reg [(1<<(OPTION_DCACHE_BLOCK_WIDTH-2))-1:0] refill_valid;
   reg [(1<<(OPTION_DCACHE_BLOCK_WIDTH-2))-1:0] refill_valid_r;
   wire				      invalidate;

   // The index we read and write from tag memory
   wire [OPTION_DCACHE_SET_WIDTH-1:0]  tag_windex;
   
   // The data from the tag memory
   wire [TAGMEM_WIDTH-1:0] 	          tag_dout;
   wire [TAG_LRU_WIDTH_BITS-1:0]      tag_lru_out;
   wire [TAGMEM_WAY_WIDTH-1:0] 	      tag_way_out [OPTION_DCACHE_WAYS-1:0];

   // The data to the tag memory
   wire [TAGMEM_WIDTH-1:0] 	      tag_din;
   wire [TAG_LRU_WIDTH_BITS-1:0]       tag_lru_in;
   wire [TAGMEM_WAY_WIDTH-1:0] 	      tag_way_in [OPTION_DCACHE_WAYS-1:0];

   reg [TAGMEM_WAY_WIDTH-1:0] 	      tag_way_save[OPTION_DCACHE_WAYS-1:0];

   // Whether to write to the tag memory in this cycle
   wire 				      tag_we;
//    assign tag_we = ( !dm_stall & !o_p_stall ) | ( state==`LOAD_OVER );
   assign tag_we = ( |way_hit ) ;
   // This is the tag we need to write to the tag memory during refill
   wire [TAG_WIDTH-1:0] 	      tag_wtag;

   // This is the tag we check against
   wire [TAG_WIDTH-1:0] 	      tag_tag;

   // Access to the way memories
   wire [WAY_WIDTH-3:0] 	      way_raddr[OPTION_DCACHE_WAYS-1:0];
   wire [WAY_WIDTH-3:0] 	      way_waddr[OPTION_DCACHE_WAYS-1:0];
   wire [OPTION_OPERAND_WIDTH-1:0]    way_din[OPTION_DCACHE_WAYS-1:0];
   wire [OPTION_OPERAND_WIDTH-1:0]    way_dout[OPTION_DCACHE_WAYS-1:0];
   
   wire [OPTION_OPERAND_WIDTH*8-1:0]    way_dout_all[OPTION_DCACHE_WAYS-1:0];
   //useless in icache
   wire [OPTION_DCACHE_WAYS-1:0]       way_we;

   // Does any way hit?
   wire 			      hit;
   wire [OPTION_DCACHE_WAYS-1:0]      way_hit;
   wire [OPTION_DCACHE_WAYS-1:0]  load_bus_we = tag_lru_out ? 2'b10: 2'b01 ;
   
   
   // This is the least recently used value before access the memory.
   // Those are one hot encoded.
   wire [OPTION_DCACHE_WAYS-1:0]      lru;

   // Register that stores the LRU value from lru
    reg queue;
    assign way_we =( state==`LOAD_OVER )? load_bus_we : 2'b00;

   // Intermediate signals to ease debugging
   wire [TAG_WIDTH-1:0]               check_way_tag [OPTION_DCACHE_WAYS-1:0];
   wire                               check_way_match [OPTION_DCACHE_WAYS-1:0];
   wire                               check_way_valid [OPTION_DCACHE_WAYS-1:0];
   wire                               check_way_dirty [OPTION_DCACHE_WAYS-1:0];
   
    wire [`TAG_WIDTH-1:0]     cache_addr_cpu_tag;
	reg  [`TAG_WIDTH-1:0]    cache_addr_mem_tag; //��tag�ĵ�ַ��������һ�ıȶ�
	
	wire [`INDEX_WIDTH-1:0]  cache_addr_idx;
	wire [`OFFSET_WIDTH-1:0] cache_addr_cpu_off;
	reg  [`OFFSET_WIDTH-1:0] cache_addr_access_off;//���������ڴ�rom��ȡ����ʱ������
	reg  [`OFFSET_WIDTH-1:0] cache_addr_mem_off;
	wire [1:0]               cache_addr_dropoff;
	
	assign {
		cache_addr_cpu_tag,  cache_addr_idx,
		cache_addr_cpu_off,  cache_addr_dropoff
	} = i_p_addr;// 这个是NPC
    assign tag_tag = i_p_addrAfterTrans[31:12];
    reg  [31:0] dbus_addr_pre;
    wire [`TAG_WIDTH-1:0]    cache_addr_cpu_tag_pre;
    wire [`INDEX_WIDTH-1:0]  cache_addr_idx_pre;
    wire [`OFFSET_WIDTH-1:0] cache_addr_cpu_off_pre;
    wire [1:0]               cache_addr_dropoff_pre;
    assign {
        cache_addr_cpu_tag_pre,  cache_addr_idx_pre,
        cache_addr_cpu_off_pre,  cache_addr_dropoff_pre
    } = i_p_addrAfterTrans;//�ڶ����ڵĶ�ȡ
    
    assign tag_wtag = araddr[31:12];
    assign tag_din[TAG_LRU_MSB:TAG_LRU_LSB] = tag_lru_in;
    assign tag_lru_out = tag_dout[TAG_LRU_MSB:TAG_LRU_LSB];
    genvar 			      i;
    
    generate
        for (i = 0; i < OPTION_DCACHE_WAYS; i=i+1) begin : ways
            assign way_raddr[i] = i_p_addr[WAY_WIDTH-1:2];
            assign way_waddr[i] = {araddr[11:2]};// infact only need 11:5
            assign way_din[i] = 32'b0;

        // compare stored tag with incoming tag and check valid bit
            assign check_way_tag[i] = tag_way_out[i][TAG_WIDTH-1:0];
            assign check_way_match[i] = (check_way_tag[i] == tag_tag);
            assign check_way_valid[i] = tag_way_out[i][TAGMEM_WAY_VALID];
            assign check_way_dirty[i] = tag_way_out[i][TAGMEM_WAY_DIRTY];
            assign way_hit[i] = check_way_valid[i] & check_way_match[i] & !queue ;

            // Multiplex the way entries in the tag memory
            assign tag_din[(i+1)*TAGMEM_WAY_WIDTH-1:i*TAGMEM_WAY_WIDTH] = tag_way_in[i];
            assign tag_way_out[i] = tag_dout[(i+1)*TAGMEM_WAY_WIDTH-1:i*TAGMEM_WAY_WIDTH];
            

            assign tag_way_in[i] = (tag_lru_out==i & state == `LOAD_OVER ) ? {2'b01,tag_wtag}  : 22'b0 ;
        end
    endgenerate

  
    wire [7:0] cs_a;
    reg  [7:0] word_valid;
    wire [7:0] cs_target;
    wire missFillBuffer_wen = rvalid & rready;
    wire cs_ok = (|(word_valid & cs_target)) ;
    
    reg [OPTION_OPERAND_WIDTH*8-1:0] missFillBuffer;
    wire [OPTION_OPERAND_WIDTH-1:0] load_from_ram_bus[7:0] ;

    onehot_3s8 missFillOneHot(counter,cs_a);
    onehot_3s8 firstMiss(i_p_addrAfterTrans[4:2],cs_target);
    always @(posedge clk )begin 
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
   wire [31:0] wire_o_p_rddata = (i_p_addrAfterTrans[31:5]== araddr[31:5] &cs_ok )? load_from_ram_bus[i_p_addrAfterTrans[4:2]]:
                                   way_hit[0]? way_dout[0]: way_dout[1];
//    assign o_p_rddata = (i_p_addrAfterTrans[31:5]== araddr[31:5] &cs_ok )? load_from_ram_bus[i_p_addrAfterTrans[4:2]]:
//                        { {32{way_hit[0]}}&way_dout[0] } | {{32{way_hit[1]}}&way_dout[1]} ;
   reg store ;
   reg [31:0] reg_o_p_rdata;
   always @(posedge clk) begin
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



    //todo: refill is wrong
   assign idle = (state == `IDLE ) ;
//    assign refill = (state == `REFILL);
//    assign read = (state == `READ);
//    assign write = (state == `WRITE);

    reg invalidate_ack;
   
 
   // An invalidate request is either a block flush or a block invalidate
    assign tag_windex  =    (state ==`LOAD_OVER     ) ? araddr[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH] :
                            ((|way_hit) & i_p_read  ) ? i_p_addrAfterTrans[11:5] :  0 ;

   integer w1;
   always @(posedge clk) begin
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
                // Store address in invalidate_adr that is muxed to the tag
                // memory write address
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

   //
   // This is the combinational part of the state machine that
   // interfaces the tag and way memories.
   //

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
            // Outputs
            .dout_all(way_dout_all[i]),
            .dout			(way_dout[i]),
            // Inputs
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
      // Outputs
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
