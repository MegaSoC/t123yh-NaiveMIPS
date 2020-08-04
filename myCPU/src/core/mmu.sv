module mmu(
        input wire clk,
        input wire rst,

        input wire[31:0] daddr_i,
        input wire[31:0] iaddr_i,
        input wire data_en,
        input wire inst_en,

        input wire user_mode,
        input wire cp0_kseg0_uncached,

        output wire[31:0] daddr_o,
        output wire[31:0] iaddr_o,

        output wire data_uncached,
        output wire inst_uncached,
        output wire data_tlb_map,
        output wire inst_tlb_map,
        output wire IllegalData,
        output wire IllegalInst

    );


    mmu_map data_mmu(
                .addr_o(daddr_o),
                .invalid(IllegalData),
                .using_tlb(data_tlb_map),
                .uncached(data_uncached),
                .addr_i(daddr_i),
                .cp0_kseg0_uncached(cp0_kseg0_uncached),
                .en(data_en),
                .um(user_mode)
            );

    mmu_map inst_mmu(
                .addr_o(iaddr_o),
                .invalid(IllegalInst),
                .using_tlb(inst_tlb_map),
                .uncached(inst_uncached),
                .addr_i(iaddr_i),
                .cp0_kseg0_uncached(cp0_kseg0_uncached),
                .en(inst_en),
                .um(user_mode)
            );


endmodule
module mmu_map(
        input wire[31:0] addr_i,
        input wire en,
        input wire um,
        input wire cp0_kseg0_uncached,

        output wire[31:0] addr_o,
        output wire invalid,
        output wire using_tlb,
        output wire uncached
    );

    assign invalid = (en & um & addr_i[31]); // 用户态访问非法地�?

    assign uncached = addr_i[31:29] == 3'b101 ? 1'b1 :
           addr_i[31:29] == 3'b100 ? cp0_kseg0_uncached :
           1'b0 ;
    assign addr_o = addr_i[31:29] == 3'b100 ? {3'b000 , addr_i[28:0]} : addr_i[31:29] == 3'b101 ? {3'b000 , addr_i[28:0]} : 32'b0 ;
    assign using_tlb = addr_i[31:29] == 3'b100 ? 1'b0 :
           addr_i[31:29] == 3'b101 ? 1'b0 :
           en ;
endmodule
