module cp0(
    input wire clk,
    input wire rst,

    input wire          we,
    input wire [6:0]    addr,
    input wire [31:0]   data_i,
    output reg  [31:0]  data_o,

    input wire          clear_exl,
    input wire          en_exp_i,
    input wire          exp_bd,
    input wire [31:0]   exp_epc,
    input wire [4:0]    exp_excCode,
    input wire [31:0]   exp_badVAddr,
    input wire          exp_badVAddr_we,

    output wire [31:0]  epc,
    output wire [31:0]  exc_handler,
    output wire [31:0]  int_handler,
    output wire [31:0]  tlb_refill_handler,

    input wire [4:0]    hardware_int, // must be synced to clk before passing in!
    output wire         interrupt_pending
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
reg [31:0] cp0_reg_EBase    ;   // 15.1
reg [31:0] cp0_reg_Conf0    ;   // 16.0
reg [31:0] cp0_reg_Conf1    ;   // 16.1
reg [31:0] cp0_reg_TagLo0   ;   // 28.0
reg [31:0] cp0_reg_TagHi0   ;   // 29.0

wire [7:0] raddr = addr;
wire [7:0] waddr = addr;

reg timer_int;
wire [7:0] Cause_IP = {timer_int, hardware_int, cp0_reg_Cause[9:8]};

wire allow_int = cp0_reg_Status[2:0] == 3'b001 & !en_exp_i;
wire interrupt_flag = |(cp0_reg_Status[15:8] & Cause_IP);

assign epc       = cp0_reg_EPC;

alias SR_BEV = cp0_reg_Status[22];
alias SR_EXL = cp0_reg_Status[1];
alias SR_ERL = cp0_reg_Status[2];
alias CAUSE_IV = cp0_reg_Cause[23];

// See Table 6.8 / 6.9, Reference III
wire [31:0] ebase  = SR_BEV ? 32'hbfc00200 : {cp0_reg_EBase[31:12], 12'b0};
assign exc_handler = ebase + 32'h180;
assign int_handler = CAUSE_IV ? ebase + 32'h200 : ebase + 32'h180;
assign tlb_refill_handler = SR_EXL ? ebase + 32'h180 : ebase;

// TLB related
wire [`TLB_IDX_BITS-1:0] nRandom = cp0_reg_Random[`TLB_IDX_BITS-1:0] + 1'b1;
wire [31:0] cp0_reg_CauseR = { cp0_reg_Cause[31:16], Cause_IP, cp0_reg_Cause[7:0] };
// read
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
                ({32{raddr == `CP0_Cause    }} & cp0_reg_CauseR   ) |
                ({32{raddr == `CP0_EPC      }} & cp0_reg_EPC      ) |
                ({32{raddr == `CP0_PRId     }} & `INIT_PRID       ) |
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
        cp0_reg_EBase    <= `INIT_EBASE;
        cp0_reg_Conf0    <= `INIT_CONF0;
        cp0_reg_Conf1    <= `INIT_CONF1;
        cp0_reg_TagLo0   <= 32'b0;
        cp0_reg_TagHi0   <= 32'b0;
        count_add        <= 1'b0;
        timer_int        <= 1'b0;
    end
    else begin
        count_add     <= ~count_add;
        if (!(we && addr == `CP0_Count)) begin
            cp0_reg_Count <= cp0_reg_Count + {31'd0, count_add};
        end
        if (cp0_reg_Compare != 32'b0 && cp0_reg_Compare == cp0_reg_Count) begin
            timer_int <= 1'b1;
        end else if (we && addr == `CP0_Compare) begin
            timer_int <= 1'b0;
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
                `CP0_TagLo0:begin
                    cp0_reg_TagLo0                   <= data_i;
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
                if (exp_badVAddr_we) begin
                    cp0_reg_BadVAddr      <= exp_badVAddr;
                    cp0_reg_Context[22:4] <= exp_badVAddr[31:13];
                    cp0_reg_EntryHi[31:13] <= exp_badVAddr[31:13]; 
                end
                cp0_reg_Cause[6:2]     <= exp_excCode;
                cp0_reg_Status[1]      <= 1'b1; 

                // These registers are not updated when EXL is 1. See Table 9.25, P.126, Reference III
                if (!SR_EXL) begin
                    cp0_reg_Cause[31]      <= exp_bd; 
                    cp0_reg_EPC            <= exp_epc;
                end
            end
            else if (clear_exl) begin
                cp0_reg_Status[1] <= 1'b0;
            end
        end
    end
end

endmodule