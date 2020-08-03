`include "my_global.h"
`include "def.svh"

module mycpu_top(
    input [5:0] ext_int,

    input aclk,
    input aresetn,

    //ar
    output [3 :0] arid         ,
    output [31:0] araddr       ,
    output [3 :0] arlen        , //modified
    output [2 :0] arsize       ,
    output [1 :0] arburst      ,
    output [1 :0] arlock       ,
    output [3 :0] arcache      ,
    output [2 :0] arprot       ,
    output        arvalid      ,
    input         arready      ,
    //r           
    input  [3 :0] rid          ,
    input  [31:0] rdata        ,
    input  [1 :0] rresp        ,
    input         rlast        ,
    input         rvalid       ,
    output        rready       ,
    //aw          
    output [3 :0] awid         ,
    output [31:0] awaddr       ,
    output [3 :0] awlen        , //modified
    output [2 :0] awsize       ,
    output [1 :0] awburst      ,
    output [1 :0] awlock       ,
    output [3 :0] awcache      ,
    output [2 :0] awprot       ,
    output        awvalid      ,
    input         awready      ,
    //w          
    output [3 :0] wid          ,
    output [31:0] wdata        ,
    output [3 :0] wstrb        ,
    output        wlast        ,
    output        wvalid       ,
    input         wready       ,
    //b           
    input  [3 :0] bid          ,
    input  [1 :0] bresp        ,
    input         bvalid       ,
    output        bready       ,
    //debugç›¸å�?�³æŽ¥å�£
    output [31:0] debug_wb_pc,
    output [3:0] debug_wb_rf_wen,
    output [4:0] debug_wb_rf_wnum,
    output [31:0] debug_wb_rf_wdata,
    output [31:0] I_PC_
);

    wire `INSTR_SET;
    //prepare longxin interface 
    wire dm_stall;
	wire Clk = aclk;
    wire Clr = ! aresetn;
    
    reg myaresetn ;
    reg [6:0] resetCounter ;
    always @(posedge Clk) begin
        if(!aresetn) begin
            myaresetn<=1'b0;
            resetCounter<=7'b0;
        end
        if(aresetn & !myaresetn) begin
            resetCounter<= resetCounter +1;
        end
        if(aresetn & !myaresetn & (&resetCounter))begin
            myaresetn<=1'b1;
        end
    end
    wire MyClr = !aresetn | !myaresetn ;
    // sram 
    wire inst_sram_en;
    wire[3:0] inst_sram_wen;
    wire[31:0] inst_sram_wdata;
    wire[31:0] inst_sram_addr;
    wire[31:0] inst_sram_rdata;
    wire D_stall_Pass;
    assign inst_sram_wen = 4'b0;
    assign inst_sram_wdata = 32'b0;
    assign inst_sram_en = aresetn & (  !D_stall_Pass & !dm_stall  );

    wire[31:0] data_sram_rdata;
    wire[31:0] data_sram_wdata;
    wire[31:0] data_sram_addr;
    wire inst_sram_addr_ok; // no used
    wire data_sram_addr_ok; // no used
    wire data_sram_data_ok;
    wire[3:0] data_sram_wen;

    wire[1:0] data_size;
    // assign data_size = data_sram_wen != 0 ? E_awsize : 2'b10;
    assign data_size = (sw | lw) ? 2'b10 :
                       (sh | lh | lhu) ? 2'b01 :
                                         2'b00 ;
					   
	assign wid = awid;	
	
    axi_req req_i;
    axi_resp resp_i;
    	   
 
    wire [3 :0] arid_d         ;
    wire [31:0] araddr_d       ;
    wire [3 :0] arlen_d        ;
    wire [2 :0] arsize_d       ;
    wire [1 :0] arburst_d      ;
    wire [1 :0] arlock_d        ;
    wire [3 :0] arcache_d      ;
    wire [2 :0] arprot_d       ;
    wire        arvalid_d      ;
    wire         arready_d      ;
    //r           
    wire  [3 :0] rid_d          ;
    wire  [31:0] rdata_d        ;
    wire  [1 :0] rresp_d        ;
    wire         rlast_d        ;
    wire         rvalid_d       ;
    wire        rready_d       ;
    //aw          
    wire [3 :0] awid_d         ;
    wire [31:0] awaddr_d       ;
    wire [7 :0] awlen_d        ;
    wire [2 :0] awsize_d       ;
    wire [1 :0] awburst_d      ;
    wire [1 :0] awlock_d      ;
    wire [3 :0] awcache_d      ;
    wire [2 :0] awprot_d       ;
    wire        awvalid_d      ;
    wire         awready_d      ;
    //w          
    wire [3 :0] wid_d          ;
    wire [31:0] wdata_d        ;
    wire [3 :0] wstrb_d        ;
    wire        wlast_d        ;
    wire        wvalid_d       ;
    wire         wready_d       ;
    //b           
    wire  [3 :0] bid_d          ;
    wire  [1 :0] bresp_d        ;
    wire         bvalid_d       ;
    wire        bready_d ;      
	
    wire [3 :0] arid_uncache         ;
    wire [31:0] araddr_uncache       ;
    wire [7 :0] arlen_uncache        ;
    wire [2 :0] arsize_uncache       ;
    wire [1 :0] arburst_uncache      ;
    wire [1 :0] arlock_uncache        ;
    wire [3 :0] arcache_uncache      ;
    wire [2 :0] arprot_uncache       ;
    wire        arvalid_uncache      ;
    wire         arready_uncache      ;
    //r           
    wire  [3 :0] rid_uncache          ;
    wire  [31:0] rdata_uncache        ;
    wire  [1 :0] rresp_uncache        ;
    wire         rlast_uncache        ;
    wire         rvalid_uncache       ;
    wire        rready_uncache       ;
    //aw          
    wire [3 :0] awid_uncache         ;
    wire [31:0] awaddr_uncache       ;
    wire [3 :0] awlen_uncache        ;
    wire [2 :0] awsize_uncache       ;
    wire [1 :0] awburst_uncache      ;
    wire [1 :0] awlock_uncache      ;
    wire [3 :0] awcache_uncache      ;
    wire [2 :0] awprot_uncache       ;
    wire        awvalid_uncache      ;
    wire         awready_uncache      ;
    //w          
    wire [3 :0] wid_uncache          ;
    wire [31:0] wdata_uncache        ;
    wire [3 :0] wstrb_uncache        ;
    wire        wlast_uncache        ;
    wire        wvalid_uncache       ;
    wire         wready_uncache       ;
    //b           
    wire  [3 :0] bid_uncache          ;
    wire  [1 :0] bresp_uncache        ;
    wire         bvalid_uncache       ;
    wire        bready_uncache ;      

    ///***
    wire inst_uncached ;
    wire icache_stall;
    
    wire E_now_exp ;
    wire [31:0] rdata_icache;
    ///***

    wire data_uncached ;

    wire total_uncache;
    reg icache_close;
    wire dcache_close;
    wire inst_sram_data_ok;
    reg[3:0] cache_timer;
    always @(posedge aclk) begin
        if (MyClr) begin
            icache_close <= 1;
            cache_timer <= 4'b11;
        end 
        else if (inst_sram_data_ok) begin
            cache_timer <= cache_timer == 0 ? 0 : cache_timer - 1;
        end
        if (cache_timer == 0) begin
            icache_close <= 0;
        end
    end
    assign total_uncache = icache_close | dcache_close;
    wire        axi_arready;
    assign axi_arready = total_uncache ? arready : arready_uncache;

    //r           
    wire  [3 :0] axi_rid;
    assign axi_rid = total_uncache ? rid : rid_uncache;
    wire  [31:0] axi_rdata;
    assign axi_rdata = total_uncache ? rdata : rdata_uncache;
    wire  [1 :0] axi_rresp;
    assign axi_rresp = total_uncache ? rresp : rresp_uncache;
    wire         axi_rlast;
    assign axi_rlast = total_uncache ? rlast : rlast_uncache;
    wire         axi_rvalid;
    assign axi_rvalid = total_uncache ? rvalid : rvalid_uncache;
    wire         axi_awready;
    assign axi_awready = total_uncache ? awready : awready_uncache;
    wire         axi_wready;
    assign axi_wready = total_uncache ? wready : wready_uncache;
    //b           
    wire  [3 :0] axi_bid;
    assign axi_bid = total_uncache ? bid : bid_uncache;
    wire  [1 :0] axi_bresp;
    assign axi_bresp = total_uncache ? bresp : bready_uncache;
    wire         axi_bvalid;
    assign axi_bvalid = total_uncache ? bvalid : bvalid_uncache;
    cpu_axi_interface cpu_axi_interface(
        .clk(aclk),
        .resetn(aresetn ),

        .inst_req( inst_uncached & inst_sram_en),
        .inst_wr(|inst_sram_wen), //4 to 1
        .inst_size(2'b10), //todo
        .inst_wdata(inst_sram_wdata),
        .inst_addr(inst_sram_addr),
        .inst_rdata(inst_sram_rdata),
        .inst_addr_ok(inst_sram_addr_ok),
        .inst_data_ok(inst_sram_data_ok), //todo
        
        .data_req( data_uncached &(read|write) & !E_now_exp ), //è¯»å†™å†�?�å­˜è¯·æ±�??
        .data_wr(|data_sram_wen) , //
        .data_size(data_size), // ?
        .data_wdata(data_sram_wdata),
        .data_addr(data_sram_addr),
        .data_rdata(data_sram_rdata),
        .data_addr_ok(data_sram_addr_ok),
        .data_data_ok(data_sram_data_ok), //todo
        
        //axi
        //ar
        .arid(arid_uncache),
        .araddr(araddr_uncache),
        .arlen(arlen_uncache),
        .arsize(arsize_uncache),
        .arburst(arburst_uncache),
        .arlock(arlock_uncache),
        .arcache(arcache_uncache),
        .arprot(arprot_uncache),
        .arvalid(arvalid_uncache),
        .arready(axi_arready),
        //r           
        .rid(axi_rid),
        .rdata(axi_rdata),
        .rresp(axi_rresp),
        .rlast(axi_rlast),
        .rvalid(axi_rvalid),
        .rready(rready_uncache),
        //aw          
        .awid(awid_uncache),
        .awaddr(awaddr_uncache),
        .awlen(awlen_uncache),
        .awsize(awsize_uncache),
        .awburst(awburst_uncache),
        .awlock(awlock_uncache),
        .awcache(awcache_uncache),
        .awprot(awprot_uncache),
        .awvalid(awvalid_uncache),
        .awready(axi_awready),
        //w          
        .wid(wid_uncache),
        .wdata(wdata_uncache),
        .wstrb(wstrb_uncache),
        .wlast(wlast_uncache),
        .wvalid(wvalid_uncache),
        .wready(axi_wready),
        //b           
        .bid(axi_bid),
        .bresp(axi_bresp),
        .bvalid(axi_bvalid),
        .bready(bready_uncache)       
    );

	wire [31:0] I_PC,I_Instr;
	wire [31:0] D_NewPC_Pass,I_PC_Pass;
	wire [31:0] E_Data;
	wire E_MemFamily;
    wire [31:0] im_pc;

    
    wire exp_flush;

	
    wire[31:0] exception_new_pc;
	wire I_nextNotReady;

    wire inst_exp_miss;
    wire inst_exp_illegal;
    wire inst_exp_invalid;
	InstrFetchState InstrFetchState(
        .Clk(Clk),
        .Clr(MyClr),
        .dm_stall(dm_stall),
        .exp_flush(exp_flush),
        .inst_sram_data_ok(inst_sram_data_ok),
        .D_stall_Pass(D_stall_Pass),
        .D_NewPC_Pass(D_NewPC_Pass),
        .exception_new_pc(exception_new_pc),
        .Instr_axi_Inter(inst_sram_rdata),
        .inst_exp_miss(inst_exp_miss),
        .inst_exp_illegal(inst_exp_illegal),
        .inst_exp_invalid(inst_exp_invalid),
        .I_PC(I_PC),
        .I_PC_Pass(I_PC_Pass),
        .I_Instr(I_Instr),
        .im_pc(im_pc),
        .I_inst_miss(I_inst_miss),
        .I_inst_illegal(I_inst_illegal),
        .I_inst_invalid(I_inst_invalid),
        ///***
        .icache_stall(icache_stall),
        .uncache_inst(inst_uncached),
        .I_icache_rdata(rdata_icache),
        .I_nextNotReady(I_nextNotReady),
        .inst_sram_addr(inst_sram_addr)
        ///***
    );
	
	wire M_WriteRegEnable;
	// wire [4:0] M_RegWriteId;
    // wire [31:0] M_RegWriteData;
	wire [4:0] D_RsID,D_RtID,D_RdID;
	wire [31:0] D_RsData,D_RtData;
	wire [4:0] D_Shamt;
	wire [15:0] D_Imm16;
	wire [`INSTRBUS_WIDTH-1:0] D_InstrBus;
	wire [31:0]	D_PC,M_PC,D_EPC;
	wire [3:0] E_T,D_T;
	wire E_WriteRegEnable,D_WriteRegEnable;
	wire [4:0] E_RegId,D_RegId;
	
    wire [3:0] M_T;
	wire [4:0] M_RegId;
	wire [31:0] M_Data;
    
    wire E_XALU_Busy;
    wire D_in_delayslot;
    
    wire [3:0] M_WriteRegEnableExted;
	DecodeState decodestate(
        .Clk(Clk),
        .Clr(MyClr),
        .is_mul(ExecuteSdate.mul_in_xalu),
        .dm_stall(dm_stall),
        .exp_flush(exp_flush),
        .inst_sram_data_ok(inst_sram_data_ok),
        .W_T(M_T),
        .W_WriteRegEnable(M_WriteRegEnableExted),
        .W_RegWriteId(M_RegId),
        .W_RegWriteData(M_Data),
        .I_PC_Pass(I_PC_Pass),
        .I_PC(I_PC),
        .I_MipsInstr(I_Instr),//todo:mfr
        .W_PC(M_PC),
		.D_NewPC_Pass(D_NewPC_Pass),
        .D_PC(D_PC),
        .D_EPC(D_EPC),
        .D_RsID(D_RsID),
        .D_RtID(D_RtID),
        .D_RdID(D_RdID),
        .D_RsData(D_RsData),
        .D_RtData(D_RtData),
        .D_Shamt(D_Shamt),
        .D_Imm16(D_Imm16),
        .D_InstrBus(D_InstrBus),
		.E_T(E_T),
        .E_WriteRegEnable(E_WriteRegEnable),
        .E_RegId(E_RegId),
        .E_Data(E_Data),
        .D_T(D_T),
        .D_WriteRegEnable(D_WriteRegEnable),
        .D_RegId(D_RegId),
        .D_stall_Pass(D_stall_Pass),
        .E_XALU_Busy(E_XALU_Busy),
        .D_in_delayslot(D_in_delayslot),

        .I_inst_miss(I_inst_miss),
        .I_inst_illegal(I_inst_illegal),
        .I_inst_invalid(I_inst_invalid),
        .D_inst_miss(D_inst_miss),
        .D_inst_illegal(D_inst_illegal),
        .D_inst_invalid(D_inst_invalid),
        ///***
        .I_nextNotReady(I_nextNotReady),
 //       .E_now_exp(E_now_exp),
        .exception_new_pc(exception_new_pc)
        ///***
        // .I_inst_uncache(uncache_inst) ,
        // .I_cache_MipsInstr(rdata_icache),
        // .icache_stall(icache_stall)
    );
    
    wire [31:0] E_PC, E_EPC;
	wire [31:0] E_WriteMemData;
	wire [4:0] E_RtID,E_RdID;
	wire [3:0] E_MemWriteEnable;
	wire [8:0] E_ExtType;
    wire [`INSTRBUS_WIDTH-1:0] E_InstrBus;
    wire E_OverFlow;
    wire data_alignment_err;
    wire [31:0] E_DataLSaddr;    
    wire E_MemReadEnable_Inter;
    wire E_EstallClear ; //ç”¨æ�¥ç»™Eçº§å�šclearä¿¡å�·ç�?�¨ï¼Œæ�¥è‡ªdcacheï¿????????

    ///***
    wire E_MemSaveType_Inter ;
    wire E_MemLStype_Inter = E_MemReadEnable_Inter | E_MemSaveType_Inter ;
    ///***
	ExecuteSdate ExecuteSdate(
        .Clk(Clk),
        .Clr(MyClr),
        .exp_flush(exp_flush),
        .data_sram_data_ok(data_sram_data_ok),
        .D_PC(D_PC),
        .D_EPC(D_EPC),
        .D_RsID(D_RsID),
        .D_RtID(D_RtID),
        .D_RdID(D_RdID),
        .D_RsData(D_RsData),
        .D_RtData(D_RtData),
        .D_Shamt(D_Shamt),
        .D_Imm16(D_Imm16),
        .D_InstrBus(D_InstrBus),
        .D_T(D_T),
        .D_WriteRegEnable(D_WriteRegEnable),
		.D_RegId(D_RegId),
		.M_T(M_T),
        .M_WriteRegEnable(M_WriteRegEnable),
        .M_RegId(M_RegId),
        .M_Data(M_Data),
        .E_PC(E_PC),
        .E_EPC(E_EPC),
        .E_WriteMemData(E_WriteMemData),
        .E_RtID(E_RtID),
        .E_RdID(E_RdID),
		.E_T(E_T),
        .E_WriteRegEnable(E_WriteRegEnable),
        .E_RegId(E_RegId),
        .E_Data(E_Data),
        .E_ExtType(E_ExtType),
		.E_MemWriteEnable(E_MemWriteEnable),
        .E_MemFamily(E_MemFamily),
        .E_InstrBus(E_InstrBus),
        .E_OverFlow(E_OverFlow), // æ€ªï¿�??ï¿½çš�?
        .E_data_alignment_err(data_alignment_err),
        .dm_stall(dm_stall),
        .E_XALU_Busy_real(E_XALU_Busy),
        .D_in_delayslot(D_in_delayslot),
        .E_in_delayslot(E_in_delayslot),

        .D_inst_miss(D_inst_miss),
        .D_inst_illegal(D_inst_illegal),
        .D_inst_invalid(D_inst_invalid),
        .E_inst_miss(E_inst_miss),
        .E_inst_illegal(E_inst_illegal),
        .E_inst_invalid(E_inst_invalid),
        ///***
        .E_now_exp(E_now_exp),
        .E_calLSaddr(E_DataLSaddr),
        .E_MemReadEnable_Inter(E_MemReadEnable_Inter),
        .E_EstallClear(E_EstallClear),
        .E_MemSaveType_Inter(E_MemSaveType_Inter)
        ///***
    );
	
    wire fetch_alignment_err;
    assign fetch_alignment_err = E_PC[1:0] != 2'b0;
    wire[31:0] cp0_reg_value;
    
    
    assign {`INSTR_SET} = E_InstrBus;
    
    wire[31:0] M_PC_post, M_Data_post;
    wire[4:0] M_RegId_post;
    wire  M_WriteRegEnable_post;

    wire [31:0] rdata_dcache,data2cp0;
    wire not_hit ;
    
	MemState MemState(
        .Clk(Clk),
        .Clr(MyClr),
        .dm_stall(dm_stall),
        .exp_flush(exp_flush),
        .E_PC(E_PC),
        .E_MemWriteData(E_WriteMemData),
        .E_RtID(E_RtID),
        .E_Data(E_Data),
        .E_ExtType(E_ExtType),
        .E_MemWriteEnable(E_MemWriteEnable),
        .E_WriteRegEnable(E_WriteRegEnable),
		.E_RegId(E_RegId),
        .E_MemFamily(E_MemFamily),
        .E_InstrBus(E_InstrBus),
        .E_T(E_T),
        .rd_cp0_value(mfc0),
        .cp0_reg_value(cp0_reg_value),
        .M_WriteRegEnable(M_WriteRegEnable_post),
        .M_RegId(M_RegId_post),
        .M_Data(M_Data_post),
        .M_PC(M_PC_post),
        .data_sram_rdata(data_sram_rdata),
        .cache_rdata(rdata_dcache),
        .data_sram_wdata(data_sram_wdata),
        .read(read),
        .write(write),
        .data_sram_data_ok(data_sram_data_ok),
        .hit(!not_hit),
        .uncached(data_uncached),
        .data2cp0(data2cp0),
        
        .EstallClear(E_EstallClear),
        .M_T(M_T),
        .M_WriteRegEnableExted(M_WriteRegEnableExted)
    );
    //exception æœ‰é�?�®é¢˜ï¼Œä¼šè®©å¼�?�å¸¸è¿�?�å�?�¥å�?�™å›�?
    assign M_PC = exp_flush ? 32'h0 : M_PC_post;
    assign M_Data = exp_flush ? 32'h0 : M_Data_post;
    assign M_RegId = exp_flush ? 5'h0 : M_RegId_post;
    assign M_WriteRegEnable = exp_flush ? 1'b0 : M_WriteRegEnable_post;


    wire unknown_inst;
    assign unknown_inst = E_InstrBus == 0;

    wire[31:0] cp0_epc;
    wire cp0_allow_int;
    wire[31:0] exp_badvaddr, exp_epc;
    wire exp_badvaddr_we;
    wire[4:0] exp_code;
    wire clear_exl;
    wire[7:0] interrupt_flag;
    wire cp0_wr_exp;
    
