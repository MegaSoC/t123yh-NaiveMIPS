`include "../global.svh"

module CP0 (
    input wire clk,
    input wire reset,

    input wire          we,
    input cp0_number_t  rw_number,
    input wire [31:0]   data_i,
    output reg  [31:0]  data_o,

    input wire          en_exp_i,
    input wire          ewr_bd,
    input wire [31:0]   ewr_epc,
    input wire [31:0]   ewr_badVAddr,
    input ExcCode_t     ewr_excCode,

    output wire [31:0]  epc,
    output wire [31:0]  exc_handler,
    output wire [31:0]  int_handler,
    output wire [31:0]  tlb_refill_handler,

    input wire [4:0]    hardware_int,
    output wire         interrupt_pending,

    output wire         privileged,
    output wire         kseg0_cached,
    output wire         kernel_mode,
    output wire         erl,
    output wire [31:0]  tagLo0_o,

    output wire [31:0] entryLo0_o,
    output wire [31:0] entryLo1_o,
    output wire [31:0] entryHi_o,
    output wire [11:0] pageMask_o,
    output wire [31:0] tlbIndex_o,

    input  wire        tlbp,
    input  wire        tlbr,
    input  wire        tlbrandom,
    input  wire [31:0] entryLo0_i,
    input  wire [31:0] entryLo1_i,
    input  wire [31:0] entryHi_i,
    input  wire [11:0] pageMask_i,
    input  wire [31:0] index_i
);

reg [4:0] hardware_int_sample;

always_ff @(posedge clk) begin
    if (reset) begin
        hardware_int_sample <= 5'b0;
    end else begin
        hardware_int_sample <= hardware_int[4:0];
    end
end

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
reg [31:0] cp0_reg_EBase    ;   // 15.1
reg [31:0] cp0_reg_Conf0    ;   // 16.0
reg [31:0] cp0_reg_Conf1    ;   // 16.1
reg [31:0] cp0_reg_TagLo0   ;   // 28.0
reg [31:0] cp0_reg_TagHi0   ;   // 29.0

reg timer_int;
wire [7:0] Cause_IP = {timer_int, hardware_int_sample, cp0_reg_Cause[9:8]};

wire allow_int = cp0_reg_Status[2:0] == 3'b001;
assign interrupt_pending = (|(cp0_reg_Status[15:8] & Cause_IP)) && allow_int;

assign epc       = cp0_reg_EPC;
assign tagLo0_o  = cp0_reg_TagLo0;
assign entryHi_o = cp0_reg_EntryHi;
assign entryLo0_o = cp0_reg_EntryLo0;
assign entryLo1_o = cp0_reg_EntryLo1;
assign pageMask_o = cp0_reg_PageMask[24:13];
assign tlbIndex_o = tlbrandom ? cp0_reg_Random : cp0_reg_Index;

wire SR_CU0 = cp0_reg_Status[28];
wire SR_BEV = cp0_reg_Status[22];
wire SR_EXL = cp0_reg_Status[1];
wire SR_ERL = cp0_reg_Status[2];
wire [1:0] SR_KSU = cp0_reg_Status[4:3];
wire CAUSE_IV = cp0_reg_Cause[23];

// See Table 6.8 / 6.9, Reference III
wire [31:0] ebase  = SR_BEV ? 32'hbfc00200 : {cp0_reg_EBase[31:12], 12'b0};
assign exc_handler = ebase + 32'h180;
assign int_handler = CAUSE_IV ? ebase + 32'h200 : ebase + 32'h180;
assign tlb_refill_handler = SR_EXL ? ebase + 32'h180 : ebase;

assign kseg0_cached = cp0_reg_Conf0[2:0] == 3'h3; // See Table 9.9, P. 98, Vol. III
assign kernel_mode = SR_KSU == 2'b00 || SR_EXL || SR_ERL; // See Section 3.2, P. 19, Vol. III
assign erl = SR_ERL;
assign privileged = SR_CU0 || kernel_mode; // See Section 3.5.3, P. 21, Vol. III

// TLB related
wire [`TLB_IDX_BITS-1:0] nRandom = cp0_reg_Random[`TLB_IDX_BITS-1:0] + 1'b1;
wire [31:0] cp0_reg_CauseR = { cp0_reg_Cause[31:16], Cause_IP, cp0_reg_Cause[7:0] };

const bit [31:0] INIT_Random   = 32'd31;
const bit [31:0] INIT_PageMask = 32'd0;
const bit [31:0] INIT_PRId     = 32'h00018003;
const bit [31:0] INIT_EBase    = 32'h80000000;
const bit [31:0] INIT_Status   = 32'h00400000;
const bit [31:0] INIT_Conf0    = {1'b1,3'b0,3'b0,9'b0,1'b0,2'b0,3'b0,3'b1,3'b0,1'b0,3'd3};
const bit [31:0] INIT_Conf1    = {1'b0,6'd31,IS,IL,IA,DS,DL,DA,7'd0};

// read
assign data_o = ({32{rw_number == cp0_nIndex    }} & cp0_reg_Index    ) |
                ({32{rw_number == cp0_nRandom   }} & cp0_reg_Random   ) |
                ({32{rw_number == cp0_nEntryLo0 }} & cp0_reg_EntryLo0 ) |
                ({32{rw_number == cp0_nEntryLo1 }} & cp0_reg_EntryLo1 ) |
                ({32{rw_number == cp0_nContext  }} & cp0_reg_Context  ) |
                ({32{rw_number == cp0_nPageMask }} & cp0_reg_PageMask ) |
                ({32{rw_number == cp0_nWired    }} & cp0_reg_Wired    ) |
                ({32{rw_number == cp0_nBadVAddr }} & cp0_reg_BadVAddr ) |
                ({32{rw_number == cp0_nCount    }} & cp0_reg_Count    ) |
                ({32{rw_number == cp0_nEntryHi  }} & cp0_reg_EntryHi  ) |
                ({32{rw_number == cp0_nCompare  }} & cp0_reg_Compare  ) |
                ({32{rw_number == cp0_nStatus   }} & cp0_reg_Status   ) |
                ({32{rw_number == cp0_nCause    }} & cp0_reg_CauseR   ) |
                ({32{rw_number == cp0_nEPC      }} & cp0_reg_EPC      ) |
                ({32{rw_number == cp0_nPRId     }} & INIT_PRId        ) |
                ({32{rw_number == cp0_nEBase    }} & cp0_reg_EBase    ) |
                ({32{rw_number == cp0_nConf0    }} & cp0_reg_Conf0    ) |
                ({32{rw_number == cp0_nConf1    }} & cp0_reg_Conf1    ) |
                ({32{rw_number == cp0_nTagLo0	}} & cp0_reg_TagLo0   ) |
                ({32{rw_number == cp0_nTagHi0   }} & cp0_reg_TagHi0   ) ;

reg count_add;
always_ff @(posedge clk) begin
    if (reset) begin
        cp0_reg_Index    <= 32'b0;
        cp0_reg_Random   <= INIT_Random;
        cp0_reg_EntryLo0 <= 32'b0;
        cp0_reg_EntryLo1 <= 32'b0;
        cp0_reg_Context  <= 32'b0;
        cp0_reg_PageMask <= INIT_PageMask;
        cp0_reg_Wired    <= 32'b0;
        cp0_reg_BadVAddr <= 32'b0;
        cp0_reg_Count    <= 32'b0;
        cp0_reg_EntryHi  <= 32'b0;
        cp0_reg_Compare  <= 32'b0;
        cp0_reg_Status   <= INIT_Status;
        cp0_reg_Cause    <= 32'b0;
        cp0_reg_EPC      <= 32'b0;
        cp0_reg_EBase    <= INIT_EBase;
        cp0_reg_Conf0    <= INIT_Conf0;
        cp0_reg_Conf1    <= INIT_Conf1;
        cp0_reg_TagLo0   <= 32'b0;
        cp0_reg_TagHi0   <= 32'b0;
        count_add        <= 1'b0;
        timer_int        <= 1'b0;
    end
    else begin
        count_add     <= ~count_add;
        if (!(we && rw_number == cp0_nCount)) begin
            cp0_reg_Count <= cp0_reg_Count + {31'd0, count_add};
        end
        if (cp0_reg_Compare != 32'b0 && cp0_reg_Compare == cp0_reg_Count) begin
            timer_int <= 1'b1;
        end else if (we && rw_number == cp0_nCompare) begin
            timer_int <= 1'b0;
        end

        if (en_exp_i) begin
            if (ewr_excCode == cERET) begin
                cp0_reg_Status[1] <= 1'b0;
            end else begin
                case (ewr_excCode)
                    cAdEL, cAdES: begin
                        cp0_reg_BadVAddr <= ewr_badVAddr;
                    end

                    cTLBL, cTLBS, cTLBMod: begin
                        cp0_reg_BadVAddr <= ewr_badVAddr;
                        cp0_reg_Context[22:4] <= ewr_badVAddr[31:13]; // P. 99, Vol. III
                        cp0_reg_EntryHi[31:13] <= ewr_badVAddr[31:13]; // P. 117, Vol. III
                    end
                endcase

                cp0_reg_Cause[6:2]     <= ewr_excCode;
                cp0_reg_Status[1]      <= 1'b1;

                if (!SR_EXL) begin
                    // These registers are only updated when not in EXL. See Table 9.25, P. 126, Vol. III.
                    cp0_reg_Cause[31]      <= ewr_bd;
                    cp0_reg_EPC            <= ewr_epc;
                end
            end
        end else if (we) begin
            case (rw_number)
                cp0_nIndex: begin
                    cp0_reg_Index[`TLB_IDX_BITS-1:0] <= data_i[`TLB_IDX_BITS-1:0];
                end
                cp0_nEntryLo0: begin
                    cp0_reg_EntryLo0[25:0]           <= data_i[25:0];
                end
                cp0_nEntryLo1: begin
                    cp0_reg_EntryLo1[25:0]           <= data_i[25:0];
                end
                cp0_nContext: begin
                    cp0_reg_Context[31:23]           <= data_i[31:23];
                end
                cp0_nPageMask: begin
                    cp0_reg_PageMask[28:13]          <= data_i[28:13];
                end
                cp0_nWired: begin
                    cp0_reg_Wired[`TLB_IDX_BITS-1:0] <= data_i[`TLB_IDX_BITS-1:0];
                    cp0_reg_Random[`TLB_IDX_BITS-1:0]<= INIT_Random;
                end
                cp0_nCount: begin
                    cp0_reg_Count                    <= data_i;
                end
                cp0_nEntryHi: begin
                    cp0_reg_EntryHi[31:13]           <= data_i[31:13];
                    cp0_reg_EntryHi[7:0]             <= data_i[7:0];
                end
                cp0_nCompare: begin
                    cp0_reg_Compare                  <= data_i;
                end
                cp0_nStatus: begin
                    cp0_reg_Status[28]               <= data_i[28];
                    cp0_reg_Status[22]               <= data_i[22];
                    cp0_reg_Status[15:8]             <= data_i[15:8];
                    cp0_reg_Status[4]                <= data_i[4];
                    cp0_reg_Status[1:0]              <= data_i[1:0];
                end
                cp0_nCause: begin
                    cp0_reg_Cause[23]                <= data_i[23];
                    cp0_reg_Cause[9:8]               <= data_i[9:8];
                end
                cp0_nEPC: begin
                    cp0_reg_EPC                      <= data_i;
                end
                cp0_nEBase: begin
                    cp0_reg_EBase[29:12]             <= data_i[29:12];
                end
                cp0_nConf0: begin
                    cp0_reg_Conf0[2:0]               <= data_i[2:0];
                end
                cp0_nTagLo0:begin
                    cp0_reg_TagLo0                   <= data_i;
                end
                default: begin
                    $display("unkown cp0 register number %d", rw_number);
                end
            endcase
        end else if (tlbr) begin
            cp0_reg_EntryHi  <= entryHi_i;
            cp0_reg_EntryLo0 <= entryLo0_i;
            cp0_reg_EntryLo1 <= entryLo1_i;
            cp0_reg_PageMask[24:13] <= pageMask_i;
        end else if (tlbp) begin
            cp0_reg_Index <= index_i;
        end else if (tlbrandom) begin
            cp0_reg_Random <= nRandom < cp0_reg_Wired ? cp0_reg_Wired : nRandom;
        end
    end
end

endmodule : CP0
