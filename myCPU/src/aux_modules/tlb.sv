// TODO: partially copied from ucas, rewriting needed

module TLB #(
    parameter TLB_NUM = 32,
    parameter IDX_BITS = $clog2(TLB_NUM)
)(
    input        clk,
    input        rst,

    // TLB entry i_we
    input        we,        //1:TLBWI
    input [IDX_BITS-1:0] index_i,           
    input [11:0] mask_i,        
    input [31:0] entryhi_i,
    input [31:0] entrylo0_i,
    input [31:0] entrylo1_i,
    // TLB read/probe
    output [11:0] mask_o,    
    output [31:0] entryhi_o,
    output [31:0] entrylo0_o,
    output [31:0] entrylo1_o,
    output [31:0] probe_index_o,

    input kernel_mode,
    input cp0_erl,
    input kseg0_cached,

    input  [31:0] va0,
    output [31:0] pa0,
    output hit0,
    output valid0,
    output dirty0,
    output cached0,
    output error0,

    input  [31:0] va1,
    output [31:0] pa1,
    output hit1,
    output valid1,
    output dirty1,
    output cached1,
    output error1
);

// TODO: duplicated https://github.com/nscscc2019ucas/nscscc2019ucas/blob/master/performance/soc_axi_func/rtl/myCPU/core/tlb.v#L41
reg [11:0] mask [TLB_NUM-1:0];
reg [18:0] vpn2 [TLB_NUM-1:0];
reg [7 :0] asid [TLB_NUM-1:0];
reg        G    [TLB_NUM-1:0];
reg [19:0] pfn0 [TLB_NUM-1:0];
reg [19:0] pfn1 [TLB_NUM-1:0];
reg [2 :0] c0   [TLB_NUM-1:0];
reg [2 :0] c1   [TLB_NUM-1:0];
reg        d0   [TLB_NUM-1:0];
reg        d1   [TLB_NUM-1:0];
reg        v0   [TLB_NUM-1:0];
reg        v1   [TLB_NUM-1:0];

integer n;
always_ff @(posedge clk) begin
    if (rst) begin
        for (n = 0; n < TLB_NUM; n = n + 1) begin
            mask [n] <= 0;
            vpn2 [n] <= 0;
            asid [n] <= 0;
            G    [n] <= 0;
            pfn0 [n] <= 0;
            pfn1 [n] <= 0;
            c0   [n] <= 3;
            c1   [n] <= 3;
            d0   [n] <= 0;
            d1   [n] <= 0;
            v0   [n] <= 0;
            v1   [n] <= 0;
        end
    end
    else if (we) begin
        mask [index_i] <= mask_i;
        vpn2 [index_i] <= entryhi_i[31:13] & ~mask_i;
        asid [index_i] <= entryhi_i[7:0];
        G    [index_i] <= entrylo0_i[0] & entrylo1_i[0];
        pfn0 [index_i] <= entrylo0_i[25:6] & ~mask_i;
        pfn1 [index_i] <= entrylo1_i[25:6] & ~mask_i;
        c0   [index_i] <= entrylo0_i[5:3];
        c1   [index_i] <= entrylo1_i[5:3];
        d0   [index_i] <= entrylo0_i[2];
        d1   [index_i] <= entrylo1_i[2];
        v0   [index_i] <= entrylo0_i[1];
        v1   [index_i] <= entrylo1_i[1];
    end
end

