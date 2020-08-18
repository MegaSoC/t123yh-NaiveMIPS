`include "my_global.vh"
`include "def.svh"

module mycpu_top(
        input [5:0] ext_int, // ext_int[5] is ignored!

        input aclk,
        input aresetn,

        output [3 :0] arid ,
        output [31:0] araddr ,
        output [3 :0] arlen ,
        output [2 :0] arsize ,
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
        output [3 :0] awlen ,
        output [2 :0] awsize ,
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

        (* mark_debug = "true" *) output wire [31:0] debug_wb_pc,
        (* mark_debug = "true" *) output wire [3:0] debug_wb_rf_wen,
        (* mark_debug = "true" *) output wire [4:0] debug_wb_rf_wnum,
        (* mark_debug = "true" *) output wire [31:0] debug_wb_rf_wdata,
        (* mark_debug = "true" *) output [31:0] debug_i_pc,
        (* mark_debug = "true" *) output [31:0] debug_i_instr
    );
    wire [31:0] tlb_reg_daddr,tlb_reg_iaddr_is_dm_stall,tlb_reg_iaddr_not_dm_stall;
    assign debug_i_pc = I_PC;
    assign debug_i_instr = I_Instr;
    wire [31:0] D_origin,E_origin;
    wire D_trap,E_trap;
    wire salu_busy_real;

    wire `INSTR_SET;
    wire dm_stall;
    wire Clk = aclk;
    wire reset = ! aresetn;

    reg myaresetn ;
    reg [6:0] resetCounter ;
    always_ff @(posedge Clk) begin
        if(!aresetn) begin
            myaresetn <=1'b0;
            resetCounter <=7'b0;
        end
        if(aresetn & !myaresetn) begin
            resetCounter <= resetCounter +1;
        end
        if(aresetn & !myaresetn & (&resetCounter))begin
            myaresetn <=1'b1;
        end
    end
    wire Myreset = !aresetn | !myaresetn ;
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
    wire inst_sram_addr_ok; 
    wire data_sram_addr_ok; 
    wire data_sram_data_ok;
    wire[3:0] data_sram_wen;

    wire[2:0] data_size;
    assign data_size = ((SC|sw) | (LL|lw|lwl|lwr)) ? 3'b010 :
           (sh | lh | lhu) ? 3'b001 :
           3'b000 ;

    assign wid = awid;




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

    wire E_CurrentException ;
    wire [31:0] rdata_icache;

    wire data_uncached ;

    wire [1:0] data_test = {data_uncached, |data_sram_wen};

    wire total_uncache;
    reg icache_close;
    wire dcache_close;
    wire inst_sram_data_ok;
    reg[3:0] cache_timer;
    wire [31:0] E_SC_data;
    always_ff @(posedge aclk) begin
        if (Myreset) begin
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


    wire [31:0] I_PC,I_Instr;
    wire [31:0] D_NewPC_Pass,I_PC_Pass;
    wire [31:0] E_Data;
    wire E_MemFamily;
    wire [31:0] im_pc;


    wire ExceptionFlush;
    wire ExceptionFlush;


    wire[31:0] NewExceptionPC;
    wire I_nextNotReady;

    wire inst_exp_miss;
    wire inst_exp_illegal;
    wire inst_exp_invalid;
    assign im_pc = I_PC_Pass;
    I my_i(
          .clk(Clk),
          .reset(Myreset),
          .dmStall(dm_stall),
          .expFlush(ExceptionFlush),
          .instSramValid(inst_sram_data_ok),
          .dStall(D_stall_Pass),
          .dNpc(D_NewPC_Pass),
          .instSramData(inst_sram_rdata),
          .instMiss(inst_exp_miss),
          .instIllegal(inst_exp_illegal),
          .instInvalid(inst_exp_invalid),
          .iPcReg(I_PC),
          .tlb_reg_iaddr_is_dm_stall(tlb_reg_iaddr_is_dm_stall),
          .tlb_reg_iaddr_not_dm_stall(tlb_reg_iaddr_not_dm_stall),
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
    wire [4:0] RsNumber_D,RtNumber_D,D_RdID;
    wire [31:0] D_RsData,D_RtData;
    wire [4:0] D_Shamt;
    wire [15:0] D_Imm16;
    wire [2:0] D_Sel;
    wire [`INSTRBUS_WIDTH-1:0] D_InstrBus;
    wire [31:0] D_PC,M_PC,D_EPC;
    wire [3:0] E_T,D_T;
    wire E_RegWriteEnable,D_WriteRegEnable;
    wire [4:0] E_RegNumber,D_RegId;

    wire [3:0] M_T;
    wire [4:0] M_RegId;
    wire [31:0] M_Data;

    wire E_XALU_Busy;
    wire D_InDelaySlot;
    (* mark_debug = "true" *) wire D_clear_exl;
    (* mark_debug = "true" *) wire E_clear_exl;

    wire [3:0] M_WriteRegEnableExted;
    D my_d(
          .Clk(Clk),
          .reset(Myreset),
          .is_mul(my_e.mul_in_xalu),
          .dm_stall(dm_stall),
          .ExceptionFlush(ExceptionFlush),
          .inst_sram_data_ok(inst_sram_data_ok),
          .W_T(M_T),
          .D_origin(D_origin),
          .W_WriteRegEnable(M_WriteRegEnableExted),
          .W_RegWriteId(M_RegId),
          .W_RegWriteData(M_Data),
          .I_PC_Pass(I_PC_Pass),
          .I_PC(I_PC),
          .I_MipsInstr(I_Instr),
          .W_PC(M_PC),
          .D_NewPC_Pass(D_NewPC_Pass),
          .D_PC(D_PC),
          .D_EPC(D_EPC),
          .RsNumber_D(RsNumber_D),
          .RtNumber_D(RtNumber_D),
          .D_RdID(D_RdID),
          .D_RsData(D_RsData),
          .D_RtData(D_RtData),
          .D_Shamt(D_Shamt),
          .D_Imm16(D_Imm16),
          .D_Sel(D_Sel),
          .D_InstrBus(D_InstrBus),
          .E_T(E_T),
          .E_RegWriteEnable(E_RegWriteEnable),
          .E_RegNumber(E_RegNumber),
          .E_Data(E_SC_data),
          .D_T(D_T),
          .D_WriteRegEnable(D_WriteRegEnable),
          .D_RegId(D_RegId),
          .D_stall_Pass(D_stall_Pass),
          .E_XALU_Busy(E_XALU_Busy),
          .D_InDelaySlot(D_InDelaySlot),
          .salu_busy_real(salu_busy_real),
          .D_clear_exl(D_clear_exl),

          .I_inst_miss(I_inst_miss),
          .I_inst_illegal(I_inst_illegal),
          .I_inst_invalid(I_inst_invalid),
          .D_InstMiss(D_InstMiss),
          .D_IllegalInstruction(D_IllegalInstruction),
          .D_InvalidInstruction(D_InvalidInstruction),
          .D_trap(D_trap),
          .I_nextNotReady(I_nextNotReady),
          .NewExceptionPC(NewExceptionPC)
      );

    wire [31:0] E_PC, E_EPC;
    wire [31:0] E_WriteMemData;
    wire [4:0] E_RtID,E_RdID;
    wire [2:0] E_Sel;
    wire [3:0] E_MemWriteEnable;
    wire [8:0] E_ExtType;
    wire [`INSTRBUS_WIDTH-1:0] E_InstrBus;
    wire E_OverFlow;
    wire data_alignment_err;
    wire [31:0] E_calLSaddr_not_dm_stall,E_calLSaddr_is_dm_stall;
    wire E_MemReadEnable_Inter;
    wire E_EstallClear ;
    assign E_EstallClear = 0;
    wire E_MemSaveType_Inter ;
    wire E_MemLStype_Inter = E_MemReadEnable_Inter | E_MemSaveType_Inter ;

    wire D_dcache_read,D_dcache_write;
    E my_e(
          .Clk(Clk),
          .reset(Myreset),
          .ExceptionFlush(ExceptionFlush),
          .data_sram_data_ok(data_sram_data_ok),
          .D_PC(D_PC),
          .D_EPC(D_EPC),
          .RsNumber_D(RsNumber_D),
          .RtNumber_D(RtNumber_D),
          .D_RdID(D_RdID),
          .D_RsData(D_RsData),
          .D_RtData(D_RtData),
          .D_Shamt(D_Shamt),
          .D_Imm16(D_Imm16),
          .D_origin(D_origin),
          .E_origin(E_origin),
          .D_Sel(D_Sel),
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
          .E_Sel(E_Sel),
          .E_T(E_T),
          .E_RegWriteEnable(E_RegWriteEnable),
          .E_RegNumber(E_RegNumber),
          .E_Data(E_Data),
          .tlb_reg_daddr(tlb_reg_daddr),
          .E_ExtType(E_ExtType),
          .E_MemWriteEnable(E_MemWriteEnable),
          .E_MemFamily(E_MemFamily),
          .E_InstrBus(E_InstrBus),
          .E_OverFlow(E_OverFlow),
          .E_DataUnaligned(data_alignment_err),
          .dm_stall(dm_stall),
          .E_XALU_Busy_real(E_XALU_Busy),
          .D_InDelaySlot(D_InDelaySlot),
          .E_in_delayslot(E_in_delayslot),
          .salu_busy_real(salu_busy_real),
          .E_SC_data(E_SC_data),
          .D_read(D_dcache_read),
          .D_write(D_dcache_write),
          .D_clear_exl(D_clear_exl),

          .D_InstMiss(D_InstMiss),
          .D_IllegalInstruction(D_IllegalInstruction),
          .D_InvalidInstruction(D_InvalidInstruction),
          .E_InstMiss(E_InstMiss),
          .E_IllegalInstruction(E_IllegalInstruction),
          .E_InvalidInstruction(E_InvalidInstruction),
          .D_trap(D_trap),
          .E_trap(E_trap),
          .E_clear_exl(E_clear_exl),

          .E_CurrentException(E_CurrentException),
          .E_calLSaddr_is_dm_stall(E_calLSaddr_is_dm_stall),
          .E_calLSaddr_not_dm_stall(E_calLSaddr_not_dm_stall),
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
          .reset(Myreset),
          .dm_stall(dm_stall),
          .ExceptionFlush(ExceptionFlush),
          .E_PC(E_PC),
          .E_MemWriteData(E_WriteMemData),
          .E_RtID(E_RtID),
          .E_SC_data(E_SC_data),
          .E_Data(E_Data),
          .E_ExtType(E_ExtType),
          .E_MemWriteEnable(E_MemWriteEnable),
          .E_RegWriteEnable(E_RegWriteEnable),
          .E_RegNumber(E_RegNumber),
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
    assign M_PC = ExceptionFlush ? 32'h0 : M_PC_post;
    assign M_Data = ExceptionFlush ? 32'h0 : M_Data_post;
    assign M_RegId = ExceptionFlush ? 5'h0 : M_RegId_post;
    assign M_WriteRegEnable = ExceptionFlush ? 1'b0 : M_WriteRegEnable_post;


    wire unknown_inst;
    assign unknown_inst = E_InstrBus == 0;

    wire[31:0] cp0_epc;
    wire cp0_allow_int;
    wire[31:0] exp_badvaddr, exp_epc;
    wire exp_badvaddr_we;
    wire[4:0] ExcCode;
    wire clear_exl;
    wire[7:0] interrupt_flag;
    wire cp0_CP0_WrExp;

    wire data_exp_miss;
    wire data_exp_illegal;
    wire data_exp_dirty;
    wire data_exp_invalid;

    wire SR_BEV, SR_EXL, CAUSE_IV;
    wire [31:0] ebase;

    exception exception(
                  .flush(ExceptionFlush),
                  .CP0_WrExp(cp0_CP0_WrExp),
                  .clear_exl(clear_exl),
                  .ExcCode(ExcCode),
                  .epc(exp_epc),
                  .badvaddr(exp_badvaddr),
                  .badvaddr_we(exp_badvaddr_we),
                  .NewExceptionPC(NewExceptionPC),

                  .clk(Clk),
                  .reset(reset),
                  .E_EPC(E_EPC),
                  .pc(E_PC),
                  .mm_pc(M_PC_post),
                  .data_vaddr(E_Data),
                  .data_we(sb | sh | (SC|sw)),
                  .DataMiss(data_exp_miss),
                  .InstMiss(E_InstMiss),
                  .IllegalData(data_exp_illegal | data_alignment_err),
                  .IllegalInst(E_IllegalInstruction | fetch_alignment_err),
                  .data_invalid(data_exp_invalid),
                  .inst_invalid(E_InvalidInstruction),
                  .DirtyData(data_exp_dirty),

                  .eret(eret),
                  .my_break(my_break),
                  .syscall(syscall),
                  .unknown_inst(unknown_inst),
                  .in_delayslot(E_in_delayslot),
                  .overflow(E_OverFlow),
                  .epc_in(cp0_epc),
                  .allow_int(cp0_allow_int),
                  .interrupt_flag(interrupt_flag),
                  .inst_sram_data_ok(inst_sram_data_ok),
                  .icache_stall(icache_stall),
                  .E_CurrentException(E_CurrentException),
                  .inst_uncached(inst_uncached),
                  .SR_BEV(SR_BEV),
                  .SR_EXL(SR_EXL),
                  .CAUSE_IV(CAUSE_IV),
                  .ebase(ebase),
                  .trap(E_trap)
              );

    reg[4:0] hardware_int_sample;

    always_ff @(posedge Clk) begin
        if (reset) begin
            hardware_int_sample <= 5'b0;
        end else begin
            hardware_int_sample <= ext_int[4:0];
        end
    end

    cp0 cp0(
            .epc(cp0_epc),
            .allow_int(cp0_allow_int),
            .data_o(cp0_reg_value),
            .interrupt_flag(interrupt_flag),

            .clk(Clk),
            .rst(reset),
            .rd_addr(E_RdID),
            .wr_addr(E_RegNumber),
            .we(mtc0),
            .sel(E_Sel),
            .data_i(data2cp0),
            .hardware_int(hardware_int_sample),
            .clear_exl(E_clear_exl),
            .en_exp_i(cp0_CP0_WrExp),
            .exp_bd(E_in_delayslot),
            .exp_epc(exp_epc),
            .ExcCode(ExcCode),
            .exp_badvaddr(exp_badvaddr),
            .exp_badvaddr_we(exp_badvaddr_we),
            .tlbwi(tlbwi),
            .tlbwr(tlbwr),
            .tlbr(tlbr),
            .tlbp(tlbp),
            .o_p_EstallClear(E_EstallClear),

            .SR_BEV(SR_BEV),
            .SR_EXL(SR_EXL),
            .CAUSE_IV(CAUSE_IV),
            .ebase(ebase),

            .icache_close(icache_close),
            .dcache_close(dcache_close),
            .daddr_o(data_sram_addr),
            .iaddr_o(inst_sram_addr),
            .data_uncached(data_uncached),
            .inst_uncached(inst_uncached),
            .data_exp_miss(data_exp_miss),
            .inst_exp_miss(inst_exp_miss),
            .data_exp_illegal(data_exp_illegal),
            .inst_exp_illegal(inst_exp_illegal),
            .data_exp_dirty(data_exp_dirty),
            .data_exp_invalid(data_exp_invalid),
            .inst_exp_invalid(inst_exp_invalid),

            .daddr_i(E_Data),
            .iaddr_i(im_pc),
            .data_en(E_MemFamily),
            .inst_en(1'b1),

            .daddr_i_tlb_not_dm_stall(E_calLSaddr_not_dm_stall),
            .daddr_i_tlb_is_dm_stall(E_calLSaddr_is_dm_stall),
            .dm_stall(dm_stall),
            .I_nextnotready(I_nextNotReady),
            .iaddr_i_tlb_is_dm_stall(tlb_reg_iaddr_is_dm_stall),
            .iaddr_i_tlb_not_dm_stall(tlb_reg_iaddr_not_dm_stall)
        );
    assign data_sram_wen = E_MemWriteEnable;
    assign data_sram_en = aresetn;

    assign debug_wb_pc = M_PC;
    assign debug_wb_rf_wdata = M_Data;
    assign debug_wb_rf_wen = (M_WriteRegEnable & (!dm_stall | E_CurrentException ))?4'b1111:4'b0000;
    assign debug_wb_rf_wnum = M_RegId;


    wire rest_out;
    wire rest_out1;
    wire rest_out2;
    wire rest_out3;

    word w_dcache_instr_addr, w_icache_instr_addr;
    logic [`ICACHE_TAG_WIDTH - 1 : 0] w_icache_instr_tag;
    logic [`DCACHE_TAG_WIDTH - 1 : 0] w_dcache_instr_tag;
    logic [1:0]  w_icache_instr, w_dcache_instr;

    wire `INSTR_SET;
    assign {`INSTR_SET} = E_InstrBus;

    cache_op icache_op, dcache_op;

    always_comb begin
        icache_op = CACHE_NOP;
        dcache_op = CACHE_NOP;
        if(CACHE && E_origin[17:16] == 2'b00)begin
            case(E_origin[20:18]):
                3'b000:begin
                    icache_op = CACHE_INDEX_WRITEBACK_INVALIDATE;
                end
                3'b010:begin
                    icache_op = CACHE_INDEX_STORE_TAG;
                end
                3'b100:begin
                    icache_op = CACHE_HIT_INVALIDATE;
                end
            endcase
        end
        if(CACHE && E_origin[17:16] == 2'b01)begin
            case(E_origin[20:18]):
                3'b000:begin
                    dcache_op = CACHE_INDEX_WRITEBACK_INVALIDATE;
                end
                3'b010:begin
                    dcache_op = CACHE_INDEX_STORE_TAG;
                end
                3'b100:begin
                    dcache_op = CACHE_HIT_INVALIDATE;
                end
                3'b101:begin
                    dcache_op = CACHE_HIT_WRITEBACK_INVALIDATE;
                end
            endcase
        end
    end


     cache_soc 
   #(
       .ICACHE_WORD_PER_LINE(`ICACHE_WORD_PER_LINE),
       .ICACHE_SET_ASSOC(`ICACHE_SET_ASSOC),
       .ICACHE_SIZE(`ICACHE_SIZE),
       .ICACHE_TAG_WIDTH(`ICACHE_TAG_WIDTH),
       .DCACHE_LINE_WORD_NUM(`DCACHE_WORD_PER_LINE),
       .DCACHE_SET_ASSOC(`DCACHE_SET_ASSOC),
       .DCACHE_SIZE(`DCACHE_SIZE),
       .DCACHE_TAG_WIDTH(`DCACHE_TAG_WIDTH),
       .MEM_WRITE_FIFO_DEPTH(`MEM_WRITE_FIFO_DEPTH)
   )
    cache_soc(
                  .i_clk(Clk),
                  .i_rst(reset||!myaresetn),

                  .i_icache_npc(D_NewPC_Pass),
                  .i_icache_phyaddr(inst_sram_addr),
                  .i_icache_valid1(!dm_stall && !D_stall_Pass),
                  .i_icache_valid2(!inst_uncached),
                  .o_icache_inst(rdata_icache),
                  .o_i_stall(icache_stall),

                  .i_isram_addr(inst_sram_addr),
                  .i_isram_valid(inst_uncached & inst_sram_en),
                  .o_isram_valid(inst_sram_data_ok),
                  .o_isram_inst(inst_sram_rdata),

                  .i_dcache_va(dm_stall ? E_calLSaddr_is_dm_stall : E_calLSaddr_not_dm_stall),
                  .i_dcache_phyaddr(data_sram_addr),
                  .i_dcache_byteen(E_MemWriteEnable),
                  .i_dcache_read((!data_uncached) &read & !E_CurrentException),
                  .i_dcache_write((!data_uncached) &write & !E_CurrentException),
                  .i_dcache_indata(data_sram_wdata),
                  .i_dcache_outdata(rdata_dcache),
                  .o_d_stall(not_hit),

                  .i_dsram_addr(data_sram_addr),
                  .i_dsram_read(data_uncached &read & !E_CurrentException ),
                  .i_dsram_write(data_uncached &write & !E_CurrentException ),
                  .i_dsram_byteen(data_sram_wen),
                  .i_dsram_size(data_size),
                  .i_dsram_indata(data_sram_wdata),
                  .o_dsram_outdata(data_sram_rdata),
                  .o_dsram_valid(data_sram_data_ok),

                  .i_dcache_instr_tag(cp0.cp0_reg_TagLo0[31:(32 - `DCACHE_TAG_WIDTH)]),
	              .i_dcache_instr(icache_op),
                  .i_dcache_instr_addr(E_Data), 
                
                  .i_icache_instr(dcache_op),
	              .i_icache_instr_addr(E_Data),
                  .i_icache_instr_tag(cp0.cp0_reg_TagLo0[31:(32 - `ICACHE_TAG_WIDTH)]),

                  .arid,
                  .araddr,
                  .arlen,
                  .arsize,
                  .arburst,
                  .arlock,
                  .arcache,
                  .arprot,
                  .arvalid,
                  .arready,

                  .rid,
                  .rdata,
                  .rresp,
                  .rlast,
                  .rvalid,
                  .rready,

                  .awid,
                  .awaddr,
                  .awlen,
                  .awsize,
                  .awburst,
                  .awlock,
                  .awcache,
                  .awprot,
                  .awvalid,
                  .awready,

                  .wid,
                  .wdata,
                  .wstrb,
                  .wlast,
                  .wvalid,
                  .wready,

                  .bid,
                  .bresp,
                  .bvalid,
                  .bready

    );

endmodule
