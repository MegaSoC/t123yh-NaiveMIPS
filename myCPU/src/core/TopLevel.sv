`include "my_global.vh"
`include "def.svh"

module mycpu_top(
        input [5:0] ext_int,

        input aclk,
        input aresetn,

                output [3 :0] arid ,
        output [31:0] araddr ,
        output [3 :0] arlen ,         output [2 :0] arsize ,
        output [1 :0] arburst ,
        output [1 :0] arlock ,
        output [3 :0] arcache ,
        output [2 :0] arprot ,
        output arvalid ,
        input arready ,
                input [3 :0] rid ,
        input [31:0] rdata ,
        input [1 :0] rresp ,
        input rlast ,
        input rvalid ,
        output rready ,
                output [3 :0] awid ,
        output [31:0] awaddr ,
        output [3 :0] awlen ,         output [2 :0] awsize ,
        output [1 :0] awburst ,
        output [1 :0] awlock ,
        output [3 :0] awcache ,
        output [2 :0] awprot ,
        output awvalid ,
        input awready ,
                output [3 :0] wid ,
        output [31:0] wdata ,
        output [3 :0] wstrb ,
        output wlast ,
        output wvalid ,
        input wready ,
                input [3 :0] bid ,
        input [1 :0] bresp ,
        input bvalid ,
        output bready ,
                output [31:0] debug_wb_pc,
        output [3:0] debug_wb_rf_wen,
        output [4:0] debug_wb_rf_wnum,
        output [31:0] debug_wb_rf_wdata,
        output [31:0] I_PC_
    );

    wire `INSTR_SET;
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
        wire inst_sram_en;
    wire[3:0] inst_sram_wen;
    wire[31:0] inst_sram_wdata;
    wire[31:0] inst_sram_addr;
    wire[31:0] inst_sram_rdata;
    wire D_stall_Pass;
    assign inst_sram_wen = 4'b0;
    assign inst_sram_wdata = 32'b0;
    assign inst_sram_en = aresetn & ( !D_stall_Pass & !dm_stall );

    wire[31:0] data_sram_rdata;
    wire[31:0] data_sram_wdata;
    wire[31:0] data_sram_addr;
    wire inst_sram_addr_ok;     wire data_sram_addr_ok;     wire data_sram_data_ok;
    wire[3:0] data_sram_wen;

    wire[1:0] data_size;
        assign data_size = (sw | lw) ? 2'b10 :
           (sh | lh | lhu) ? 2'b01 :
           2'b00 ;

    assign wid = awid;

    axi_req req_i;
    axi_resp resp_i;


    wire [3 :0] arid_d ;
    wire [31:0] araddr_d ;
    wire [3 :0] arlen_d ;
    wire [2 :0] arsize_d ;
    wire [1 :0] arburst_d ;
    wire [1 :0] arlock_d ;
    wire [3 :0] arcache_d ;
    wire [2 :0] arprot_d ;
    wire arvalid_d ;
    wire arready_d ;
        wire [3 :0] rid_d ;
    wire [31:0] rdata_d ;
    wire [1 :0] rresp_d ;
    wire rlast_d ;
    wire rvalid_d ;
    wire rready_d ;
        wire [3 :0] awid_d ;
    wire [31:0] awaddr_d ;
    wire [7 :0] awlen_d ;
    wire [2 :0] awsize_d ;
    wire [1 :0] awburst_d ;
    wire [1 :0] awlock_d ;
    wire [3 :0] awcache_d ;
    wire [2 :0] awprot_d ;
    wire awvalid_d ;
    wire awready_d ;
        wire [3 :0] wid_d ;
    wire [31:0] wdata_d ;
    wire [3 :0] wstrb_d ;
    wire wlast_d ;
    wire wvalid_d ;
    wire wready_d ;
        wire [3 :0] bid_d ;
    wire [1 :0] bresp_d ;
    wire bvalid_d ;
    wire bready_d ;

    wire [3 :0] arid_uncache ;
    wire [31:0] araddr_uncache ;
    wire [7 :0] arlen_uncache ;
    wire [2 :0] arsize_uncache ;
    wire [1 :0] arburst_uncache ;
    wire [1 :0] arlock_uncache ;
    wire [3 :0] arcache_uncache ;
    wire [2 :0] arprot_uncache ;
    wire arvalid_uncache ;
    wire arready_uncache ;
        wire [3 :0] rid_uncache ;
    wire [31:0] rdata_uncache ;
    wire [1 :0] rresp_uncache ;
    wire rlast_uncache ;
    wire rvalid_uncache ;
    wire rready_uncache ;
        wire [3 :0] awid_uncache ;
    wire [31:0] awaddr_uncache ;
    wire [3 :0] awlen_uncache ;
    wire [2 :0] awsize_uncache ;
    wire [1 :0] awburst_uncache ;
    wire [1 :0] awlock_uncache ;
    wire [3 :0] awcache_uncache ;
    wire [2 :0] awprot_uncache ;
    wire awvalid_uncache ;
    wire awready_uncache ;
        wire [3 :0] wid_uncache ;
    wire [31:0] wdata_uncache ;
    wire [3 :0] wstrb_uncache ;
    wire wlast_uncache ;
    wire wvalid_uncache ;
    wire wready_uncache ;
        wire [3 :0] bid_uncache ;
    wire [1 :0] bresp_uncache ;
    wire bvalid_uncache ;
    wire bready_uncache ;

        wire inst_uncached ;
    wire icache_stall;

    wire E_now_exp ;
    wire [31:0] rdata_icache;
    
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
    wire axi_arready;
    assign axi_arready = total_uncache ? arready : arready_uncache;

        wire [3 :0] axi_rid;
    assign axi_rid = total_uncache ? rid : rid_uncache;
    wire [31:0] axi_rdata;
    assign axi_rdata = total_uncache ? rdata : rdata_uncache;
    wire [1 :0] axi_rresp;
    assign axi_rresp = total_uncache ? rresp : rresp_uncache;
    wire axi_rlast;
    assign axi_rlast = total_uncache ? rlast : rlast_uncache;
    wire axi_rvalid;
    assign axi_rvalid = total_uncache ? rvalid : rvalid_uncache;
    wire axi_awready;
    assign axi_awready = total_uncache ? awready : awready_uncache;
    wire axi_wready;
    assign axi_wready = total_uncache ? wready : wready_uncache;
        wire [3 :0] axi_bid;
    assign axi_bid = total_uncache ? bid : bid_uncache;
    wire [1 :0] axi_bresp;
    assign axi_bresp = total_uncache ? bresp : bready_uncache;
    wire axi_bvalid;
    assign axi_bvalid = total_uncache ? bvalid : bvalid_uncache;
    cpu_axi_interface cpu_axi_interface(
                          .clk(aclk),
                          .resetn(aresetn ),

                          .inst_req( inst_uncached & inst_sram_en),
                          .inst_wr(|inst_sram_wen),                           .inst_size(2'b10),                           .inst_wdata(inst_sram_wdata),
                          .inst_addr(inst_sram_addr),
                          .inst_rdata(inst_sram_rdata),
                          .inst_addr_ok(inst_sram_addr_ok),
                          .inst_data_ok(inst_sram_data_ok), 
                          .data_req( data_uncached &(read|write) & !E_now_exp ),                           .data_wr(|data_sram_wen) ,                           .data_size(data_size),                           .data_wdata(data_sram_wdata),
                          .data_addr(data_sram_addr),
                          .data_rdata(data_sram_rdata),
                          .data_addr_ok(data_sram_addr_ok),
                          .data_data_ok(data_sram_data_ok), 
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
                                                    .rid(axi_rid),
                          .rdata(axi_rdata),
                          .rresp(axi_rresp),
                          .rlast(axi_rlast),
                          .rvalid(axi_rvalid),
                          .rready(rready_uncache),
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
                                                    .wid(wid_uncache),
                          .wdata(wdata_uncache),
                          .wstrb(wstrb_uncache),
                          .wlast(wlast_uncache),
                          .wvalid(wvalid_uncache),
                          .wready(axi_wready),
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
    assign im_pc = I_PC_Pass;
    I my_i(
                        .clk(Clk),
                        .reset(MyClr),
                        .dmStall(dm_stall),
                        .expFlush(exp_flush),
                        .instSramValid(inst_sram_data_ok),
                        .dStall(D_stall_Pass),
                        .dNpc(D_NewPC_Pass),
                        .instSramData(inst_sram_rdata),
                        .instMiss(inst_exp_miss),
                        .instIllegal(inst_exp_illegal),
                        .instInvalid(inst_exp_invalid),
                        .iPcReg(I_PC),
                        .iPcWire(I_PC_Pass),
                        .iInstr(I_Instr),
                        .iInstMiss(I_inst_miss),
                        .iInstIllegal(I_inst_illegal),
                        .iInstInvalid(I_inst_invalid),
                        .icacheStall(icache_stall),
                        .instUncached(inst_uncached),
                        .iIcacheRdata(rdata_icache),
                        .iNextNotReady(I_nextNotReady)
                                            );

    wire M_WriteRegEnable;
            wire [4:0] D_RsID,D_RtID,D_RdID;
    wire [31:0] D_RsData,D_RtData;
    wire [4:0] D_Shamt;
    wire [15:0] D_Imm16;
    wire [`INSTRBUS_WIDTH-1:0] D_InstrBus;
    wire [31:0] D_PC,M_PC,D_EPC;
    wire [3:0] E_T,D_T;
    wire E_WriteRegEnable,D_WriteRegEnable;
    wire [4:0] E_RegId,D_RegId;

    wire [3:0] M_T;
    wire [4:0] M_RegId;
    wire [31:0] M_Data;

    wire E_XALU_Busy;
    wire D_in_delayslot;

    wire [3:0] M_WriteRegEnableExted;
    D my_d(
                    .Clk(Clk),
                    .Clr(MyClr),
                    .is_mul(my_e.mul_in_xalu),
                    .dm_stall(dm_stall),
                    .exp_flush(exp_flush),
                    .inst_sram_data_ok(inst_sram_data_ok),
                    .W_T(M_T),
                    .W_WriteRegEnable(M_WriteRegEnableExted),
                    .W_RegWriteId(M_RegId),
                    .W_RegWriteData(M_Data),
                    .I_PC_Pass(I_PC_Pass),
                    .I_PC(I_PC),
                    .I_MipsInstr(I_Instr),                    .W_PC(M_PC),
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
                                        .I_nextNotReady(I_nextNotReady),
                                        .exception_new_pc(exception_new_pc)
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
    wire E_EstallClear ; 
    wire E_MemSaveType_Inter ;
    wire E_MemLStype_Inter = E_MemReadEnable_Inter | E_MemSaveType_Inter ;
        E my_e(
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
                     .E_OverFlow(E_OverFlow),                      .E_data_alignment_err(data_alignment_err),
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
                                          .E_now_exp(E_now_exp),
                     .E_calLSaddr(E_DataLSaddr),
                     .E_MemReadEnable_Inter(E_MemReadEnable_Inter),
                     .E_EstallClear(E_EstallClear),
                     .E_MemSaveType_Inter(E_MemSaveType_Inter)
                                      );

    wire fetch_alignment_err;
    assign fetch_alignment_err = E_PC[1:0] != 2'b0;
    wire[31:0] cp0_reg_value;


    assign {`INSTR_SET} = E_InstrBus;

    wire[31:0] M_PC_post, M_Data_post;
    wire[4:0] M_RegId_post;
    wire M_WriteRegEnable_post;

    wire [31:0] rdata_dcache,data2cp0;
    wire not_hit ;

    M my_m(
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

            wire data_exp_miss;
    wire data_exp_illegal;
    wire data_exp_dirty;
    wire data_exp_invalid;

    exception exception(
                                    .flush(exp_flush),
                  .wr_exp(cp0_wr_exp),
                  .clear_exl(clear_exl),
                  .exp_code(exp_code),
                  .epc(exp_epc),
                  .badvaddr(exp_badvaddr),
                  .badvaddr_we(exp_badvaddr_we),
                  .exception_new_pc(exception_new_pc),

                                    .clk(Clk),
                  .E_EPC(E_EPC),
                  .pc(E_PC),
                  .mm_pc(M_PC_post),
                  .data_vaddr(E_Data),                   .data_we(sb | sh | sw),                   .data_miss(data_exp_miss),
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
                  .inst_sram_data_ok(inst_sram_data_ok) ,                  .icache_stall(icache_stall),
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
                        .epc(cp0_epc),
            .allow_int(cp0_allow_int),
            .in_exl(),             .data_o(cp0_reg_value),
            .interrupt_flag(interrupt_flag),
                        .clk(Clk),
            .rst(Clr),
            .rd_addr(E_RdID),             .we(mtc0),             .wr_addr(E_RegId),             .data_i(data2cp0),
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

                                    .icache_close(icache_close),
            .dcache_close(dcache_close),
            .daddr_o(data_sram_addr),
            .iaddr_o(inst_sram_addr),
            .data_uncached(data_uncached),             .inst_uncached(inst_uncached), 
            .data_exp_miss(data_exp_miss),
            .inst_exp_miss(inst_exp_miss),
            .data_exp_illegal(data_exp_illegal),
            .inst_exp_illegal(inst_exp_illegal),
            .data_exp_dirty(data_exp_dirty),
            .data_exp_invalid(data_exp_invalid),
            .inst_exp_invalid(inst_exp_invalid),

                        .daddr_i(E_Data),
            .iaddr_i(im_pc),
            .data_en(E_MemFamily),             .inst_en(1'b1)
        );
    assign data_sram_wen = E_MemWriteEnable;
    assign data_sram_en = aresetn;

    assign debug_wb_pc = M_PC;
    assign debug_wb_rf_wdata = M_Data;
    assign debug_wb_rf_wen = (M_WriteRegEnable & (!dm_stall | E_now_exp ))?4'b1111:4'b0000;
    assign debug_wb_rf_wnum = M_RegId;


    wire rest_out;
    wire rest_out1;
    wire rest_out2;
    wire rest_out3;


        my_dcache dcache(
                  .cache_reset(myaresetn),
                  .reset(Clr) ,
                  .clk(Clk) ,
                                                      .i_p_addr(E_DataLSaddr) ,
                  .i_p_tag_bit_raddr(E_Data[11:5]),
                  .i_p_addrAfterTrans(data_sram_addr) ,
                  .i_p_byte_en(E_MemWriteEnable) ,
                  .i_p_nextIsRead(E_MemReadEnable_Inter) ,
                  .i_p_nextIsLS(E_MemLStype_Inter),
                  .i_p_nextIsSave(E_MmeSaveTypeInter) ,
                  .i_p_read((!data_uncached) &read & !E_now_exp) ,
                  .i_p_write((!data_uncached) &write & !E_now_exp),
                  /*
                  input wire i_p_hitwriteback,
                  input wire i_p_hitinvalidate,
                  */
                  .i_p_wrdata(data_sram_wdata),
                  .o_p_rddata(rdata_dcache),
                  .o_p_stall(not_hit),
                                    .o_p_EstallClear(E_EstallClear),
                  
                  .arid(arid_d),
                  .araddr(araddr_d) ,
                  .arlen(arlen_d) ,
                  .arsize(arsize_d) ,
                  .arburst(arburst_d) ,
                  .arlock(arlock_d) ,
                  .arcache(arcache_d) ,
                  .arprot(arprot_d) ,
                  .arvalid(arvalid_d) ,
                  .arready(arready_d) ,
                                    .rid(rid_d) ,
                  .rdata(rdata_d) ,
                  .rresp(rresp_d) ,
                  .rlast(rlast_d) ,
                  .rvalid (rvalid_d) ,
                  .rready(rready_d) ,
                                    .awid(awid_d) ,
                  .awaddr(awaddr_d) ,
                  .awlen(awlen_d) ,
                  .awsize(awsize_d) ,
                  .awburst(awburst_d) ,
                  .awlock(awlock_d) ,
                  .awcache(awcache_d) ,
                  .awprot(awprot_d) ,
                  .awvalid(awvalid_d) ,
                  .awready(awready_d) ,
                                    .wid(wid_d) ,
                  .wdata(wdata_d) ,
                  .wstrb(wstrb_d) ,
                  .wlast(wlast_d) ,
                  .wvalid(wvalid_d) ,
                  .wready(wready_d) ,
                                    .bid(bid_d) ,
                  .bresp(bresp_d) ,
                  .bvalid(bvalid_d) ,
                  .bready(bready_d)

                  /*
                                    input wire[31:0] spr_bus_addr_i,
                  input spr_bus_we_i,
                  input spr_bus_stb_i,
                  input [OPTION_OPERAND_WIDTH-1:0] spr_bus_dat_i,

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
                                    .dm_stall(dm_stall | D_stall_Pass ),
                                                      .i_p_addr(D_NewPC_Pass),
                  .i_p_tag_bit_raddr(I_PC_Pass[11:5]),
                  .i_p_byte_en(4'b0),
                  .i_p_read((!inst_uncached)& 1'b1 ),
                  .i_p_write(1'b0),
                  .i_p_addrAfterTrans(inst_sram_addr),
                  /*
                  input wire i_p_hitwriteback,
                  input wire i_p_hitinvalidate,
                  */
                  .i_p_wrdata(32'b0),
                  .o_p_rddata(rdata_icache),
                  .o_p_stall(icache_stall),

                  .arid(req_i.arid),
                  .araddr(req_i.araddr) ,
                  .arlen(req_i.arlen) ,
                  .arsize(req_i.arsize) ,
                  .arburst(req_i.arburst) ,
                  .arlock(req_i.arlock) ,
                  .arcache(req_i.arcache) ,
                  .arprot(req_i.arprot) ,
                  .arvalid(req_i.arvalid) ,
                  .arready(resp_i.arready) ,
                                    .rid(resp_i.rid) ,
                  .rdata(resp_i.rdata) ,
                  .rresp(resp_i.rresp) ,
                  .rlast(resp_i.rlast) ,
                  .rvalid (resp_i.rvalid) ,
                  .rready(req_i.rready) ,
                                    .awid(req_i.awid) ,
                  .awaddr(req_i.awaddr) ,
                  .awlen(req_i.awlen) ,
                  .awsize(req_i.awsize) ,
                  .awburst(req_i.awburst) ,
                  .awlock(req_i.awlock) ,
                  .awcache(req_i.awcache) ,
                  .awprot(req_i.awprot) ,
                  .awvalid(req_i.awvalid) ,
                  .awready(resp_i.awready) ,
                                    .wid(req_i.wid) ,
                  .wdata(req_i.wdata) ,
                  .wstrb(req_i.wstrb) ,
                  .wlast(req_i.wlast) ,
                  .wvalid(req_i.wvalid) ,
                  .wready(resp_i.wready) ,
                                    .bid(resp_i.bid) ,
                  .bresp(resp_i.bresp) ,
                  .bvalid(resp_i.bvalid) ,
                  .bready(req_i.bready)

                  /*
                                    input wire[31:0] spr_bus_addr_i,
                  input spr_bus_we_i,
                  input spr_bus_stb_i,
                  input [OPTION_OPERAND_WIDTH-1:0] spr_bus_dat_i,

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
    wire ip_arvalid;
    assign arvalid = total_uncache ? arvalid_uncache : ip_arvalid;
    wire ip_rready;
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
    wire ip_awvalid;
    assign awvalid = total_uncache ? awvalid_uncache : ip_awvalid;
        wire [31:0] ip_wdata;
    assign wdata = total_uncache ? wdata_uncache : ip_wdata;
    wire [3 :0] ip_wstrb;
    assign wstrb = total_uncache ? wstrb_uncache : ip_wstrb;
    wire ip_wlast;
    assign wlast = total_uncache ? wlast_uncache : ip_wlast;
    wire ip_wvalid;
    assign wvalid = total_uncache ? wvalid_uncache : ip_wvalid;
    wire ip_bready;
    assign bready = total_uncache ? bready_uncache : ip_bready;

    axi_interconnect_0 my_axi_extender (
                           .INTERCONNECT_ACLK(Clk),                            .INTERCONNECT_ARESETN(aresetn ),                            .S00_AXI_ARESET_OUT_N(rest_out),                            .S00_AXI_ACLK(Clk),                            .S00_AXI_AWID(1'b0),                            .S00_AXI_AWADDR(req_i.awaddr),                            .S00_AXI_AWLEN({4'b0,req_i.awlen}),                            .S00_AXI_AWSIZE(req_i.awsize),                            .S00_AXI_AWBURST(req_i.awburst),                            .S00_AXI_AWLOCK(req_i.awlock[0]),                            .S00_AXI_AWCACHE(req_i.awcache),                            .S00_AXI_AWPROT(req_i.awprot),                            .S00_AXI_AWQOS(4'b0000),                            .S00_AXI_AWVALID(req_i.awvalid),                            .S00_AXI_AWREADY(resp_i.awready),                            .S00_AXI_WDATA(req_i.wdata),                            .S00_AXI_WSTRB(req_i.wstrb),                            .S00_AXI_WLAST(req_i.wlast),                            .S00_AXI_WVALID(req_i.wvalid),                            .S00_AXI_WREADY(resp_i.wready),                            .S00_AXI_BID(resp_i.bid[0]),                            .S00_AXI_BRESP(resp_i.bresp),                            .S00_AXI_BVALID(resp_i.bvalid),                            .S00_AXI_BREADY(req_i.bready),                            .S00_AXI_ARID(req_i.arid[0]),                            .S00_AXI_ARADDR(req_i.araddr),                            .S00_AXI_ARLEN(req_i.arlen),                            .S00_AXI_ARSIZE(req_i.arsize),                            .S00_AXI_ARBURST(req_i.arburst),                            .S00_AXI_ARLOCK(req_i.arlock[0]),                            .S00_AXI_ARCACHE(req_i.arcache),                            .S00_AXI_ARPROT(req_i.arprot),                            .S00_AXI_ARQOS(4'b0011),                            .S00_AXI_ARVALID(req_i.arvalid),                            .S00_AXI_ARREADY(resp_i.arready),                            .S00_AXI_RID(resp_i.rid),                            .S00_AXI_RDATA(resp_i.rdata),                            .S00_AXI_RRESP(resp_i.rresp),                            .S00_AXI_RLAST(resp_i.rlast),                            .S00_AXI_RVALID(resp_i.rvalid),                            .S00_AXI_RREADY(req_i.rready),                            .S01_AXI_ARESET_OUT_N(rest_out1),                            .S01_AXI_ACLK(Clk),                            .S01_AXI_AWID(1'b0),                            .S01_AXI_AWADDR(awaddr_d),                            .S01_AXI_AWLEN({4'b0,awlen_d}),                            .S01_AXI_AWSIZE(awsize_d),                            .S01_AXI_AWBURST(awburst_d),                            .S01_AXI_AWLOCK(awlock_d[0]),                            .S01_AXI_AWCACHE(awcache_d),                            .S01_AXI_AWPROT(awprot_d),                            .S01_AXI_AWQOS(4'b1100),                            .S01_AXI_AWVALID(awvalid_d),                            .S01_AXI_AWREADY(awready_d),                            .S01_AXI_WDATA(wdata_d),                            .S01_AXI_WSTRB(wstrb_d),                            .S01_AXI_WLAST(wlast_d),                            .S01_AXI_WVALID(wvalid_d),                            .S01_AXI_WREADY(wready_d),                            .S01_AXI_BID(bid_d[0]),                            .S01_AXI_BRESP(bresp_d),                            .S01_AXI_BVALID(bvalid_d),                            .S01_AXI_BREADY(bready_d),                            .S01_AXI_ARID(arid_d[0]),                            .S01_AXI_ARADDR(araddr_d),                            .S01_AXI_ARLEN(arlen_d),                            .S01_AXI_ARSIZE(arsize_d),                            .S01_AXI_ARBURST(arburst_d),                            .S01_AXI_ARLOCK(arlock_d[0]),                            .S01_AXI_ARCACHE(arcache_d),                            .S01_AXI_ARPROT(arprot_d),                            .S01_AXI_ARQOS(4'b1100),                            .S01_AXI_ARVALID(arvalid_d),                            .S01_AXI_ARREADY(arready_d),                            .S01_AXI_RID(rid_d[0]),                            .S01_AXI_RDATA(rdata_d),                            .S01_AXI_RRESP(rresp_d),                            .S01_AXI_RLAST(rlast_d),                            .S01_AXI_RVALID(rvalid_d),                            .S01_AXI_RREADY(rready_d),                            .S02_AXI_ARESET_OUT_N(rest_out3),
                           .S02_AXI_ACLK(Clk),
                           .S02_AXI_AWID(1'b0),                            .S02_AXI_AWADDR(awaddr_uncache),                            .S02_AXI_AWLEN({4'b0,awlen_uncache}),                            .S02_AXI_AWSIZE(awsize_uncache),                            .S02_AXI_AWBURST(awburst_uncache),                            .S02_AXI_AWLOCK(awlock_uncache),                            .S02_AXI_AWCACHE(awcache_uncache),                            .S02_AXI_AWPROT(awprot_uncache),                            .S02_AXI_AWQOS(4'b0000),                            .S02_AXI_AWVALID(awvalid_uncache),                            .S02_AXI_AWREADY(awready_uncache),                            .S02_AXI_WDATA(wdata_uncache),                            .S02_AXI_WSTRB(wstrb_uncache),                            .S02_AXI_WLAST(wlast_uncache),                            .S02_AXI_WVALID(wvalid_uncache),                            .S02_AXI_WREADY(wready_uncache),                            .S02_AXI_BID(bid_uncache[0]),                            .S02_AXI_BRESP(bresp_uncache),                            .S02_AXI_BVALID(bvalid_uncache),                            .S02_AXI_BREADY(bready_uncache),                            .S02_AXI_ARID(arid_uncache),                            .S02_AXI_ARADDR(araddr_uncache),                            .S02_AXI_ARLEN(8'b0),                            .S02_AXI_ARSIZE(arsize_uncache),                            .S02_AXI_ARBURST(arburst_uncache),                            .S02_AXI_ARLOCK(arlock_uncache),                            .S02_AXI_ARCACHE(arcache_uncache),                            .S02_AXI_ARPROT(arprot_uncache),                            .S02_AXI_ARQOS(4'b0011),                            .S02_AXI_ARVALID(arvalid_uncache & !total_uncache ),                            .S02_AXI_ARREADY(arready_uncache),                            .S02_AXI_RID(rid_uncache),                            .S02_AXI_RDATA(rdata_uncache),                            .S02_AXI_RRESP(rresp_uncache),                            .S02_AXI_RLAST(rlast_uncache),                            .S02_AXI_RVALID(rvalid_uncache),                            .S02_AXI_RREADY(rready_uncache),                            .M00_AXI_ARESET_OUT_N(rest_out2),                            .M00_AXI_ACLK(Clk),                            .M00_AXI_AWID(ip_awid),                            .M00_AXI_AWADDR(ip_awaddr),                            .M00_AXI_AWLEN(ip_awlen),                            .M00_AXI_AWSIZE(ip_awsize),                            .M00_AXI_AWBURST(ip_awburst),                            .M00_AXI_AWLOCK(ip_awlock),                            .M00_AXI_AWCACHE(ip_awcache),                            .M00_AXI_AWPROT(ip_awprot),                                                       .M00_AXI_AWVALID(ip_awvalid),                            .M00_AXI_AWREADY(awready),                            .M00_AXI_WDATA(ip_wdata),                            .M00_AXI_WSTRB(ip_wstrb),                            .M00_AXI_WLAST(ip_wlast),                            .M00_AXI_WVALID(ip_wvalid),                            .M00_AXI_WREADY(wready),                            .M00_AXI_BID(bid),                            .M00_AXI_BRESP(bresp),                            .M00_AXI_BVALID(bvalid),                            .M00_AXI_BREADY(ip_bready),                            .M00_AXI_ARID(ip_arid),                            .M00_AXI_ARADDR(ip_araddr),                            .M00_AXI_ARLEN(ip_arlen),                            .M00_AXI_ARSIZE(ip_arsize),                            .M00_AXI_ARBURST(ip_arburst),                            .M00_AXI_ARLOCK(ip_arlock),                            .M00_AXI_ARCACHE(ip_arcache),                            .M00_AXI_ARPROT(ip_arprot),                                                       .M00_AXI_ARVALID(ip_arvalid),                            .M00_AXI_ARREADY(arready),                            .M00_AXI_RID(rid),                            .M00_AXI_RDATA(rdata),                            .M00_AXI_RRESP(rresp),                            .M00_AXI_RLAST(rlast& !total_uncache),                            .M00_AXI_RVALID(rvalid & !total_uncache),                            .M00_AXI_RREADY(ip_rready)                        );

    assign I_PC_=I_PC_Pass;

endmodule
