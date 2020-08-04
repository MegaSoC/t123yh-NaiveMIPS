`include "my_global.vh"

module cp0(
        input wire clk,
        input wire rst,

        input wire[4:0] rd_addr,
        input wire we,
        input wire[4:0] wr_addr,
        input wire[31:0] data_i,

        input wire[5:0]hardware_int,
        input wire clear_exl,
        input wire en_exp_i,
        input wire exp_bd,
        input wire[31:0] exp_epc,
        input wire[4:0] exp_code,
        input wire[31:0] exp_badvaddr,
        input wire exp_badvaddr_we,
        input wire tlbwi,
        input wire tlbr,
        input wire tlbp,

        output wire allow_int,
        output wire in_exl,

        output wire[31:0] epc,
        output reg[31:0] data_o,
        output wire[7:0] interrupt_flag,

        input wire[31:0] daddr_i,
        input wire[31:0] iaddr_i,
        input wire data_en,
        input wire inst_en,

        output wire[31:0] daddr_o,
        output wire[31:0] iaddr_o,

        output wire data_uncached,
        output wire inst_uncached,
        output wire data_exp_miss,
        output wire inst_exp_miss,
        output wire data_exp_illegal,
        output wire inst_exp_illegal,
        output wire data_exp_dirty,
        output wire data_exp_invalid,
        output wire inst_exp_invalid,
        input wire icache_close,
        output reg dcache_close
    );

    reg[31:0] cp0_reg_Index;
    reg[31:0] cp0_reg_EntryLo0;
    reg[31:0] cp0_reg_EntryLo1;
    reg[31:0] cp0_reg_PageMask;
    reg[31:0] cp0_reg_BadVAddr;
    reg[31:0] cp0_reg_Count;
    reg[31:0] cp0_reg_EntryHi;
    reg[31:0] cp0_reg_Compare;
    reg[31:0] cp0_reg_Status;
    reg[31:0] cp0_reg_Cause;
    reg[31:0] cp0_reg_EPC;

    reg timer_int;
    wire [7:0] Cause_IP = {hardware_int, cp0_reg_Cause[9:8]};

    assign allow_int = cp0_reg_Status[2:0] == 3'b001 & !en_exp_i; assign interrupt_flag = cp0_reg_Status[15:8] & Cause_IP;
    assign in_exl = cp0_reg_Status[1];
    assign epc = cp0_reg_EPC;
    wire[31:0] prober_result;
    always_ff @(*) begin
        if (rst) begin
            data_o <= 32'h0;
        end
        else begin
            case (rd_addr)

                `CP0_PageMask: begin
                    data_o <= `INIT_PAGEMASKK; end
                `CP0_BadVAddr: begin
                    data_o <= cp0_reg_BadVAddr;
                end
                `CP0_Count: begin
                    data_o <= cp0_reg_Count >> 1;
                end
                `CP0_Compare: begin
                    data_o <= cp0_reg_Compare;
                end
                `CP0_Status: begin
                    data_o[31:23] <= 9'b0;
                    data_o[22] <= cp0_reg_Status[22]; data_o[21:16] <= 6'b0; data_o[15:8] <= cp0_reg_Status[15:8]; data_o[7:2] <= 6'b0; data_o[1:0] <= cp0_reg_Status[1:0]; end
                `CP0_Cause: begin
                    data_o[31:30] <= cp0_reg_Cause[31:30]; data_o[30:16] <= 15'b0;
                    data_o[15:8] <= Cause_IP;
                    data_o[7] <= 1'b0;
                    data_o[6:2] <= cp0_reg_Cause[6:2];
                    data_o[1:0] <= 2'b0;
                end
                `CP0_EPC: begin
                    data_o <= cp0_reg_EPC;
                end
                default: begin
                    data_o <= 32'b0;
                end
            endcase
        end
    end

    reg[89:0] tlb0[0:1];
    reg[89:0] tlb1[0:1];
    wire[0:0] tlbEntryIndex;
    reg count_add;
    always_ff @(posedge clk) begin
        if (rst) begin
            cp0_reg_Index <= 32'b0;
            cp0_reg_EntryLo0 <= 32'b0;
            cp0_reg_EntryLo1 <= 32'b0;
            cp0_reg_PageMask <= `INIT_PAGEMASKK;
            cp0_reg_Count <= 32'b0;
            cp0_reg_EntryHi <= 32'b0;
            cp0_reg_Compare <= 32'b0;
            cp0_reg_Status <= `INIT_STATUS;
            cp0_reg_Cause <= 32'b0;
            cp0_reg_EPC <= 32'b0;
            dcache_close <= 0;
            count_add <= 1'b0;
        end
        else begin
            count_add <= ~count_add;
            cp0_reg_Count <= cp0_reg_Count + {31'd0,count_add};
            if (cp0_reg_Compare == cp0_reg_Count) begin
                timer_int <= 1'b1;
                cp0_reg_Cause[30] <= 1'b1;
            end
            if (we) begin
                case(wr_addr)

                    `CP0_Count: begin
                        cp0_reg_Count <= data_i;
                    end
                    `CP0_Compare: begin
                        cp0_reg_Compare <= data_i;
                        timer_int <= (data_i == cp0_reg_Count);
                        cp0_reg_Cause[30] <= (data_i == cp0_reg_Count);
                    end
                    `CP0_Status: begin
                        cp0_reg_Status[15:8] <= data_i[15:8]; cp0_reg_Status[1:0] <= data_i[1:0]; end
                    `CP0_Cause: begin
                        cp0_reg_Cause[9:8] <= data_i[9:8]; end
                    `CP0_EPC: begin
                        cp0_reg_EPC <= data_i;
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
                if (en_exp_i) begin
                    if (exp_badvaddr_we)
                        cp0_reg_BadVAddr <= exp_badvaddr;
                    cp0_reg_EntryHi[31:12] <= exp_badvaddr[31:12];
                    cp0_reg_Cause[31] <= exp_bd; cp0_reg_Cause[6:2] <= exp_code;
                    cp0_reg_EPC <= exp_epc;
                    cp0_reg_Status[1] <= 1'b1; end
                if (clear_exl) begin
                    cp0_reg_Status[1] <= 1'b0;
                end
            end
        end
    end


    wire[89:0] cur_tlb;
    wire[18:0] tlbEntryVpn2;
    assign tlbEntryVpn2 = cp0_reg_EntryHi[31:13];
    wire[7:0] tlbEntryAsid;
    assign tlbEntryAsid = cp0_reg_EntryHi[7:0];
    wire[11:0] tlbEntryPageMask;
    assign tlbEntryPageMask = cp0_reg_PageMask[24:13];
    wire[19:0] tlbEntryPFN0, tlbEntryPFN1;
    assign tlbEntryPFN0 = cp0_reg_EntryLo0[25:6];
    assign tlbEntryPFN1 = cp0_reg_EntryLo1[25:6];
    assign cur_tlb = {tlbEntryVpn2,tlbEntryAsid, tlbEntryPageMask,cp0_reg_EntryLo0[0] & cp0_reg_EntryLo1[0], tlbEntryPFN0, cp0_reg_EntryLo0[5:1], tlbEntryPFN1, cp0_reg_EntryLo1[5:1]};

    wire[31:0] iaddr_direct;
    wire[31:0] daddr_direct;
    wire[31:0] daddr_tlb;
    wire[31:0] iaddr_tlb;
    wire data_tlb_map, inst_tlb_map, data_mmu_uncached, inst_mmu_uncached,
         data_miss, inst_miss, data_dirt, data_valid, inst_valid;
    assign daddr_o = data_tlb_map ? daddr_tlb : daddr_direct;
    assign iaddr_o = inst_tlb_map ? iaddr_tlb : iaddr_direct;
    assign data_uncached = data_mmu_uncached | icache_close | dcache_close;
    assign inst_uncached = inst_mmu_uncached | icache_close | dcache_close;
    assign data_exp_miss = data_tlb_map & data_miss;
    assign inst_exp_miss = inst_tlb_map & inst_miss;
    assign data_exp_dirty = (data_dirt & data_tlb_map);
    assign data_exp_invalid = (~data_valid & data_tlb_map);
    assign inst_exp_invalid = (~inst_valid & inst_tlb_map);

    mmu mmu(
            .daddr_o(daddr_direct),
            .iaddr_o(iaddr_direct),
            .data_uncached(data_mmu_uncached),
            .inst_uncached(inst_mmu_uncached),
            .data_tlb_map(data_tlb_map),
            .inst_tlb_map(inst_tlb_map),
            .data_illegal(data_exp_illegal),
            .inst_illegal(inst_exp_illegal),

            .clk(clk),
            .rst(rst),
            .daddr_i(daddr_i),
            .iaddr_i(iaddr_i),
            .data_en(data_en),
            .inst_en(inst_en),
            .user_mode(0),
            .cp0_kseg0_uncached(0)
        );

    tlb_map inst_map(
                .clk(clk),
                .tlbEntry0(tlb0[0]),
                .tlbEntry1(tlb0[1]),

                .va(iaddr_i),
                .asid(tlbEntryAsid),
                .pa(iaddr_tlb),
                .miss(inst_miss),
                .valid(inst_valid),
                .dirt(inst_dirt),
                .cached(inst_cached),
                .matchWhich()
            );

    tlb_map data_map(
                .clk(clk),
                .tlbEntry0(tlb1[0]),
                .tlbEntry1(tlb1[1]),

                .va(daddr_i),
                .asid(tlbEntryAsid),
                .pa(daddr_tlb),
                .miss(data_miss),
                .valid(data_valid),
                .dirt(data_dirt),
                .cached(data_cached),
                .matchWhich()
            );

    tlb_map prober(
                .clk(clk),
                .tlbEntry0(tlb1[0]),
                .tlbEntry1(tlb1[1]),

                .va({tlbEntryVpn2, 13'b0}),
                .asid(tlbEntryAsid),
                .pa(),
                .miss(prober_result[31]),
                .valid(),
                .dirt(),
                .cached(),
                .matchWhich(prober_result[0:0])
            );


    assign tlbEntryIndex = cp0_reg_Index[0:0];


    integer i;
    always_ff @(posedge clk) begin

        if (rst) begin
            for(i=0; i<2; i=i+1) begin
                tlb0[i] <= 90'b0;
                tlb1[i] <= 90'b0;
            end
        end
    end

endmodule


module tlb_map(
        input clk,
        input wire[89:0] tlbEntry0,
        input wire[89:0] tlbEntry1,

        input wire[31:0] va,
        input wire[7:0] asid,

        output [31:0] pa,
        output wire miss,
        output wire valid,
        output wire dirt,
        output wire cached,
        output wire[0:0] matchWhich
    );

    wire[89:0] tlbEntries[0:1];

    assign tlbEntries[0] =tlbEntry0;
    assign tlbEntries[1] =tlbEntry1;

    wire[1:0] matched;
    wire[19:0] PFN;

    assign matched[ 0] = tlbEntries[ 0][89:71] == va[31:13] & (tlbEntries[ 0][70:63] == asid || tlbEntries[ 0][50]);
    assign matched[ 1] = tlbEntries[ 1][89:71] == va[31:13] & (tlbEntries[ 1][70:63] == asid || tlbEntries[ 1][50]);

    assign matchWhich = {5{matched[ 0]}} & 5'd0 |
           {5{matched[ 1]}} & 5'd1 ;

    assign PFN = va[12] ? tlbEntries[matchWhich][24:5] : tlbEntries[matchWhich][49:30] ;
    assign valid = va[12] ? tlbEntries[matchWhich][0] : tlbEntries[matchWhich][25] ; assign dirt = va[12] ? !tlbEntries[matchWhich][1] : !tlbEntries[matchWhich][26] ; assign cached = va[12] ? tlbEntries[matchWhich][2] : tlbEntries[matchWhich][27] ; assign miss = !(|matched);
    assign pa = {PFN, va[11:0]};
endmodule
