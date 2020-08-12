`include "my_global.vh"

module cp0(
        input wire clk,
        input wire rst,

        input wire [4:0]    rd_addr,
        input wire [4:0]    wr_addr,
        input wire          we,
        input wire [2:0]    sel,
        input wire [31:0]   data_i,
        input wire o_p_EstallClear,

        input wire [5:0]    hardware_int,
        input wire          clear_exl,
        input wire          en_exp_i,
        input wire          exp_bd,
        input wire [31:0]   exp_epc,
        input wire [4:0]    ExcCode,
        input wire [31:0]   exp_badvaddr,
        input wire          exp_badvaddr_we,
        input wire          tlbwi,
        input wire          tlbwr,
        input wire          tlbr,
        input wire          tlbp,

        output wire         SR_BEV,
        output wire         SR_EXL,
        output wire [31:0]  ebase,

        output wire         allow_int,

        output wire [31:0]  epc,
        output reg  [31:0]  data_o,
        output wire [7:0]   interrupt_flag,

        input wire  [31:0]  daddr_i,
        input wire  [31:0]  iaddr_i,
        input wire          data_en,
        input wire          inst_en,

        input wire  [31:0]  daddr_i_tlb_is_dm_stall,
        input wire  [31:0]  daddr_i_tlb_not_dm_stall,
        input wire          dm_stall,
        input wire  [31:0]  iaddr_i_tlb_is_dm_stall,
        input wire  [31:0]  iaddr_i_tlb_not_dm_stall,
        input wire          I_nextnotready,

        output wire [31:0]  daddr_o,
        output wire [31:0]  iaddr_o,

        output wire data_uncached,
        output wire inst_uncached,
        output wire data_exp_miss,
        output wire inst_exp_miss,
        output wire data_exp_illegal,
        output wire inst_exp_illegal,
        output wire data_exp_dirty,
        output wire data_exp_invalid,
        output wire inst_exp_invalid,
        input  wire icache_close,
        output reg  dcache_close
    );

    reg [31:0] cp0_reg_Index    ;   // 0
    reg [31:0] cp0_reg_Random   ;   // 1
    reg [31:0] cp0_reg_EntryLo0 ;   // 2
    reg [31:0] cp0_reg_EntryLo1 ;   // 3
    reg [31:0] cp0_reg_Context  ;   // 4
    reg [31:0] cp0_reg_PageMask ;   // 5
    reg [31:0] cp0_reg_Wired    ;   // 6
    reg [31:0] cp0_reg_BadVAddr ;   // 8
    reg [31:0] cp0_reg_Count    ;   // 9
    reg [31:0] cp0_reg_EntryHi  ;   // 10
    reg [31:0] cp0_reg_Compare  ;   // 11
    reg [31:0] cp0_reg_Status   ;   // 12
    reg [31:0] cp0_reg_Cause    ;   // 13
    reg [31:0] cp0_reg_EPC      ;   // 14
    reg [31:0] cp0_reg_PRId     ;   // 15.0
    reg [31:0] cp0_reg_EBase    ;   // 15.1
    reg [31:0] cp0_reg_Conf0    ;   // 16.0
    reg [31:0] cp0_reg_Conf1    ;   // 16.1
    reg [31:0] cp0_reg_TagLo0   ;   // 28.0
    reg [31:0] cp0_reg_TagHi0   ;   // 29.0

    wire [8:0] raddr = {rd_addr, sel};
    wire [8:0] waddr = {wr_addr, sel};

    reg timer_int;
    wire [7:0] Cause_IP = {hardware_int, cp0_reg_Cause[9:8]};
    assign allow_int = cp0_reg_Status[2:0] == 3'b001 & !en_exp_i;
    assign interrupt_flag = cp0_reg_Status[15:8] & Cause_IP;
    assign epc       = cp0_reg_EPC;

    assign SR_BEV = cp0_reg_Status[22];
    assign SR_EXL = cp0_reg_Status[1];
    assign ebase  = cp0_reg_EBase;


    // TLB related
    wire [4:0] index_w = tlbwr ? cp0_reg_Random[4:0] : cp0_reg_Index[4:0];
    wire [4:0] index_probe_r;
    wire [11:0] mask_r;
    wire [31:0] entryhi_r, entrylo0_r, entrylo1_r;
    wire [`TLB_IDX_BITS-1:0] nRandom = cp0_reg_Random[`TLB_IDX_BITS-1:0] + 1'b1;
    //read
    assign data_o = ({32{raddr == `CP0_Index    }} & cp0_reg_Index    ) |
                    ({32{raddr == `CP0_Random   }} & cp0_reg_Random   ) |
                    ({32{raddr == `CP0_EntryLo0 }} & cp0_reg_EntryLo0 ) |
                    ({32{raddr == `CP0_EntryLo1 }} & cp0_reg_EntryLo1 ) |
                    ({32{raddr == `CP0_Context  }} & cp0_reg_Context  ) |
                    ({32{raddr == `CP0_PageMask }} & cp0_reg_PageMask ) |
                    ({32{raddr == `CP0_Wired    }} & cp0_reg_Wired    ) |
                    ({32{raddr == `CP0_BadVAddr }} & cp0_reg_BadVAddr ) |
                    ({32{raddr == `CP0_Count    }} & cp0_reg_Count    ) |
                    ({32{raddr == `CP0_EntryHi  }} & cp0_reg_EntryHi  ) |
                    ({32{raddr == `CP0_Compare  }} & cp0_reg_Compare  ) |
                    ({32{raddr == `CP0_Status   }} & cp0_reg_Status   ) |
                    ({32{raddr == `CP0_Cause    }} & cp0_reg_Cause    ) |
                    ({32{raddr == `CP0_EPC      }} & cp0_reg_EPC      ) |
                    ({32{raddr == `CP0_PRId     }} & cp0_reg_PRId     ) |
                    ({32{raddr == `CP0_EBase    }} & cp0_reg_EBase    ) |
                    ({32{raddr == `CP0_Conf0    }} & cp0_reg_Conf0    ) | 
                    ({32{raddr == `CP0_Conf1    }} & cp0_reg_Conf1    ) |  
                    ({32{raddr == `CP0_TagLo0	}} & cp0_reg_TagLo0   ) |
                    ({32{raddr == `CP0_TagHi0   }} & cp0_reg_TagHi0   ) ;

    reg count_add;
    always_ff @(posedge clk) begin
        if (rst) begin
            cp0_reg_Index    <= 32'b0;
            cp0_reg_Random   <= `INIT_Random;
            cp0_reg_EntryLo0 <= 32'b0;
            cp0_reg_EntryLo1 <= 32'b0;
            cp0_reg_Context  <= 32'b0;
            cp0_reg_PageMask <= `INIT_PAGEMASKK;
            cp0_reg_Wired    <= 32'b0;
            cp0_reg_BadVAddr <= 32'b0;
            cp0_reg_Count    <= 32'b0;
            cp0_reg_EntryHi  <= 32'b0;
            cp0_reg_Compare  <= 32'b0;
            cp0_reg_Status   <= `INIT_STATUS;
            cp0_reg_Cause    <= 32'b0;
            cp0_reg_EPC      <= 32'b0;
            cp0_reg_PRId     <= `INIT_PRID;
            cp0_reg_EBase    <= `INIT_EBASE;
            cp0_reg_Conf0    <= `INIT_CONF0;
            cp0_reg_Conf1    <= `INIT_CONF1;
            cp0_reg_TagLo0   <= 32'b0;
            cp0_reg_TagHi0   <= 32'b0;
            dcache_close     <= 0;
            count_add        <= 1'b0;
        end
        else begin
            cp0_reg_Cause[30] <= timer_int; 
            count_add     <= ~count_add;
            cp0_reg_Count <= cp0_reg_Count + {31'd0, count_add};
            if (cp0_reg_Compare == cp0_reg_Count) begin
                timer_int         <= 1'b1;
                cp0_reg_Cause[30] <= 1'b1;
            end
            if (we) begin
                case(waddr)
                    `CP0_Index: begin
                        cp0_reg_Index[`TLB_IDX_BITS-1:0] <= data_i[`TLB_IDX_BITS-1:0];
                    end
                    `CP0_EntryLo0: begin
                        cp0_reg_EntryLo0[25:0]           <= data_i[25:0]; 
                    end
                    `CP0_EntryLo1: begin
                        cp0_reg_EntryLo1[25:0]           <= data_i[25:0]; 
                    end
                    `CP0_Context: begin
                        cp0_reg_Context[31:23]           <= data_i[31:23];
                    end
                    `CP0_PageMask: begin
                        cp0_reg_PageMask[28:13]          <= data_i[28:13]; 
                    end
                    `CP0_Wired: begin
                        cp0_reg_Wired[`TLB_IDX_BITS-1:0] <= data_i[`TLB_IDX_BITS-1:0]; 
                        cp0_reg_Random[`TLB_IDX_BITS-1:0] <= `INIT_Random;
                    end
                    `CP0_Count: begin
                        cp0_reg_Count                    <= data_i;
                    end
                    `CP0_EntryHi: begin
                        cp0_reg_EntryHi[31:13]           <= data_i[31:13];
                        cp0_reg_EntryHi[7:0]             <= data_i[7:0];
                    end
                    `CP0_Compare: begin
                        cp0_reg_Compare                  <= data_i;
                        timer_int                        <= (data_i == cp0_reg_Count);
                        cp0_reg_Cause[30]                <= (data_i == cp0_reg_Count);
                    end
                    `CP0_Status: begin
                        cp0_reg_Status[28]               <= data_i[28];
                        cp0_reg_Status[22]               <= data_i[22];
                        cp0_reg_Status[15:8]             <= data_i[15:8];
                        cp0_reg_Status[4]                <= data_i[4];
                        cp0_reg_Status[1:0]              <= data_i[1:0];
                    end
                    `CP0_Cause: begin
                        cp0_reg_Cause[23]                <= data_i[23];
                        cp0_reg_Cause[9:8]               <= data_i[9:8];
                    end
                    `CP0_EPC: begin
                        cp0_reg_EPC                      <= data_i;
                    end
                    `CP0_EBase: begin
                        cp0_reg_EBase[29:12]             <= data_i[29:12];
                    end
                    `CP0_Conf0: begin
                        cp0_reg_Conf0[2:0]               <= data_i[2:0];
                    end
                    22 : begin
                        dcache_close <= 1;
                    end
                    default: begin
                        $display("unkown cp0 register number %d", wr_addr);
                    end
                endcase
            end
            else begin
                if (tlbr) begin
                    cp0_reg_EntryHi  <= entryhi_r;
                    cp0_reg_EntryLo0 <= entrylo0_r;
                    cp0_reg_EntryLo1 <= entrylo1_r;
                    cp0_reg_PageMask[28:13] <= mask_r;
                end
                if (tlbp) begin
                    cp0_reg_Index <= index_probe_r;
                end
                if (tlbwr) begin
                    cp0_reg_Random <= nRandom < cp0_reg_Wired ? cp0_reg_Wired : nRandom;
                end
                if (en_exp_i) begin
                    if (exp_badvaddr_we) begin
                        cp0_reg_BadVAddr      <= exp_badvaddr;
                        cp0_reg_Context[22:4] <= exp_badvaddr[31:13];
                        cp0_reg_EntryHi[31:13] <= exp_badvaddr[31:13]; 
                    end
                    cp0_reg_Cause[31]      <= exp_bd; 
                    cp0_reg_Cause[6:2]     <= ExcCode;
                    cp0_reg_EPC            <= exp_epc;
                    cp0_reg_Status[1]      <= 1'b1; 
                end
                if (clear_exl) begin
                    cp0_reg_Status[1] <= 1'b0;
                end
            end
        end
    end

    wire [31:0] iaddr_direct;
    wire [31:0] daddr_direct;
    wire [31:0] daddr_tlb;
    wire [31:0] iaddr_tlb;
    wire [2 :0] inst_c, data_c;
    wire data_tlb_map, inst_tlb_map, data_mmu_uncached, inst_mmu_uncached,
         DataMiss, InstMiss, data_dirt, data_valid, inst_valid;
    assign daddr_o          = data_tlb_map ? daddr_tlb : daddr_direct;
    assign iaddr_o          = inst_tlb_map ? iaddr_tlb : iaddr_direct;
    assign data_uncached    = data_mmu_uncached | icache_close | dcache_close;
    assign inst_uncached    = inst_mmu_uncached | icache_close | dcache_close;
    assign data_exp_miss    = data_tlb_map & DataMiss;
    assign inst_exp_miss    = inst_tlb_map & InstMiss;
    assign data_exp_dirty   = (data_dirt & data_tlb_map);
    assign data_exp_invalid = (~data_valid & data_tlb_map);
    assign inst_exp_invalid = (~inst_valid & inst_tlb_map);

    mmu mmu(
        .daddr_o(daddr_direct),
        .iaddr_o(iaddr_direct),
        .data_uncached(data_mmu_uncached),
        .inst_uncached(inst_mmu_uncached),
        .data_tlb_map(data_tlb_map),
        .inst_tlb_map(inst_tlb_map),
        .IllegalData(data_exp_illegal),
        .IllegalInst(inst_exp_illegal),

        .clk(clk),
        .rst(rst),
        .daddr_i(daddr_i),
        .iaddr_i(iaddr_i),
        .data_en(data_en),
        .inst_en(inst_en),
        .data_c(data_c),
        .inst_c(inst_c),
        .user_mode(0),
        .cp0_kseg0_uncached(~cp0_reg_Conf0[0])
    ); 
    
    // TLB
    TLB TLB(
        .clk(clk),
        .rst(rst),
        .o_p_EstallClear(o_p_EstallClear),
        .we(tlbwi || tlbwr),        //1:TLBWI | TLBWR
        .index_i(index_w), 	      
        .mask_i(cp0_reg_PageMask[28:13]),        
        .entryhi_i(cp0_reg_EntryHi),
        .entrylo0_i(cp0_reg_EntryLo0),
        .entrylo1_i(cp0_reg_EntryLo1),
        .mask_o(mask_r),    
        .entryhi_o(entryhi_r),
        .entrylo0_o(entrylo0_r),
        .entrylo1_o(entrylo1_r),
        .probe_index_o(index_probe_r),
        .va0(iaddr_i_tlb_is_dm_stall),
        .va0_bak(iaddr_i_tlb_not_dm_stall),
        .va0_choice(I_nextnotready),
        .pa0(iaddr_tlb),
        .exp_bus0({InstMiss, inst_valid}), //{miss, valid}; 
        .c_com0(inst_c),
        .va1(daddr_i_tlb_is_dm_stall),
        .va1_bak(daddr_i_tlb_not_dm_stall),
        .va1_choice(dm_stall),
        .pa1(daddr_tlb),
        .exp_bus1({DataMiss, data_valid, data_dirt}),  //{miss, valid, dirty};
        .c_com1(data_c)
    );
    
endmodule
