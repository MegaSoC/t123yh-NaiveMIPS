`include "my_global.vh"

module exception(
        input wire clk,
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
        input wire[31:0] epc_in,
        input wire allow_int,
        input wire[7:0] interrupt_flag,
        input wire inst_sram_data_ok,
        input wire icache_stall,

        output reg flush,
        output reg vice_flush1,
        output reg vice_flush2,
        output reg vice_flush3,
        output reg wr_exp,
        output reg clear_exl,
        output reg[4:0] ExcCode,
        output reg[31:0] epc,
        output reg[31:0] badvaddr,
        output reg badvaddr_we,
        output reg[31:0] NewExceptionPC,
        output wire E_CurrentException,
        input wire inst_uncached
    );


    wire[31:0] EBase  = 32'hBFC00200;

    initial begin
        flush <= 1'b0;
        vice_flush1 <= 1'b0;
        vice_flush2 <= 1'b0;
        vice_flush3 <= 1'b0;
    end
    assign E_CurrentException = (allow_int & interrupt_flag != 8'b0) |
           (DirtyData & data_we) |
           InstMiss | DataMiss |
           inst_invalid | data_invalid |
           IllegalInst | IllegalData |
           syscall | my_break | unknown_inst| overflow | eret;
    always @(posedge clk) begin
        clear_exl <= 1'b0;
        badvaddr_we <= 1'b0;
        badvaddr <= 32'b0;
        if (allow_int & interrupt_flag != 8'b0) begin
            ExcCode <= `EX_INTERRUPT;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (DirtyData & data_we) begin
            ExcCode <= `EX_MOD;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= data_vaddr;
        end
        else if (InstMiss) begin
            ExcCode <= `EX_TLBL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h0;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= pc;
        end
        else if (DataMiss) begin
            ExcCode <= data_we ? `EX_TLBS : `EX_TLBL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h0;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= data_vaddr;
        end
        else if (inst_invalid) begin
            ExcCode <= `EX_TLBL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= pc;
        end
        else if (data_invalid) begin
            ExcCode <= data_we ? `EX_TLBS : `EX_TLBL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= data_vaddr;
        end
        else if (IllegalInst) begin
            badvaddr <= pc;
            badvaddr_we <= 1'b1;
            ExcCode <= `EX_ADEL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (IllegalData) begin
            badvaddr <= data_vaddr;
            badvaddr_we <= 1'b1;
            ExcCode <= data_we ? `EX_ADES : `EX_ADEL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (syscall) begin
            ExcCode <= `EX_SYS;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (my_break) begin
            ExcCode <= `EX_BP;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (unknown_inst) begin
            ExcCode <= `EX_RI;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (overflow) begin
            ExcCode <= `EX_OV;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            NewExceptionPC <= EBase + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (eret) begin
            wr_exp <= 1'b0;
            clear_exl <= 1'b1;
            NewExceptionPC <= epc_in;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
        end
        else begin
            ExcCode <= 0;
            wr_exp <= 1'b0;
            if (inst_sram_data_ok | (!icache_stall & !inst_uncached))begin
                flush <= 1'b0;
                vice_flush1 <= 1'b0;
                vice_flush2 <= 1'b0;
                vice_flush3 <= 1'b0;
            end
        end
    end

endmodule
