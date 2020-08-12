`timescale 1ns / 1ps

module TLB #(
    parameter TLB_NUM = 32,
    parameter IDX_BITS = 5 
)(
    input 		 clk,
    input        rst,
    input wire o_p_EstallClear,
    // TLB entry i_we
    input 	     we,        //1:TLBWI
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
    // COM 0 fetch
    input  [31:0] va0,
    input  [31:0] va0_bak,
    input   va0_choice,
    output [31:0] pa0,
    output [1 :0] exp_bus0, //{miss, valid}; 
    // COM 2 load/store
    input  [31:0] va1,
    input  [31:0] va1_bak,
    input   va1_choice,
    output [31:0] pa1,
    output [2 :0] exp_bus1  //{miss, valid, dirty};
);

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
            c0   [n] <= 0;
            c1   [n] <= 0;
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
wire [TLB_NUM-1:0] match0, match0_bak, match1, match1_bak;
wire [TLB_NUM-1:0] sel0, sel0_bak, sel1, sel1_bak;
wire [19:0] pfn_com0 [TLB_NUM-1:0];
wire [19:0] pfn_com0_bak [TLB_NUM-1:0];
wire [19:0] pfn_com1 [TLB_NUM-1:0];
wire [19:0] pfn_com1_bak [TLB_NUM-1:0];
wire [31:0] lp_pa0   [TLB_NUM:0];
wire [31:0] lp_pa0_bak   [TLB_NUM:0];
wire [31:0] lp_pa1   [TLB_NUM:0];
wire [31:0] lp_pa1_bak   [TLB_NUM:0];
wire [2 :0] lp_c0    [TLB_NUM:0];
wire [2 :0] lp_c0_bak    [TLB_NUM:0];
wire [2 :0] lp_c1    [TLB_NUM:0];
wire [2 :0] lp_c1_bak    [TLB_NUM:0];
wire        lp_v0    [TLB_NUM:0];
wire        lp_v0_bak    [TLB_NUM:0];
wire        lp_v1    [TLB_NUM:0];
wire        lp_d1    [TLB_NUM:0];
wire        lp_v1_bak    [TLB_NUM:0];
wire        lp_d1_bak    [TLB_NUM:0];

assign lp_pa0[0] = 32'b0;
assign lp_pa0_bak[0] = 32'b0;
assign lp_pa1[0] = 32'b0;
assign lp_pa1_bak[0] = 32'b0;
assign lp_c0[0] = 3'b0;
assign lp_c0_bak[0] = 3'b0;
assign lp_c1[0] = 3'b0;
assign lp_c1_bak[0] = 3'b0;
assign lp_v0[0] = 1'b0;
assign lp_v0_bak[0] = 1'b0;
assign lp_v1[0] = 1'b0;
assign lp_d1[0] = 1'b0;
assign lp_v1_bak[0] = 1'b0;
assign lp_d1_bak[0] = 1'b0;

generate
    for (i = 0; i < TLB_NUM; i = i + 1) begin
        //COM0
        assign match0[i]   = (va0[31:13] & ~mask[i]) == (vpn2[i] & ~mask[i]) && (G[i] || asid[i] == entryhi_i[7:0]);
        assign sel0[i]     = (va0[24:12] & {mask[i], 1'b1}) != (va0[24:12] & {1'b0, mask[i]});
        assign pfn_com0[i] = sel0[i]? pfn1[i] : pfn0[i];
        assign lp_pa0[i+1] = lp_pa0[i] | {32{match0[i]}} & (((pfn_com0[i] & ~mask[i]) << 12) | (va0 & {mask[i], 12'hfff}));
        assign lp_c0[i+1]  = lp_c0[i]  | { 3{match0[i]}} & (sel0[i]? c1[i] : c0[i]);
        assign lp_v0[i+1]  = lp_v0[i]  | match0[i] & (sel0[i]? v1[i] : v0[i]);

        //COM0_bak
        assign match0_bak[i]   = (va0_bak[31:13] & ~mask[i]) == (vpn2[i] & ~mask[i]) && (G[i] || asid[i] == entryhi_i[7:0]);
        assign sel0_bak[i]     = (va0_bak[24:12] & {mask[i], 1'b1}) != (va0_bak[24:12] & {1'b0, mask[i]});
        assign pfn_com0_bak[i] = sel0_bak[i]? pfn1[i] : pfn0[i];
        assign lp_pa0_bak[i+1] = lp_pa0_bak[i] | {32{match0_bak[i]}} & (((pfn_com0_bak[i] & ~mask[i]) << 12) | (va0_bak & {mask[i], 12'hfff}));
        assign lp_c0_bak[i+1]  = lp_c0_bak[i]  | { 3{match0_bak[i]}} & (sel0_bak[i]? c1[i] : c0[i]);
        assign lp_v0_bak[i+1]  = lp_v0_bak[i]  | match0_bak[i] & (sel0_bak[i]? v1[i] : v0[i]);

        //COM1
        assign match1[i]   = (va1[31:13] & ~mask[i]) == (vpn2[i] & ~mask[i]) && (G[i] || asid[i] == entryhi_i[7:0]);
        assign sel1[i]     = (va1[24:12] & {mask[i], 1'b1}) != (va1[24:12] & {1'b0, mask[i]});
        assign pfn_com1[i] = sel1[i]? pfn1[i] : pfn0[i];
        assign lp_pa1[i+1] = lp_pa1[i] | {32{match1[i]}} & (((pfn_com1[i] & ~mask[i]) << 12) | (va1 & {mask[i], 12'hfff}));
        assign lp_c1[i+1]  = lp_c1[i]  | { 3{match1[i]}} & (sel1[i]? c1[i] : c0[i]);
        assign lp_v1[i+1]  = lp_v1[i]  | match1[i] & (sel1[i]? v1[i] : v0[i]);
        assign lp_d1[i+1]  = lp_d1[i]  | match1[i] & (sel1[i]? d1[i] : d0[i]);

        //COM1_bak
        assign match1_bak[i]   = (va1_bak[31:13] & ~mask[i]) == (vpn2[i] & ~mask[i]) && (G[i] || asid[i] == entryhi_i[7:0]);
        assign sel1_bak[i]     = (va1_bak[24:12] & {mask[i], 1'b1}) != (va1_bak[24:12] & {1'b0, mask[i]});
        assign pfn_com1_bak[i] = sel1_bak[i]? pfn1[i] : pfn0[i];
        assign lp_pa1_bak[i+1] = lp_pa1_bak[i] | {32{match1_bak[i]}} & (((pfn_com1_bak[i] & ~mask[i]) << 12) | (va1_bak & {mask[i], 12'hfff}));
        assign lp_c1_bak[i+1]  = lp_c1_bak[i]  | { 3{match1_bak[i]}} & (sel1_bak[i]? c1[i] : c0[i]);
        assign lp_v1_bak[i+1]  = lp_v1_bak[i]  | match1_bak[i] & (sel1_bak[i]? v1[i] : v0[i]);
        assign lp_d1_bak[i+1]  = lp_d1_bak[i]  | match1_bak[i] & (sel1_bak[i]? d1[i] : d0[i]);
    end
endgenerate
// COM0&1 OUT
reg [31:0] reg_pa0,reg_pa1;
reg [2:0] reg_exp_bus0,reg_exp_bus1;

always_ff @(posedge clk) begin
    if (rst) begin
        reg_pa0      <= 0;
        reg_pa1      <= 0;
        reg_exp_bus0 <= 0;
        reg_exp_bus1 <= 0;
    end
    else begin
        reg_pa0      <= va0_choice ? lp_pa0[TLB_NUM] : lp_pa0_bak[TLB_NUM];
        reg_pa1      <= o_p_EstallClear ? 0 : va1_choice ? lp_pa1[TLB_NUM] : lp_pa1_bak[TLB_NUM];
        reg_exp_bus0 <= va0_choice ? {~|match0, lp_v0[TLB_NUM]} : {~|match0_bak, lp_v0_bak[TLB_NUM]};
        reg_exp_bus1 <= o_p_EstallClear ? 0 : va1_choice ? {~|match1, lp_v1[TLB_NUM], ~lp_d1[TLB_NUM]} : {~|match1_bak, lp_v1_bak[TLB_NUM], ~lp_d1_bak[TLB_NUM]};
    end
end

assign pa0      = reg_pa0;     
assign pa1      = reg_pa1;     
assign exp_bus0 = reg_exp_bus0;
assign exp_bus1 = reg_exp_bus1;

//assign pa0      = lp_pa0[TLB_NUM];
//assign pa1      = lp_pa1[TLB_NUM];
//assign exp_bus0 = {~|match0, lp_v0[TLB_NUM]};
//assign exp_bus1 = {~|match1, lp_v1[TLB_NUM], ~lp_d1[TLB_NUM]};

endmodule
