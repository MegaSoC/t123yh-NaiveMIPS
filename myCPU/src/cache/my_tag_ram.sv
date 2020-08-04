`timescale 1ns / 1ps

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
   //logic [20:0] tag_way_out [1:0];
   logic [1:0] [20:0] tag_reg_out, tag_way_out;
   assign tag_way_in[0] = (!cache_reset| !we[0]) ? 21'b0 : din[20:0] ;
   assign tag_way_in[1] = (!cache_reset| !we[1]) ? 21'b0 : din[42:22] ;
  
    
   logic [2:0] tag_bit_in;
   logic [2:0] tag_bit_out;   
    
    
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


   genvar s0;
   // generate
   //    for(s0=0;s0<=1;s0=s0+1) begin :way_tags
   //       tag_ram_bram way_tag(
   //          .clka(clk),    
   //          .ena(1'b1),      
   //          .wea( (refill& we[s0])  | !cache_reset),      
   //          .addra(tag_addr),  
   //          .dina(tag_way_in[s0]),    
   //          .douta(tag_way_out[s0])  
   //       );
   //    end
   // endgenerate

   generate
      for(s0=0;s0<=1;s0=s0+1) begin :way_tags
      xpm_memory_dpdistram #(
	   	// Common module parameters
	   	.MEMORY_SIZE(21*128),
	   	.CLOCKING_MODE("common_clock"),
	   	.USE_MEM_INIT(0),
	   	.MESSAGE_CONTROL(0),

	   	// Port A module parameters
	   	.WRITE_DATA_WIDTH_A(21),
	   	.READ_DATA_WIDTH_A(21),
	   	.READ_RESET_VALUE_A("0"),
	   	.READ_LATENCY_A(0),

	   	// Port B module parameters
	   	.READ_DATA_WIDTH_B(21),
	   	.READ_RESET_VALUE_B("0"),
	   	.READ_LATENCY_B(0)
	   ) xpm_mem (
	   	.clka           ( clk ),
	   	.rsta           ( rst ),
	   	.ena            ( 1'b1  ),
	   	.regcea         ( 1'b0  ),
	   	.wea            ( (refill& we[s0])  | !cache_reset),  
	   	.addra          ( tag_addr ),
	   	.dina           ( tag_way_in[s0]  ),  
	   	.douta          ( ),

	   	.clkb           ( clk ),
	   	.rstb           ( rst ),
	   	.enb            ( 1'b1  ), 
	   	.regceb         ( 1'b0  ),
	   	.addrb          ( tag_addr ),
	   	.doutb          ( tag_way_out[s0] )
	   );     
      end
   endgenerate


   integer i;
   always_ff @(posedge clk) begin
      if(rst | !cache_reset )begin
         tag_reg_out <= 0;
         for(i=0;i<(1<<ADDR_WIDTH) ;i=i+1)
               tag_bit[i]<=3'b0;
      end 
      else begin
         tag_reg_out <= tag_way_out;
         for(i =0;i<2;i=i+1) begin
                if(we[i]) begin
                  tag_bit[waddr][i] <= tag_bit_in[i];
                end
         end
         if(|we)
            tag_bit[waddr][2] <= tag_bit_in[2];
      end 
   end

   
   assign dout =
   {
      tag_bit_out[2:1] ,tag_reg_out[1],tag_bit_out[0],tag_reg_out[0] 
   };

   always_ff @(posedge clk)begin
      if(rst)begin
         reg_initial_addr <= '0;
      end
      else if(!cache_reset) begin
         reg_initial_addr<=reg_initial_addr+1;
      end
   end
    

endmodule