// read
assign entryhi_o  = {vpn2[index_i], 5'b0, asid[index_i]};
assign entrylo0_o = {6'b0, pfn0[index_i], c0[index_i], d0[index_i], v0[index_i], G[index_i]};
assign entrylo1_o = {6'b0, pfn1[index_i], c1[index_i], d1[index_i], v1[index_i], G[index_i]};
assign mask_o     = mask[index_i];

// probe index
wire [TLB_NUM-1:0] match;
wire [IDX_BITS-1:0] index [TLB_NUM:0];
assign index[0] = 0;
genvar i;
generate
    for (i = 0; i < TLB_NUM; i = i + 1) begin
        assign match[i]   = (entryhi_i[31:13] & ~mask[i]) == (vpn2[i] & ~mask[i]) && (G[i] || asid[i] == entryhi_i[7:0]);
        assign index[i+1] = index[i] | (match[i] ? i : 0);
    end
endgenerate

assign probe_index_o = ((~|match) << 31) | index[TLB_NUM];

MMUMatcher matcher0(va0, pa0, hit0, valid0, dirty0, cached0, error0);
MMUMatcher matcher1(va1, pa1, hit1, valid1, dirty1, cached1, error1);

module MMUMatcher(
    input  [31:0] va,
    output reg [31:0] pa,
    output reg hit,
    output reg valid,
    output reg dirty,
    output reg cached,
    output reg addressError
);

    wire [TLB_NUM-1:0] match0;
    wire [TLB_NUM-1:0] sel0;

    wire [19:0] pfn_com0 [TLB_NUM-1:0];
    wire [31:0] lp_pa0   [TLB_NUM:0];
    wire [2 :0] lp_c0    [TLB_NUM:0];
    wire        lp_v0    [TLB_NUM:0];
    wire        lp_d0    [TLB_NUM:0];

    assign lp_pa0[0] = 32'b0;
    assign lp_c0[0] = 3'b0;
    assign lp_v0[0] = 1'b0;
    assign lp_d0[0] = 1'b0;
    genvar i;
    generate
        for (i = 0; i < TLB_NUM; i = i + 1) begin
            // TODO: duplicated https://github.com/nscscc2019ucas/nscscc2019ucas/blob/master/performance/soc_axi_func/rtl/myCPU/core/tlb.v#L138
            assign match0[i]   = (va[31:13] & ~mask[i]) == (vpn2[i] & ~mask[i]) && (G[i] || asid[i] == entryhi_i[7:0]);
            assign sel0[i]     = (va[24:12] & {mask[i], 1'b1}) != (va[24:12] & {1'b0, mask[i]});
            assign pfn_com0[i] = sel0[i] ? pfn1[i] : pfn0[i];
            assign lp_pa0[i+1] = lp_pa0[i] | {32{match0[i]}} & (((pfn_com0[i] & ~mask[i]) << 12) | (va & {mask[i], 12'hfff}));
            assign lp_c0[i+1]  = lp_c0[i]  | { 3{match0[i]}} & (sel0[i]? c1[i] : c0[i]);
            assign lp_v0[i+1]  = lp_v0[i]  | match0[i] & (sel0[i]? v1[i] : v0[i]);
            assign lp_d0[i+1]  = lp_d0[i]  | match0[i] & (sel0[i]? d1[i] : d0[i]);
        end
    endgenerate

    logic mapped;
    logic error;

    typedef enum logic [2:0] {
        useg,
        kseg0,
        kseg1,
        ksseg,
        kseg3
    } address_segment_t;

    address_segment_t va_seg;
    // See Figure 4-1, P. 25, Vol. III
    always_comb begin
        case (va[31:29])
            default: va_seg = useg;
            3'b100:  va_seg = kseg0;
            3'b101:  va_seg = kseg1;
            3'b110:  va_seg = ksseg;
            3'b111:  va_seg = kseg3;
        endcase
    end

    // See Table 4.2, P. 28, Vol. III
    always_comb begin
        case (va_seg)
            useg: begin
                if (kernel_mode) begin
                    mapped = !cp0_erl;
                    error = 0;
                end else begin
                    mapped = 1;
                    error = 0;
                end
            end
            kseg0, kseg1: begin
                if (kernel_mode) begin
                    mapped = 0;
                    error = 0;
                end else begin
                    mapped = 'bX;
                    error = 1;
                end
            end
            kseg3: begin
                if (kernel_mode) begin
                    mapped = 1;
                    error = 0;
                end else begin
                    mapped = 'bX;
                    error = 1;
                end
            end
            default: begin
                error = 1;
                mapped = 'bX;
            end
        endcase
    end

    always_ff @(posedge clk) begin
        addressError <= error;
        if (mapped) begin
            pa <= lp_pa0[TLB_NUM];
            hit <= |match0;
            valid <= lp_v0[TLB_NUM];
            dirty <= lp_d0[TLB_NUM];
            // See Table 9.9, P. 98, Vol. III
            cached <= lp_c0[TLB_NUM] == 3;
        end else begin
            pa <= {3'b0, va[28:0]};
            hit <= 1;
            valid <= 1;
            dirty <= 1;
            cached <= va_seg == kseg0 ? kseg0_cached : 0;
        end
    end
endmodule

endmodule