`include "my_global.vh"

module exception(
        input wire clk,
        input wire reset,
        input wire [31:0] E_EPC,
        input wire [31:0] pc,
        input wire [31:0] mm_pc,
        input wire [31:0] data_vaddr,
        input wire data_we,
        input wire DataMiss,
        input wire InstMiss,
        input wire IllegalData,
        input wire IllegalInst,
        input wire DirtyData,
        input wire data_invalid,
        input wire inst_invalid,
        input wire eret,
        input wire my_break,
        input wire syscall,
        input wire unknown_inst,
        input wire in_delayslot,
        input wire overflow,
        input wire [31:0] epc_in,
        input wire allow_int,
        input wire [7:0] interrupt_flag,
        input wire inst_sram_data_ok,
        input wire icache_stall,
        input wire SR_BEV,
        input wire SR_EXL,
        input wire CAUSE_IV,
        input wire [31:0] ebase,

        output reg flush,
        output reg vice_flush1,
        output reg vice_flush2,
        output reg vice_flush3,
        output reg CP0_WrExp,
        output reg clear_exl,
        output reg[4:0] ExcCode,
        output reg[31:0] epc,
        output reg[31:0] badvaddr,
        output reg badvaddr_we,
        output reg[31:0] NewExceptionPC,
        output wire E_CurrentException,
        input wire inst_uncached,

        input wire trap
    );

    wire [31:0] base = SR_BEV ? 32'hbfc00200 : ebase;

    assign E_CurrentException = (allow_int && interrupt_flag != 8'b0) |
                                (DirtyData && data_we) |
                                InstMiss | DataMiss |
                                inst_invalid | data_invalid |
                                IllegalInst | IllegalData |
                                syscall | my_break | unknown_inst| overflow | eret | trap;
    always_ff @(posedge clk) begin
        if (reset) begin
            ExcCode        <= 5'b0;
            badvaddr_we    <= 1'b0;
            badvaddr       <= 32'b0;
            flush          <= 1'b0;
            vice_flush1    <= 1'b0;
            vice_flush2    <= 1'b0;
            vice_flush3    <= 1'b0;
            NewExceptionPC <= 32'b0;
            epc            <= 32'b0;
            CP0_WrExp      <= 1'b0;
            clear_exl      <= 1'b0;
        end else begin
            if (allow_int && interrupt_flag != 8'b0) begin
                ExcCode        <= `EX_INTERRUPT;
                badvaddr_we    <= 1'b0;
                badvaddr       <= 32'b0;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= CAUSE_IV ? base + 32'h200 : base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (IllegalInst) begin
                ExcCode        <= `EX_ADEL;
                badvaddr_we    <= 1'b1;
                badvaddr       <= pc;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (InstMiss) begin 
                ExcCode        <= `EX_TLBL;
                badvaddr_we    <= 1'b1;
                badvaddr       <= pc;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= SR_EXL? base + 32'h180 : base;
                epc            <= SR_EXL? epc_in : E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (inst_invalid) begin
                ExcCode        <= `EX_TLBL;
                badvaddr_we    <= 1'b1;
                badvaddr       <= pc;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (unknown_inst) begin
                ExcCode        <= `EX_RI;
                badvaddr_we    <= 1'b0;
                badvaddr       <= 32'b0;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (overflow) begin
                ExcCode        <= `EX_OV;
                badvaddr_we    <= 1'b0;
                badvaddr       <= 32'b0;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (syscall) begin
                ExcCode        <= `EX_SYS;
                badvaddr_we    <= 1'b0;
                badvaddr       <= 32'b0;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (my_break) begin
                ExcCode        <= `EX_BP;
                badvaddr_we    <= 1'b0;
                badvaddr       <= 32'b0;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (trap) begin
                ExcCode        <= `EX_TRAP;
                badvaddr_we    <= 1'b0;
                badvaddr       <= 32'b0;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (IllegalData) begin
                ExcCode        <= data_we ? `EX_ADES : `EX_ADEL;
                badvaddr_we    <= 1'b1;
                badvaddr       <= data_vaddr;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (DataMiss) begin
                ExcCode        <= data_we ? `EX_TLBS : `EX_TLBL;
                badvaddr_we    <= 1'b1;
                badvaddr       <= data_vaddr;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= SR_EXL? base + 32'h180 : base;
                epc            <= SR_EXL? epc_in : E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (data_invalid) begin
                ExcCode        <= data_we ? `EX_TLBS : `EX_TLBL;
                badvaddr_we    <= 1'b1;
                badvaddr       <= data_vaddr;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (DirtyData && data_we) begin
                ExcCode        <= `EX_MOD;
                badvaddr_we    <= 1'b1;
                badvaddr       <= data_vaddr;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= base + 32'h180;
                epc            <= E_EPC;
                CP0_WrExp      <= 1'b1;
                clear_exl      <= 1'b0;
            end
            else if (eret) begin
                badvaddr_we    <= 1'b0;
                badvaddr       <= 32'b0;
                flush          <= 1'b1;
                vice_flush1    <= 1'b1;
                vice_flush2    <= 1'b1;
                vice_flush3    <= 1'b1;
                NewExceptionPC <= epc_in;
                CP0_WrExp      <= 1'b0;
                clear_exl      <= 1'b1;
            end
            else begin
                badvaddr_we    <= 1'b0;
                badvaddr       <= 32'b0;
                ExcCode        <= 0;
                CP0_WrExp      <= 1'b0;
                if (inst_sram_data_ok | (!icache_stall & !inst_uncached))begin
                    flush       <= 1'b0;
                    vice_flush1 <= 1'b0;
                    vice_flush2 <= 1'b0;
                    vice_flush3 <= 1'b0;
                end
                clear_exl      <= 1'b0;
            end
        end
    end

endmodule