//    wire data_uncached;
//    wire inst_uncached;
    wire data_exp_miss;
    wire data_exp_illegal;
    wire data_exp_dirty;
    wire data_exp_invalid;

    exception exception(
        //output
        .flush(exp_flush),
        .wr_exp(cp0_wr_exp),
        .clear_exl(clear_exl),
        .exp_code(exp_code),
        .epc(exp_epc),
        .badvaddr(exp_badvaddr),
        .badvaddr_we(exp_badvaddr_we),
        .exception_new_pc(exception_new_pc),
        
        //input
        .clk(Clk),
        .E_EPC(E_EPC),
        .pc(E_PC),
        .mm_pc(M_PC_post),
        .data_vaddr(E_Data), //
        .data_we(sb | sh | sw), // store_alignment_err
        .data_miss(data_exp_miss),
        .inst_miss(E_inst_miss),
        .data_illegal(data_exp_illegal | data_alignment_err),
        .inst_illegal(E_inst_illegal | fetch_alignment_err),
        .data_invalid(data_exp_invalid),
        .inst_invalid(E_inst_invalid),
        .data_dirty(data_exp_dirty),

        .eret(eret),
        .my_break(my_break),
        .syscall(syscall),
        .unknown_inst(unknown_inst),
        .in_delayslot(E_in_delayslot),
        .overflow(E_OverFlow),
        .epc_in(cp0_epc),
        .allow_int(cp0_allow_int),
        .interrupt_flag(interrupt_flag),
        .inst_sram_data_ok(inst_sram_data_ok) ,//maybe bug
        .icache_stall(icache_stall),
        .E_now_exp(E_now_exp),
        .inst_uncached(inst_uncached)
    );

    reg[5:0] hardware_int_sample;
    
    always @(posedge Clk) begin
        if (Clr) begin
            hardware_int_sample <= 6'b0;
        end else begin
            hardware_int_sample <= ext_int;
        end
    end

    cp0 cp0(
        //output
        .epc(cp0_epc),
        .allow_int(cp0_allow_int),
        .in_exl(), //TODO
        .data_o(cp0_reg_value),
        .interrupt_flag(interrupt_flag),
        // input
        .clk(Clk),
        .rst(Clr),
        .rd_addr(E_RdID), //å�ªæœ�?�mfc0
        .we(mtc0), // TODO: more writenable
        .wr_addr(E_RegId), //TODO
        .data_i(data2cp0),
        .hardware_int(hardware_int_sample),
        .clear_exl(clear_exl),
        .en_exp_i(cp0_wr_exp),
        .exp_bd(E_in_delayslot),
        .exp_epc(exp_epc),
        .exp_code(exp_code),
        .exp_badvaddr(exp_badvaddr),
        .exp_badvaddr_we(exp_badvaddr_we),
        .tlbwi(tlbwi),
        .tlbr(tlbr),
        .tlbp(tlbp),

        //mmu
        //output
        .icache_close(icache_close),
        .dcache_close(dcache_close),
        .daddr_o(data_sram_addr), 
        .iaddr_o(inst_sram_addr), 
        .data_uncached(data_uncached), //todo:
        .inst_uncached(inst_uncached), //todo:

        .data_exp_miss(data_exp_miss),
        .inst_exp_miss(inst_exp_miss),
        .data_exp_illegal(data_exp_illegal),
        .inst_exp_illegal(inst_exp_illegal),
        .data_exp_dirty(data_exp_dirty),
        .data_exp_invalid(data_exp_invalid),
        .inst_exp_invalid(inst_exp_invalid),

        //input
        .daddr_i(E_Data),
        .iaddr_i(im_pc),
        .data_en(E_MemFamily), //todo: cache
        .inst_en(1'b1)
    );
    assign data_sram_wen = E_MemWriteEnable;
    assign data_sram_en = aresetn;

    assign debug_wb_pc = M_PC;
    assign debug_wb_rf_wdata = M_Data;
    assign debug_wb_rf_wen = (M_WriteRegEnable & (!dm_stall |  E_now_exp ))?4'b1111:4'b0000;
    assign debug_wb_rf_wnum = M_RegId;
	
	
	wire rest_out;
    wire rest_out1;
    wire rest_out2;
    wire rest_out3;
	
	
    //assign data_sram_data_ok = ~not_hit;
    my_dcache dcache(
        .cache_reset(myaresetn),
        .reset(Clr)                                    ,
        .clk(Clk)                                      ,
    //todo:first
    //exchange with cpu
        .i_p_addr(E_DataLSaddr)                        ,
        .i_p_tag_bit_raddr(E_Data[11:5]),
        .i_p_addrAfterTrans(data_sram_addr)            ,
	    .i_p_byte_en(E_MemWriteEnable)                 ,
        .i_p_nextIsRead(E_MemReadEnable_Inter)         ,
        .i_p_nextIsLS(E_MemLStype_Inter),
        .i_p_nextIsSave(E_MmeSaveTypeInter)            ,
	    .i_p_read((!data_uncached) &read & !E_now_exp)  ,
	    .i_p_write((!data_uncached) &write & !E_now_exp),  
	    /*
	input  wire        i_p_hitwriteback,
	input  wire        i_p_hitinvalidate,
	*/
	    .i_p_wrdata(data_sram_wdata),
        .o_p_rddata(rdata_dcache),
        .o_p_stall(not_hit),
        ///***
        .o_p_EstallClear(E_EstallClear),
        ///***
	
       .arid(arid_d),
        .araddr(araddr_d)      ,
        .arlen(arlen_d)        ,
        .arsize(arsize_d)      ,
        .arburst(arburst_d)    ,
        .arlock(arlock_d)      ,
        .arcache(arcache_d)    ,
        .arprot(arprot_d)      ,
        .arvalid(arvalid_d)    ,
        .arready(arready_d)    ,
        //r           
        .rid(rid_d)            ,
        .rdata(rdata_d)        ,
        .rresp(rresp_d)        ,
        .rlast(rlast_d)        ,
        .rvalid (rvalid_d)     ,
        .rready(rready_d)      ,
        //aw          
        .awid(awid_d)          ,
        .awaddr(awaddr_d)      ,
        .awlen(awlen_d)        ,
        .awsize(awsize_d)      ,
        .awburst(awburst_d)    ,
        .awlock(awlock_d)      ,
        .awcache(awcache_d)    ,
        .awprot(awprot_d)      ,
        .awvalid(awvalid_d)    ,
        .awready(awready_d)    ,
        //w          
        .wid(wid_d)            ,
        .wdata(wdata_d)        ,
        .wstrb(wstrb_d)        ,
        .wlast(wlast_d)        ,
        .wvalid(wvalid_d)      ,
        .wready(wready_d)      ,
        //b           
        .bid(bid_d)            ,
        .bresp(bresp_d)        ,
        .bvalid(bvalid_d)      ,
        .bready(bready_d)       
    
  /*  
    // SPR interface
    input wire[31:0] 		      spr_bus_addr_i,
    input 			      spr_bus_we_i,
    input 			      spr_bus_stb_i,
    input [OPTION_OPERAND_WIDTH-1:0]  spr_bus_dat_i,

    output [OPTION_OPERAND_WIDTH-1:0] spr_bus_dat_o
    */
    );
     /*wire [31:0] new_icache_start_pc,new_icache_end_pc;
    
    wire [511:0] instr_for_debug;
    wire icache_valid,icache_ready,icache_stall_realmem;
    
    new_icache icache16(
        .i_clk(Clk),
        .i_rst(Clr),
        .i_out_num(5'd1),
        .i_flush(1'b0),
        .i_uncached(~((!inst_uncached)& 1'b1)),
        .i_phy_addr(inst_sram_addr),
        .i_npc(D_NewPC_Pass),
        .o_inn_stall(icache_stall_realmem),
        .o_mdata_start_pc(new_icache_start_pc),
        .o_mdata_final_pc(new_icache_end_pc),
        .o_mdata_instr(instr_for_debug),
        .o_mvalid(icache_valid),
        .i_mready(1'b1),
        
        .axi_bus_req(req_i),
        .axi_bus_resp(resp_i)
    );
    assign rdata_icache = instr_for_debug[31:0];
    assign icache_stall = icache_stall_realmem | (!icache_valid);*/
    
     my_icache icache(
        .cache_reset(myaresetn),
        .reset(Clr) ,
        .clk(Clk),
    //    .exp_flush(exp_flush),
        .dm_stall(dm_stall | D_stall_Pass ),
        //todo:first
        //exchange with cpu
        .i_p_addr(D_NewPC_Pass),
        .i_p_tag_bit_raddr(I_PC_Pass[11:5]),
	    .i_p_byte_en(4'b0),
	    .i_p_read((!inst_uncached)& 1'b1 ),
	    .i_p_write(1'b0),
        .i_p_addrAfterTrans(inst_sram_addr),
	    /*
	    input  wire        i_p_hitwriteback,
	    input  wire        i_p_hitinvalidate,
	    */
	    .i_p_wrdata(32'b0),
        .o_p_rddata(rdata_icache),
        .o_p_stall(icache_stall),
	
        .arid(req_i.arid),
        .araddr(req_i.araddr)       ,
        .arlen(req_i.arlen)         ,
        .arsize(req_i.arsize)       ,
        .arburst(req_i.arburst)     ,
        .arlock(req_i.arlock)       ,
        .arcache(req_i.arcache)     ,
        .arprot(req_i.arprot)       ,
        .arvalid(req_i.arvalid)     ,
        .arready(resp_i.arready)     ,
        //r           
        .rid(resp_i.rid)            ,
        .rdata(resp_i.rdata)        ,
        .rresp(resp_i.rresp)        ,
        .rlast(resp_i.rlast)        ,
        .rvalid (resp_i.rvalid)     ,
        .rready(req_i.rready)      ,
        //aw          
        .awid(req_i.awid)          ,
        .awaddr(req_i.awaddr)      ,
        .awlen(req_i.awlen)        ,
        .awsize(req_i.awsize)      ,
        .awburst(req_i.awburst)    ,
        .awlock(req_i.awlock)      ,
        .awcache(req_i.awcache)    ,
        .awprot(req_i.awprot)      ,
        .awvalid(req_i.awvalid)    ,
        .awready(resp_i.awready)    ,
        //w          
        .wid(req_i.wid)            ,
        .wdata(req_i.wdata)        ,
        .wstrb(req_i.wstrb)        ,
        .wlast(req_i.wlast)        ,
        .wvalid(req_i.wvalid)      ,
        .wready(resp_i.wready)      ,
        //b           
        .bid(resp_i.bid)            ,
        .bresp(resp_i.bresp)        ,
        .bvalid(resp_i.bvalid)      ,
        .bready(req_i.bready)       
    
    /*  
    // SPR interface
    input wire[31:0] 		      spr_bus_addr_i,
    input 			      spr_bus_we_i,
    input 			      spr_bus_stb_i,
    input [OPTION_OPERAND_WIDTH-1:0]  spr_bus_dat_i,

    output [OPTION_OPERAND_WIDTH-1:0] spr_bus_dat_o
    */
    );
    wire [3 :0] ip_arid;
    assign arid = total_uncache ? arid_uncache : ip_arid;
    wire [31:0] ip_araddr;
    assign araddr = total_uncache ? araddr_uncache : ip_araddr;
    wire [3 :0] ip_arlen;
    assign arlen = total_uncache ? arlen_uncache : ip_arlen;
    wire [2 :0] ip_arsize;
    assign arsize = total_uncache ? arsize_uncache : ip_arsize;
    wire [1 :0] ip_arburst;
    assign arburst = total_uncache ? arburst_uncache : ip_arburst;
    wire [1 :0] ip_arlock;
    assign arlock = total_uncache ? arlock_uncache : ip_arlock;
    wire [3 :0] ip_arcache;
    assign arcache = total_uncache ? arcache_uncache : ip_arcache;
    wire [2 :0] ip_arprot;
    assign arprot = total_uncache ? arprot_uncache : ip_arprot;
    wire        ip_arvalid;
    assign arvalid = total_uncache ? arvalid_uncache : ip_arvalid;
    wire        ip_rready;
    assign rready = total_uncache ? rready_uncache : ip_rready;
    wire [3 :0] ip_awid;
    assign awid = total_uncache ? awid_uncache : ip_awid;
    wire [31:0] ip_awaddr;
    assign awaddr = total_uncache ? awaddr_uncache : ip_awaddr;
    wire [3 :0] ip_awlen;
    assign awlen = total_uncache ? awlen_uncache : ip_awlen;
    wire [2 :0] ip_awsize;
    assign awsize = total_uncache ? awsize_uncache : ip_awsize;
    wire [1 :0] ip_awburst;
    assign awburst = total_uncache ? awburst_uncache : ip_awburst;
    wire [1 :0] ip_awlock;
    assign awlock = total_uncache ? awlock_uncache : ip_awlock;
    wire [3 :0] ip_awcache;
    assign awcache = total_uncache ? awcache_uncache : ip_awcache;
    wire [2 :0] ip_awprot;
    assign awprot = total_uncache ? awprot_uncache : ip_awprot;
    wire        ip_awvalid;
    assign awvalid = total_uncache ? awvalid_uncache : ip_awvalid;
    // wire [3 :0] ip_wid;
    wire [31:0] ip_wdata;
    assign wdata = total_uncache ? wdata_uncache : ip_wdata;
    wire [3 :0] ip_wstrb;
    assign wstrb = total_uncache ? wstrb_uncache : ip_wstrb;
    wire        ip_wlast;
    assign wlast = total_uncache ? wlast_uncache : ip_wlast;
    wire        ip_wvalid;
    assign wvalid = total_uncache ? wvalid_uncache : ip_wvalid;
    wire        ip_bready;
    assign bready = total_uncache ? bready_uncache : ip_bready;
	
    axi_interconnect_0 my_axi_extender (
    .INTERCONNECT_ACLK(Clk),        // input wire INTERCONNECT_ACLK
    .INTERCONNECT_ARESETN(aresetn ),  // input wire INTERCONNECT_ARESETN
    .S00_AXI_ARESET_OUT_N(rest_out),  // output wire S00_AXI_ARESET_OUT_N
    .S00_AXI_ACLK(Clk),                  // input wire S00_AXI_ACLK
    .S00_AXI_AWID(1'b0),                  // input wire [0 : 0] S00_AXI_AWID
    .S00_AXI_AWADDR(req_i.awaddr),              // input wire [31 : 0] S00_AXI_AWADDR
    .S00_AXI_AWLEN({4'b0,req_i.awlen}),                // input wire [7 : 0] S00_AXI_AWLEN
    .S00_AXI_AWSIZE(req_i.awsize),              // input wire [2 : 0] S00_AXI_AWSIZE
    .S00_AXI_AWBURST(req_i.awburst),            // input wire [1 : 0] S00_AXI_AWBURST
    .S00_AXI_AWLOCK(req_i.awlock[0]),              // input wire S00_AXI_AWLOCK
    .S00_AXI_AWCACHE(req_i.awcache),            // input wire [3 : 0] S00_AXI_AWCACHE
    .S00_AXI_AWPROT(req_i.awprot),              // input wire [2 : 0] S00_AXI_AWPROT
    .S00_AXI_AWQOS(4'b0000),                // input wire [3 : 0] S00_AXI_AWQOS
    .S00_AXI_AWVALID(req_i.awvalid),            // input wire S00_AXI_AWVALID
    .S00_AXI_AWREADY(resp_i.awready),            // output wire S00_AXI_AWREADY
    .S00_AXI_WDATA(req_i.wdata),                // input wire [31 : 0] S00_AXI_WDATA
    .S00_AXI_WSTRB(req_i.wstrb),                // input wire [3 : 0] S00_AXI_WSTRB
    .S00_AXI_WLAST(req_i.wlast),                // input wire S00_AXI_WLAST
    .S00_AXI_WVALID(req_i.wvalid),              // input wire S00_AXI_WVALID
    .S00_AXI_WREADY(resp_i.wready),              // output wire S00_AXI_WREADY
    .S00_AXI_BID(resp_i.bid[0]),                    // output wire [0 : 0] S00_AXI_BID
    .S00_AXI_BRESP(resp_i.bresp),                // output wire [1 : 0] S00_AXI_BRESP
    .S00_AXI_BVALID(resp_i.bvalid),              // output wire S00_AXI_BVALID
    .S00_AXI_BREADY(req_i.bready),              // input wire S00_AXI_BREADY
    .S00_AXI_ARID(req_i.arid[0]),                  // input wire [0 : 0] S00_AXI_ARID
    .S00_AXI_ARADDR(req_i.araddr),              // input wire [31 : 0] S00_AXI_ARADDR
    .S00_AXI_ARLEN(req_i.arlen),                // input wire [7 : 0] S00_AXI_ARLEN
    .S00_AXI_ARSIZE(req_i.arsize),              // input wire [2 : 0] S00_AXI_ARSIZE
    .S00_AXI_ARBURST(req_i.arburst),            // input wire [1 : 0] S00_AXI_ARBURST
    .S00_AXI_ARLOCK(req_i.arlock[0]),              // input wire S00_AXI_ARLOCK
    .S00_AXI_ARCACHE(req_i.arcache),            // input wire [3 : 0] S00_AXI_ARCACHE
    .S00_AXI_ARPROT(req_i.arprot),              // input wire [2 : 0] S00_AXI_ARPROT
    .S00_AXI_ARQOS(4'b0011),                // input wire [3 : 0] S00_AXI_ARQOS
    .S00_AXI_ARVALID(req_i.arvalid),            // input wire S00_AXI_ARVALID
    .S00_AXI_ARREADY(resp_i.arready),            // output wire S00_AXI_ARREADY
    .S00_AXI_RID(resp_i.rid),                    // output wire [0 : 0] S00_AXI_RID
    .S00_AXI_RDATA(resp_i.rdata),                // output wire [31 : 0] S00_AXI_RDATA
    .S00_AXI_RRESP(resp_i.rresp),                // output wire [1 : 0] S00_AXI_RRESP
    .S00_AXI_RLAST(resp_i.rlast),                // output wire S00_AXI_RLAST
    .S00_AXI_RVALID(resp_i.rvalid),              // output wire S00_AXI_RVALID
    .S00_AXI_RREADY(req_i.rready),              // input wire S00_AXI_RREADY
    .S01_AXI_ARESET_OUT_N(rest_out1),  // output wire S01_AXI_ARESET_OUT_N
    .S01_AXI_ACLK(Clk),                  // input wire S01_AXI_ACLK
    .S01_AXI_AWID(1'b0),                  // input wire [0 : 0] S01_AXI_AWID
    .S01_AXI_AWADDR(awaddr_d),              // input wire [31 : 0] S01_AXI_AWADDR
    .S01_AXI_AWLEN({4'b0,awlen_d}),                // input wire [7 : 0] S01_AXI_AWLEN
    .S01_AXI_AWSIZE(awsize_d),              // input wire [2 : 0] S01_AXI_AWSIZE
    .S01_AXI_AWBURST(awburst_d),            // input wire [1 : 0] S01_AXI_AWBURST
    .S01_AXI_AWLOCK(awlock_d[0]),              // input wire S01_AXI_AWLOCK
    .S01_AXI_AWCACHE(awcache_d),            // input wire [3 : 0] S01_AXI_AWCACHE
    .S01_AXI_AWPROT(awprot_d),              // input wire [2 : 0] S01_AXI_AWPROT
    .S01_AXI_AWQOS(4'b1100),                // input wire [3 : 0] S01_AXI_AWQOS
    .S01_AXI_AWVALID(awvalid_d),            // input wire S01_AXI_AWVALID
    .S01_AXI_AWREADY(awready_d),            // output wire S01_AXI_AWREADY
    .S01_AXI_WDATA(wdata_d),                // input wire [31 : 0] S01_AXI_WDATA
    .S01_AXI_WSTRB(wstrb_d),                // input wire [3 : 0] S01_AXI_WSTRB
    .S01_AXI_WLAST(wlast_d),                // input wire S01_AXI_WLAST
    .S01_AXI_WVALID(wvalid_d),              // input wire S01_AXI_WVALID
    .S01_AXI_WREADY(wready_d),              // output wire S01_AXI_WREADY
    .S01_AXI_BID(bid_d[0]),                    // output wire [0 : 0] S01_AXI_BID
    .S01_AXI_BRESP(bresp_d),                // output wire [1 : 0] S01_AXI_BRESP
    .S01_AXI_BVALID(bvalid_d),              // output wire S01_AXI_BVALID
    .S01_AXI_BREADY(bready_d),              // input wire S01_AXI_BREADY
    .S01_AXI_ARID(arid_d[0]),                  // input wire [0 : 0] S01_AXI_ARID
    .S01_AXI_ARADDR(araddr_d),              // input wire [31 : 0] S01_AXI_ARADDR
    .S01_AXI_ARLEN(arlen_d),                // input wire [7 : 0] S01_AXI_ARLEN
    .S01_AXI_ARSIZE(arsize_d),              // input wire [2 : 0] S01_AXI_ARSIZE
    .S01_AXI_ARBURST(arburst_d),            // input wire [1 : 0] S01_AXI_ARBURST
    .S01_AXI_ARLOCK(arlock_d[0]),              // input wire S01_AXI_ARLOCK
    .S01_AXI_ARCACHE(arcache_d),            // input wire [3 : 0] S01_AXI_ARCACHE
    .S01_AXI_ARPROT(arprot_d),              // input wire [2 : 0] S01_AXI_ARPROT
    .S01_AXI_ARQOS(4'b1100),                // input wire [3 : 0] S01_AXI_ARQOS
    .S01_AXI_ARVALID(arvalid_d),            // input wire S01_AXI_ARVALID
    .S01_AXI_ARREADY(arready_d),            // output wire S01_AXI_ARREADY
    .S01_AXI_RID(rid_d[0]),                    // output wire [0 : 0] S01_AXI_RID
    .S01_AXI_RDATA(rdata_d),                // output wire [31 : 0] S01_AXI_RDATA
    .S01_AXI_RRESP(rresp_d),                // output wire [1 : 0] S01_AXI_RRESP
    .S01_AXI_RLAST(rlast_d),                // output wire S01_AXI_RLAST
    .S01_AXI_RVALID(rvalid_d),              // output wire S01_AXI_RVALID
    .S01_AXI_RREADY(rready_d),              // input wire S01_AXI_RREADY
    .S02_AXI_ARESET_OUT_N(rest_out3),
    .S02_AXI_ACLK(Clk),   
    .S02_AXI_AWID(1'b0),                  // input wire [0 : 0] S02_AXI_AWID
    .S02_AXI_AWADDR(awaddr_uncache),              // input wire [31 : 0] S02_AXI_AWADDR
    .S02_AXI_AWLEN({4'b0,awlen_uncache}),                // input wire [7 : 0] S02_AXI_AWLEN
    .S02_AXI_AWSIZE(awsize_uncache),              // input wire [2 : 0] S02_AXI_AWSIZE
    .S02_AXI_AWBURST(awburst_uncache),            // input wire [1 : 0] S02_AXI_AWBURST
    .S02_AXI_AWLOCK(awlock_uncache),              // input wire S02_AXI_AWLOCK
    .S02_AXI_AWCACHE(awcache_uncache),            // input wire [3 : 0] S02_AXI_AWCACHE
    .S02_AXI_AWPROT(awprot_uncache),              // input wire [2 : 0] S02_AXI_AWPROT
    .S02_AXI_AWQOS(4'b0000),                // input wire [3 : 0] S02_AXI_AWQOS
    .S02_AXI_AWVALID(awvalid_uncache),            // input wire S02_AXI_AWVALID
    .S02_AXI_AWREADY(awready_uncache),            // output wire S02_AXI_AWREADY
    .S02_AXI_WDATA(wdata_uncache),                // input wire [31 : 0] S02_AXI_WDATA
    .S02_AXI_WSTRB(wstrb_uncache),                // input wire [3 : 0] S02_AXI_WSTRB
    .S02_AXI_WLAST(wlast_uncache),                // input wire S02_AXI_WLAST
    .S02_AXI_WVALID(wvalid_uncache),              // input wire S02_AXI_WVALID
    .S02_AXI_WREADY(wready_uncache),              // output wire S02_AXI_WREADY
    .S02_AXI_BID(bid_uncache[0]),                    // output wire [0 : 0] S02_AXI_BID
    .S02_AXI_BRESP(bresp_uncache),                // output wire [1 : 0] S02_AXI_BRESP
    .S02_AXI_BVALID(bvalid_uncache),              // output wire S02_AXI_BVALID
    .S02_AXI_BREADY(bready_uncache),              // input wire S02_AXI_BREADY
    .S02_AXI_ARID(arid_uncache),                  // input wire [0 : 0] S02_AXI_ARID
    .S02_AXI_ARADDR(araddr_uncache),              // input wire [31 : 0] S02_AXI_ARADDR
    .S02_AXI_ARLEN(8'b0),                // input wire [7 : 0] S02_AXI_ARLEN
    .S02_AXI_ARSIZE(arsize_uncache),              // input wire [2 : 0] S02_AXI_ARSIZE
    .S02_AXI_ARBURST(arburst_uncache),            // input wire [1 : 0] S02_AXI_ARBURST
    .S02_AXI_ARLOCK(arlock_uncache),              // input wire S02_AXI_ARLOCK
    .S02_AXI_ARCACHE(arcache_uncache),            // input wire [3 : 0] S02_AXI_ARCACHE
    .S02_AXI_ARPROT(arprot_uncache),              // input wire [2 : 0] S02_AXI_ARPROT
    .S02_AXI_ARQOS(4'b0011),                // input wire [3 : 0] S02_AXI_ARQOS
    .S02_AXI_ARVALID(arvalid_uncache & !total_uncache ),            // input wire S02_AXI_ARVALID
    .S02_AXI_ARREADY(arready_uncache),            // output wire S02_AXI_ARREADY
    .S02_AXI_RID(rid_uncache),                    // output wire [0 : 0] S02_AXI_RID
    .S02_AXI_RDATA(rdata_uncache),                // output wire [31 : 0] S02_AXI_RDATA
    .S02_AXI_RRESP(rresp_uncache),                // output wire [1 : 0] S02_AXI_RRESP
    .S02_AXI_RLAST(rlast_uncache),                // output wire S02_AXI_RLAST
    .S02_AXI_RVALID(rvalid_uncache),              // output wire S02_AXI_RVALID
    .S02_AXI_RREADY(rready_uncache),              // input wire S02_AXI_RREADY
    .M00_AXI_ARESET_OUT_N(rest_out2),  // output wire M00_AXI_ARESET_OUT_N
    .M00_AXI_ACLK(Clk),                  // input wire M00_AXI_ACLK
    .M00_AXI_AWID(ip_awid),                  // input wire [3 : 0] M00_AXI_AWID
    .M00_AXI_AWADDR(ip_awaddr),              // input wire [31 : 0] M00_AXI_AWADDR
    .M00_AXI_AWLEN(ip_awlen),                // input wire [7 : 0] M00_AXI_AWLEN
    .M00_AXI_AWSIZE(ip_awsize),              // input wire [2 : 0] M00_AXI_AWSIZE
    .M00_AXI_AWBURST(ip_awburst),            // input wire [1 : 0] M00_AXI_AWBURST
    .M00_AXI_AWLOCK(ip_awlock),              // input wire M00_AXI_AWLOCK
    .M00_AXI_AWCACHE(ip_awcache),            // input wire [3 : 0] M00_AXI_AWCACHE
    .M00_AXI_AWPROT(ip_awprot),              // input wire [2 : 0] M00_AXI_AWPROT
    // .M00_AXI_AWQOS(4'b0000),                // input wire [3 : 0] M00_AXI_AWQOS
    .M00_AXI_AWVALID(ip_awvalid),            // input wire M00_AXI_AWVALID
    .M00_AXI_AWREADY(awready),            // output wire M00_AXI_AWREADY
    .M00_AXI_WDATA(ip_wdata),                // input wire [31 : 0] M00_AXI_WDATA
    .M00_AXI_WSTRB(ip_wstrb),                // input wire [3 : 0] M00_AXI_WSTRB
    .M00_AXI_WLAST(ip_wlast),                // input wire M00_AXI_WLAST
    .M00_AXI_WVALID(ip_wvalid),              // input wire M00_AXI_WVALID
    .M00_AXI_WREADY(wready),              // output wire M00_AXI_WREADY
    .M00_AXI_BID(bid),                    // input wire [3 : 0] M00_AXI_BID
    .M00_AXI_BRESP(bresp),                // output wire [1 : 0] M00_AXI_BRESP
    .M00_AXI_BVALID(bvalid),              // output wire M00_AXI_BVALID
    .M00_AXI_BREADY(ip_bready),              // input wire M00_AXI_BREADY
    .M00_AXI_ARID(ip_arid),                  // output wire [3 : 0] M00_AXI_ARID
    .M00_AXI_ARADDR(ip_araddr),              // input wire [31 : 0] M00_AXI_ARADDR
    .M00_AXI_ARLEN(ip_arlen),                // input wire [7 : 0] M00_AXI_ARLEN
    .M00_AXI_ARSIZE(ip_arsize),              // input wire [2 : 0] M00_AXI_ARSIZE
    .M00_AXI_ARBURST(ip_arburst),            // input wire [1 : 0] M00_AXI_ARBURST
    .M00_AXI_ARLOCK(ip_arlock),              // input wire M00_AXI_ARLOCK
    .M00_AXI_ARCACHE(ip_arcache),            // input wire [3 : 0] M00_AXI_ARCACHE
    .M00_AXI_ARPROT(ip_arprot),              // input wire [2 : 0] M00_AXI_ARPROT
    // .M00_AXI_ARQOS(4'b1111),                // input wire [3 : 0] M00_AXI_ARQOS
    .M00_AXI_ARVALID(ip_arvalid),            // input wire M00_AXI_ARVALID
    .M00_AXI_ARREADY(arready),            // output wire M00_AXI_ARREADY
    .M00_AXI_RID(rid),                    // input wire [3 : 0] M00_AXI_RID
    .M00_AXI_RDATA(rdata),                // output wire [31 : 0] M00_AXI_RDATA
    .M00_AXI_RRESP(rresp),                // output wire [1 : 0] M00_AXI_RRESP
    .M00_AXI_RLAST(rlast& !total_uncache),                // output wire M00_AXI_RLAST
    .M00_AXI_RVALID(rvalid & !total_uncache),              // output wire M00_AXI_RVALID
    .M00_AXI_RREADY(ip_rready)              // input wire M00_AXI_RREADY
    );
	
	assign I_PC_=I_PC_Pass;
	
endmodule
