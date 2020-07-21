`include "my_global.h"

module cp0(
	//output
    epc,
    allow_int,
    in_exl,
    data_o,
    interrupt_flag,
	// input
	clk,
	rst,
    rd_addr,
	we,
    wr_addr,
    data_i,
    hardware_int,
    clear_exl,
    en_exp_i,
    exp_bd,
    exp_epc,
    exp_code,
    exp_badvaddr,
    exp_badvaddr_we,
    tlbwi,
    tlbr,
    tlbp,

    //mmu
    //output
    daddr_o,
    iaddr_o,
    data_uncached,
    inst_uncached,

    data_exp_miss,
    inst_exp_miss,
    data_exp_illegal,
    inst_exp_illegal,
    data_exp_dirty,
    data_exp_invalid,
    inst_exp_invalid,
    icache_close,
    dcache_close,

    //input
    daddr_i,
    iaddr_i,
    data_en,
    inst_en
);


input wire clk;
input wire rst;

input wire[4:0] rd_addr;
input wire we;
input wire[4:0] wr_addr;
input wire[31:0] data_i;

input wire[5:0]hardware_int;
input wire clear_exl;
input wire en_exp_i;
input wire exp_bd;
input wire[31:0] exp_epc;
input wire[4:0] exp_code;
input wire[31:0] exp_badvaddr;
input wire exp_badvaddr_we;
input wire tlbwi;
input wire tlbr;
input wire tlbp;

output wire allow_int;
output wire in_exl; 

output wire[31:0] epc;
output reg[31:0] data_o;
output wire[7:0] interrupt_flag;

input wire[31:0] daddr_i;
input wire[31:0] iaddr_i;
input wire data_en;
input wire inst_en;

output wire[31:0] daddr_o;
output wire[31:0] iaddr_o;

output wire data_uncached;
output wire inst_uncached;
output wire data_exp_miss;
output wire inst_exp_miss;
output wire data_exp_illegal;
output wire inst_exp_illegal;
output wire data_exp_dirty;
output wire data_exp_invalid;
output wire inst_exp_invalid;
input wire icache_close;

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

assign allow_int = cp0_reg_Status[2:0] == 3'b001 & !en_exp_i; //maybe bug
assign interrupt_flag = cp0_reg_Status[15:8] & Cause_IP;
assign in_exl = cp0_reg_Status[1];
assign epc = cp0_reg_EPC;

initial begin
    cp0_reg_Index    <= 32'b0;
    cp0_reg_EntryLo0 <= 32'b0;
    cp0_reg_EntryLo1 <= 32'b0;
    cp0_reg_PageMask <= `INIT_PAGEMASKK;
	// cp0_reg_BadVAddr <= 32'b0;
    cp0_reg_Count    <= 32'b0;
    cp0_reg_EntryHi  <= 32'b0;
    cp0_reg_Compare  <= 32'b0;
	cp0_reg_Status   <= `INIT_STATUS;
    cp0_reg_Cause    <= 32'b0;
	cp0_reg_EPC      <= 32'b0;
end

// read mfc0
// have not random, no tlbwr
always @(*) begin
    if (rst) begin
        data_o <= 32'h0;
    end
    else begin
        case (rd_addr)
        `CP0_Index: begin
            data_o[31] <= cp0_reg_Index[31];
            data_o[30:1] <= 30'b0;
            data_o[0:0] <= cp0_reg_Index[0:0];
        end
        `CP0_EntryLo0: begin
            data_o[31:26] <= 6'b0;
            data_o[25:0]  <= cp0_reg_EntryLo0[25:0];
        end
        `CP0_EntryLo1: begin
            data_o[31:26] <= 6'b0;
            data_o[25:0]  <= cp0_reg_EntryLo1[25:0];
        end
        `CP0_PageMask: begin
            data_o <= `INIT_PAGEMASKK; // mips32 4KB
        end
        `CP0_BadVAddr: begin
			data_o <= cp0_reg_BadVAddr;
        end
        `CP0_Count: begin
			data_o <= cp0_reg_Count >> 1;
        end
        `CP0_EntryHi: begin
            data_o[31:13] <= cp0_reg_EntryHi[31:13];
            data_o[12: 8] <= 5'b0;
            data_o[ 7: 0] <= cp0_reg_EntryHi[ 7: 0];
        end
        `CP0_Compare: begin
			data_o <= cp0_reg_Compare;
        end
        `CP0_Status: begin
			data_o[31:23] <= 9'b0;
			data_o[22]    <= cp0_reg_Status[22]; //BEV
			data_o[21:16] <= 6'b0; //21 is TLB shutdown
			data_o[15:8]  <= cp0_reg_Status[15:8]; //im
			data_o[7:2]   <= 6'b0; //4..3 is kernel and supervisor
			data_o[1:0]   <= cp0_reg_Status[1:0]; // 2 is no implemented
        end
        `CP0_Cause: begin
            data_o[31:30] <= cp0_reg_Cause[31:30]; //
            data_o[30:16] <= 15'b0;
            data_o[15:8] <= Cause_IP;
            data_o[7]     <= 1'b0;
            data_o[6:2]   <= cp0_reg_Cause[6:2];
            data_o[1:0]   <= 2'b0;
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
output reg dcache_close;
// write mtc0 tlb
always @(posedge clk) begin
	if (rst) begin
        cp0_reg_Index    <= 32'b0;
        cp0_reg_EntryLo0 <= 32'b0;
        cp0_reg_EntryLo1 <= 32'b0;
        cp0_reg_PageMask <= `INIT_PAGEMASKK;
        // cp0_reg_BadVAddr <= 32'b0;
        cp0_reg_Count    <= 32'b0;
        cp0_reg_EntryHi  <= 32'b0;
		cp0_reg_Compare  <= 32'b0;
        cp0_reg_Status   <= `INIT_STATUS;
        cp0_reg_Cause    <= 32'b0;
        cp0_reg_EPC      <= 32'b0;
        dcache_close <= 0;
	end
	else begin
		cp0_reg_Count <= cp0_reg_Count + 32'h1;
        if (cp0_reg_Compare == cp0_reg_Count) begin 
            timer_int <= 1'b1;
            cp0_reg_Cause[30] <= 1'b1;
        end
		if (we) begin 
            case(wr_addr)
            `CP0_Index: begin
                cp0_reg_Index[0:0] <= data_i[0:0];
            end
            `CP0_EntryLo0: begin
                cp0_reg_EntryLo0[25:0] <= data_i[25:0];
            end
            `CP0_EntryLo1: begin
                cp0_reg_EntryLo1[25:0] <= data_i[25:0];
            end
            `CP0_PageMask: begin
                ;
                // CP0_PageMask is always 0, 4KB size page
                // mips32
            end
            `CP0_Count: begin
				cp0_reg_Count <= data_i;
            end
            `CP0_EntryHi: begin
                cp0_reg_EntryHi[31:13] <= data_i[31:13];
                cp0_reg_EntryHi[7:0] <= data_i[7:0];
            end
            `CP0_Compare: begin
				cp0_reg_Compare <= data_i;
                timer_int <= (data_i == cp0_reg_Count);
                cp0_reg_Cause[30] <= (data_i == cp0_reg_Count);
            end
            `CP0_Status: begin
                cp0_reg_Status[15:8] <= data_i[15:8]; //IM
                cp0_reg_Status[1:0] <= data_i[1:0]; //EXL, IE
            end
            `CP0_Cause: begin
                cp0_reg_Cause[9:8] <= data_i[9:8]; //IP
            end
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
        if (en_exp_i) begin
            if (exp_badvaddr_we) 
                cp0_reg_BadVAddr <= exp_badvaddr;
            cp0_reg_EntryHi[31:12] <= exp_badvaddr[31:12];
            cp0_reg_Cause[31] <= exp_bd; //BD
            cp0_reg_Cause[6:2] <= exp_code;
            cp0_reg_EPC <= exp_epc;
            cp0_reg_Status[1] <= 1'b1; //EXL TODO:ERL
        end
        if (clear_exl) begin
            cp0_reg_Status[1] <= 1'b0;
        end
        if (tlbr) begin
            // PageMask is ignored
            cp0_reg_EntryHi[31:13] <= tlb1[tlbEntryIndex][89:71];
            cp0_reg_EntryHi[7:0]   <= tlb1[tlbEntryIndex][70:63];
            cp0_reg_EntryLo0[25:6] <= tlb1[tlbEntryIndex][49:30];
            cp0_reg_EntryLo0[5:1]  <= tlb1[tlbEntryIndex][29:25];
            cp0_reg_EntryLo0[0]    <= tlb1[tlbEntryIndex][50];
            cp0_reg_EntryLo1[25:6] <= tlb1[tlbEntryIndex][24:5];
            cp0_reg_EntryLo1[5:1]  <= tlb1[tlbEntryIndex][4:0];
            cp0_reg_EntryLo1[0]    <= tlb1[tlbEntryIndex][50];
        end
        if (tlbp) begin
            cp0_reg_Index[31] <= prober_result[31];
            cp0_reg_Index[0:0] <= prober_result[0:0];
        end
	end
end

// here is tlb 

// 19+8+12+1+20+5+20+5=90
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
assign cur_tlb = {
    tlbEntryVpn2,          //89..71
    tlbEntryAsid,          //70..63
    tlbEntryPageMask,      //62..51
    cp0_reg_EntryLo0[0] & cp0_reg_EntryLo1[0], //G 50
    tlbEntryPFN0,          //49..30
    cp0_reg_EntryLo0[5:1], //C D V 29..25
    tlbEntryPFN1,          //24..5
    cp0_reg_EntryLo1[5:1]  //C D V 4..0
};

// assign cur_tlb = {
//     cp0_reg_EntryHi[31:13], //vpn2 19 bit
//     cp0_reg_EntryHi[7:0], //asid 8 bit
//     CP0_PageMask[24:13], //pagemask 12 bit
//     cp0_reg_EntryLo0[0] & cp0_reg_EntryLo1[0], //G 1 bit
//     cp0_reg_EntryLo0[25:6], //PFN0 20 bit
//     CP0_reg_EntryLo0[5:1], //C D V 5 bit
//     cp0_reg_EntryLo1[25:6], //PFN1 20 bit
//     cp0_reg_EntryLo1[5:1] //C D V 5 bit
// };
// wire using_tlb;
// assign using_tlb = data_tlb_map | inst_tlb_map;
wire[31:0] iaddr_direct;
wire[31:0] daddr_direct;
wire[31:0] daddr_tlb;
wire[31:0] iaddr_tlb;
assign daddr_o = data_tlb_map ? daddr_tlb : daddr_direct;
assign iaddr_o = inst_tlb_map ? iaddr_tlb : iaddr_direct;
assign data_uncached = data_mmu_uncached /*| !data_cached  */ | icache_close | dcache_close;
assign inst_uncached = inst_mmu_uncached /*| !inst_cached  */ | icache_close | dcache_close;
assign data_exp_miss = data_tlb_map & data_miss;
assign inst_exp_miss = inst_tlb_map & inst_miss;
assign data_exp_dirty = (data_dirt & data_tlb_map);
assign data_exp_invalid = (~data_valid & data_tlb_map);
assign inst_exp_invalid = (~inst_valid & inst_tlb_map);

mmu mmu(
    //output
    .daddr_o(daddr_direct),
    .iaddr_o(iaddr_direct),
    .data_uncached(data_mmu_uncached), //todo:
    .inst_uncached(inst_mmu_uncached), //todo:
    .data_tlb_map(data_tlb_map),
    .inst_tlb_map(inst_tlb_map),
    .data_illegal(data_exp_illegal),
    .inst_illegal(inst_exp_illegal),
    //input
    .clk(clk),
    .rst(rst),
    .daddr_i(daddr_i),
    .iaddr_i(iaddr_i),
    .data_en(data_en), //todo: cache
    .inst_en(inst_en),
    .user_mode(0),
    .cp0_kseg0_uncached(0)
);

reg[89:0] tlb0[0:1];
reg[89:0] tlb1[0:1];

tlb_map inst_map(
    .clk(clk),
    .tlbEntry0(tlb0[0]),
    .tlbEntry1(tlb0[1]),
//    .tlbEntry2(tlb0[2]),
//    .tlbEntry3(tlb0[3]),
//    .tlbEntry4(tlb0[4]),
//    .tlbEntry5(tlb0[5]),
//    .tlbEntry6(tlb0[6]),
//    .tlbEntry7(tlb0[7]),
//    .tlbEntry8(tlb0[8]),
//    .tlbEntry9(tlb0[9]),
//    .tlbEntry10(tlb0[10]),
//    .tlbEntry11(tlb0[11]),
//    .tlbEntry12(tlb0[12]),
//    .tlbEntry13(tlb0[13]),
//    .tlbEntry14(tlb0[14]),
//    .tlbEntry15(tlb0[15]),
//    .tlbEntry16(tlb0[16]),
//    .tlbEntry17(tlb0[17]),
//    .tlbEntry18(tlb0[18]),
//    .tlbEntry19(tlb0[19]),
//    .tlbEntry20(tlb0[20]),
//    .tlbEntry21(tlb0[21]),
//    .tlbEntry22(tlb0[22]),
//    .tlbEntry23(tlb0[23]),
//    .tlbEntry24(tlb0[24]),
//    .tlbEntry25(tlb0[25]),
//    .tlbEntry26(tlb0[26]),
//    .tlbEntry27(tlb0[27]),
//    .tlbEntry28(tlb0[28]),
//    .tlbEntry29(tlb0[29]),
//    .tlbEntry30(tlb0[30]),
//    .tlbEntry31(tlb0[31]),

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
//    .tlbEntry2(tlb1[2]),
//    .tlbEntry3(tlb1[3]),
//    .tlbEntry4(tlb1[4]),
//    .tlbEntry5(tlb1[5]),
//    .tlbEntry6(tlb1[6]),
//    .tlbEntry7(tlb1[7]),
//    .tlbEntry8(tlb1[8]),
//    .tlbEntry9(tlb1[9]),
//    .tlbEntry10(tlb1[10]),
//    .tlbEntry11(tlb1[11]),
//    .tlbEntry12(tlb1[12]),
//    .tlbEntry13(tlb1[13]),
//    .tlbEntry14(tlb1[14]),
//    .tlbEntry15(tlb1[15]),
//    .tlbEntry16(tlb1[16]),
//    .tlbEntry17(tlb1[17]),
//    .tlbEntry18(tlb1[18]),
//    .tlbEntry19(tlb1[19]),
//    .tlbEntry20(tlb1[20]),
//    .tlbEntry21(tlb1[21]),
//    .tlbEntry22(tlb1[22]),
//    .tlbEntry23(tlb1[23]),
//    .tlbEntry24(tlb1[24]),
//    .tlbEntry25(tlb1[25]),
//    .tlbEntry26(tlb1[26]),
//    .tlbEntry27(tlb1[27]),
//    .tlbEntry28(tlb1[28]),
//    .tlbEntry29(tlb1[29]),
//    .tlbEntry30(tlb1[30]),
//    .tlbEntry31(tlb1[31]),

    .va(daddr_i),
    .asid(tlbEntryAsid),
    .pa(daddr_tlb),
    .miss(data_miss),
    .valid(data_valid),
    .dirt(data_dirt),
    .cached(data_cached),
    .matchWhich()
);

wire[31:0] prober_result;
tlb_map prober(
    .clk(clk),
    .tlbEntry0(tlb1[0]),
    .tlbEntry1(tlb1[1]),
//    .tlbEntry2(tlb1[2]),
//    .tlbEntry3(tlb1[3]),
//    .tlbEntry4(tlb1[4]),
//    .tlbEntry5(tlb1[5]),
//    .tlbEntry6(tlb1[6]),
//    .tlbEntry7(tlb1[7]),
//    .tlbEntry8(tlb1[8]),
//    .tlbEntry9(tlb1[9]),
//    .tlbEntry10(tlb1[10]),
//    .tlbEntry11(tlb1[11]),
//    .tlbEntry12(tlb1[12]),
//    .tlbEntry13(tlb1[13]),
//    .tlbEntry14(tlb1[14]),
//    .tlbEntry15(tlb1[15]),
//    .tlbEntry16(tlb1[16]),
//    .tlbEntry17(tlb1[17]),
//    .tlbEntry18(tlb1[18]),
//    .tlbEntry19(tlb1[19]),
//    .tlbEntry20(tlb1[20]),
//    .tlbEntry21(tlb1[21]),
//    .tlbEntry22(tlb1[22]),
//    .tlbEntry23(tlb1[23]),
//    .tlbEntry24(tlb1[24]),
//    .tlbEntry25(tlb1[25]),
//    .tlbEntry26(tlb1[26]),
//    .tlbEntry27(tlb1[27]),
//    .tlbEntry28(tlb1[28]),
//    .tlbEntry29(tlb1[29]),
//    .tlbEntry30(tlb1[30]),
//    .tlbEntry31(tlb1[31]),

    .va({tlbEntryVpn2, 13'b0}),
    .asid(tlbEntryAsid),
    .pa(),
    .miss(prober_result[31]),
    .valid(),
    .dirt(),
    .cached(),
    .matchWhich(prober_result[0:0])
);

wire[0:0] tlbEntryIndex;
assign tlbEntryIndex = cp0_reg_Index[0:0];


integer i;
always @(posedge clk) begin

  if (rst) begin
    for(i=0; i<2; i=i+1) begin
        tlb0[i] <= 90'b0;
        tlb1[i] <= 90'b0;
    end
  end else begin
    if (tlbwi) begin
        tlb0[tlbEntryIndex] <= cur_tlb;
        tlb1[tlbEntryIndex] <= cur_tlb;
        $display("index: %h, Hi: %h", tlbEntryIndex, cp0_reg_EntryHi);
    end
  end
end

endmodule


// 命中与异�??0周期出结果，地址1周期转化
module tlb_map(
    input clk,
    input wire[89:0] tlbEntry0,
    input wire[89:0] tlbEntry1,
//    input wire[89:0] tlbEntry2,
//    input wire[89:0] tlbEntry3,
//    input wire[89:0] tlbEntry4,
//    input wire[89:0] tlbEntry5,
//    input wire[89:0] tlbEntry6,
//    input wire[89:0] tlbEntry7,
//    input wire[89:0] tlbEntry8,
//    input wire[89:0] tlbEntry9,
//    input wire[89:0] tlbEntry10,
//    input wire[89:0] tlbEntry11,
//    input wire[89:0] tlbEntry12,
//    input wire[89:0] tlbEntry13,
//    input wire[89:0] tlbEntry14,
//    input wire[89:0] tlbEntry15,
//    input wire[89:0] tlbEntry16,
//    input wire[89:0] tlbEntry17,
//    input wire[89:0] tlbEntry18,
//    input wire[89:0] tlbEntry19,
//    input wire[89:0] tlbEntry20,
//    input wire[89:0] tlbEntry21,
//    input wire[89:0] tlbEntry22,
//    input wire[89:0] tlbEntry23,
//    input wire[89:0] tlbEntry24,
//    input wire[89:0] tlbEntry25,
//    input wire[89:0] tlbEntry26,
//    input wire[89:0] tlbEntry27,
//    input wire[89:0] tlbEntry28,
//    input wire[89:0] tlbEntry29,
//    input wire[89:0] tlbEntry30,
//    input wire[89:0] tlbEntry31,

    input wire[31:0] va,
    input wire[7:0]  asid,

    // output
    output [31:0] pa,
    output wire      miss,
    output wire      valid,
    output wire      dirt,
    output wire      cached,
    output wire[0:0] matchWhich
);

wire[89:0] tlbEntries[0:1];

assign tlbEntries[0]=tlbEntry0;
assign tlbEntries[1]=tlbEntry1;
//assign tlbEntries[2]=tlbEntry2;
//assign tlbEntries[3]=tlbEntry3;
//assign tlbEntries[4]=tlbEntry4;
//assign tlbEntries[5]=tlbEntry5;
//assign tlbEntries[6]=tlbEntry6;
//assign tlbEntries[7]=tlbEntry7;
//assign tlbEntries[8]=tlbEntry8;
//assign tlbEntries[9]=tlbEntry9;
//assign tlbEntries[10]=tlbEntry10;
//assign tlbEntries[11]=tlbEntry11;
//assign tlbEntries[12]=tlbEntry12;
//assign tlbEntries[13]=tlbEntry13;
//assign tlbEntries[14]=tlbEntry14;
//assign tlbEntries[15]=tlbEntry15;
//assign tlbEntries[16]=tlbEntry16;
//assign tlbEntries[17]=tlbEntry17;
//assign tlbEntries[18]=tlbEntry18;
//assign tlbEntries[19]=tlbEntry19;
//assign tlbEntries[20]=tlbEntry20;
//assign tlbEntries[21]=tlbEntry21;
//assign tlbEntries[22]=tlbEntry22;
//assign tlbEntries[23]=tlbEntry23;
//assign tlbEntries[24]=tlbEntry24;
//assign tlbEntries[25]=tlbEntry25;
//assign tlbEntries[26]=tlbEntry26;
//assign tlbEntries[27]=tlbEntry27;
//assign tlbEntries[28]=tlbEntry28;
//assign tlbEntries[29]=tlbEntry29;
//assign tlbEntries[30]=tlbEntry30;
//assign tlbEntries[31]=tlbEntry31;

wire[1:0] matched;
wire[19:0] PFN;

assign matched[ 0] = tlbEntries[ 0][89:71] == va[31:13] & (tlbEntries[ 0][70:63] == asid || tlbEntries[ 0][50]);
assign matched[ 1] = tlbEntries[ 1][89:71] == va[31:13] & (tlbEntries[ 1][70:63] == asid || tlbEntries[ 1][50]);
//assign matched[ 2] = tlbEntries[ 2][89:71] == va[31:13] & (tlbEntries[ 2][70:63] == asid || tlbEntries[ 2][50]);
//assign matched[ 3] = tlbEntries[ 3][89:71] == va[31:13] & (tlbEntries[ 3][70:63] == asid || tlbEntries[ 3][50]);
//assign matched[ 4] = tlbEntries[ 4][89:71] == va[31:13] & (tlbEntries[ 4][70:63] == asid || tlbEntries[ 4][50]);
//assign matched[ 5] = tlbEntries[ 5][89:71] == va[31:13] & (tlbEntries[ 5][70:63] == asid || tlbEntries[ 5][50]);
//assign matched[ 6] = tlbEntries[ 6][89:71] == va[31:13] & (tlbEntries[ 6][70:63] == asid || tlbEntries[ 6][50]);
//assign matched[ 7] = tlbEntries[ 7][89:71] == va[31:13] & (tlbEntries[ 7][70:63] == asid || tlbEntries[ 7][50]);
//assign matched[ 8] = tlbEntries[ 8][89:71] == va[31:13] & (tlbEntries[ 8][70:63] == asid || tlbEntries[ 8][50]);
//assign matched[ 9] = tlbEntries[ 9][89:71] == va[31:13] & (tlbEntries[ 9][70:63] == asid || tlbEntries[ 9][50]);
//assign matched[10] = tlbEntries[10][89:71] == va[31:13] & (tlbEntries[10][70:63] == asid || tlbEntries[10][50]);
//assign matched[11] = tlbEntries[11][89:71] == va[31:13] & (tlbEntries[11][70:63] == asid || tlbEntries[11][50]);
//assign matched[12] = tlbEntries[12][89:71] == va[31:13] & (tlbEntries[12][70:63] == asid || tlbEntries[12][50]);
//assign matched[13] = tlbEntries[13][89:71] == va[31:13] & (tlbEntries[13][70:63] == asid || tlbEntries[13][50]);
//assign matched[14] = tlbEntries[14][89:71] == va[31:13] & (tlbEntries[14][70:63] == asid || tlbEntries[14][50]);
//assign matched[15] = tlbEntries[15][89:71] == va[31:13] & (tlbEntries[15][70:63] == asid || tlbEntries[15][50]);
//assign matched[16] = tlbEntries[16][89:71] == va[31:13] & (tlbEntries[16][70:63] == asid || tlbEntries[16][50]);
//assign matched[17] = tlbEntries[17][89:71] == va[31:13] & (tlbEntries[17][70:63] == asid || tlbEntries[17][50]);
//assign matched[18] = tlbEntries[18][89:71] == va[31:13] & (tlbEntries[18][70:63] == asid || tlbEntries[18][50]);
//assign matched[19] = tlbEntries[19][89:71] == va[31:13] & (tlbEntries[19][70:63] == asid || tlbEntries[19][50]);
//assign matched[20] = tlbEntries[20][89:71] == va[31:13] & (tlbEntries[20][70:63] == asid || tlbEntries[20][50]);
//assign matched[21] = tlbEntries[21][89:71] == va[31:13] & (tlbEntries[21][70:63] == asid || tlbEntries[21][50]);
//assign matched[22] = tlbEntries[22][89:71] == va[31:13] & (tlbEntries[22][70:63] == asid || tlbEntries[22][50]);
//assign matched[23] = tlbEntries[23][89:71] == va[31:13] & (tlbEntries[23][70:63] == asid || tlbEntries[23][50]);
//assign matched[24] = tlbEntries[24][89:71] == va[31:13] & (tlbEntries[24][70:63] == asid || tlbEntries[24][50]);
//assign matched[25] = tlbEntries[25][89:71] == va[31:13] & (tlbEntries[25][70:63] == asid || tlbEntries[25][50]);
//assign matched[26] = tlbEntries[26][89:71] == va[31:13] & (tlbEntries[26][70:63] == asid || tlbEntries[26][50]);
//assign matched[27] = tlbEntries[27][89:71] == va[31:13] & (tlbEntries[27][70:63] == asid || tlbEntries[27][50]);
//assign matched[28] = tlbEntries[28][89:71] == va[31:13] & (tlbEntries[28][70:63] == asid || tlbEntries[28][50]);
//assign matched[29] = tlbEntries[29][89:71] == va[31:13] & (tlbEntries[29][70:63] == asid || tlbEntries[29][50]);
//assign matched[30] = tlbEntries[30][89:71] == va[31:13] & (tlbEntries[30][70:63] == asid || tlbEntries[30][50]);
//assign matched[31] = tlbEntries[31][89:71] == va[31:13] & (tlbEntries[31][70:63] == asid || tlbEntries[31][50]);

assign matchWhich = {5{matched[ 0]}} & 5'd0 |
                    {5{matched[ 1]}} & 5'd1 ;
//                    {5{matched[ 2]}} & 5'd2 |
//                    {5{matched[ 3]}} & 5'd3 |
//                    {5{matched[ 4]}} & 5'd4 |
//                    {5{matched[ 5]}} & 5'd5 |
//                    {5{matched[ 6]}} & 5'd6 |
//                    {5{matched[ 7]}} & 5'd7 |
//                    {5{matched[ 8]}} & 5'd8 |
//                    {5{matched[ 9]}} & 5'd9 |
//                    {5{matched[10]}} & 5'd10 |
//                    {5{matched[11]}} & 5'd11 |
//                    {5{matched[12]}} & 5'd12 |
//                    {5{matched[13]}} & 5'd13 |
//                    {5{matched[14]}} & 5'd14 |
//                    {5{matched[15]}} & 5'd15 |
//                    {5{matched[16]}} & 5'd16 |
//                    {5{matched[17]}} & 5'd17 |
//                    {5{matched[18]}} & 5'd18 |
//                    {5{matched[19]}} & 5'd19 |
//                    {5{matched[20]}} & 5'd20 |
//                    {5{matched[21]}} & 5'd21 |
//                    {5{matched[22]}} & 5'd22 |
//                    {5{matched[23]}} & 5'd23 |
//                    {5{matched[24]}} & 5'd24 |
//                    {5{matched[25]}} & 5'd25 |
//                    {5{matched[26]}} & 5'd26 |
//                    {5{matched[27]}} & 5'd27 |
//                    {5{matched[28]}} & 5'd28 |
//                    {5{matched[29]}} & 5'd29 |
//                    {5{matched[30]}} & 5'd30 |
//                    {5{matched[31]}} & 5'd31 ;

assign PFN    = va[12] ? tlbEntries[matchWhich][24:5] : tlbEntries[matchWhich][49:30] ;
assign valid  = va[12] ? tlbEntries[matchWhich][0]    : tlbEntries[matchWhich][25] ;//0 无效
assign dirt   = va[12] ? !tlbEntries[matchWhich][1]   : !tlbEntries[matchWhich][26] ;//0 脏， 不可�??
assign cached = va[12] ? tlbEntries[matchWhich][2]    : tlbEntries[matchWhich][27] ;//1 走cache, todo:reserve
assign miss   = !(|matched);
assign pa     = {PFN, va[11:0]}; // 0 周期
// always @(posedge clk) begin
//     pa <= {PFN, va[11:0]};
// end

endmodule // tlb_map
