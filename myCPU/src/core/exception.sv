`include "my_global.vh"

module exception(
        input wire clk,
        input wire [31:0] E_EPC,
        input wire [31:0] pc,
        input wire [31:0] mm_pc,
        input wire [31:0] data_vaddr,
        input wire data_we,
        input wire data_miss,
        input wire inst_miss,
        input wire data_illegal,
        input wire inst_illegal,
        input wire data_dirty,
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
        output reg[4:0] exp_code,
        output reg[31:0] epc,
        output reg[31:0] badvaddr,
        output reg badvaddr_we,
        output reg[31:0] exception_new_pc,
        output wire E_now_exp,
        input wire inst_uncached
    );


    wire[31:0] exception_base;
    wire boot_exp_vec;
    assign boot_exp_vec = 1'b1;
    assign exception_base = boot_exp_vec ? 32'hBFC00200 : 32'h80000000;

    initial begin
        flush <= 1'b0;
        vice_flush1 <= 1'b0;
        vice_flush2 <= 1'b0;
        vice_flush3 <= 1'b0;
    end
    assign E_now_exp = (allow_int & interrupt_flag != 8'b0) |
           (data_dirty & data_we) |
           inst_miss | data_miss |
           inst_invalid | data_invalid |
           inst_illegal | data_illegal |
           syscall | my_break | unknown_inst| overflow | eret ;
    always @(posedge clk) begin
        clear_exl <= 1'b0;
        badvaddr_we <= 1'b0;
        badvaddr <= 32'b0;
        if (allow_int & interrupt_flag != 8'b0) begin
            exp_code <= `EX_INTERRUPT;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (data_dirty & data_we) begin
            exp_code <= `EX_MOD;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= data_vaddr;
        end
        else if (inst_miss) begin
            exp_code <= `EX_TLBL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h0;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= pc;
        end
        else if (data_miss) begin
            exp_code <= data_we ? `EX_TLBS : `EX_TLBL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h0;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= data_vaddr;
        end
        else if (inst_invalid) begin
            exp_code <= `EX_TLBL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= pc;
        end
        else if (data_invalid) begin
            exp_code <= data_we ? `EX_TLBS : `EX_TLBL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
            badvaddr_we <= 1'b1;
            badvaddr <= data_vaddr;
        end
        else if (inst_illegal) begin
            badvaddr <= pc;
            badvaddr_we <= 1'b1;
            exp_code <= `EX_ADEL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (data_illegal) begin
            badvaddr <= data_vaddr;
            badvaddr_we <= 1'b1;
            exp_code <= data_we ? `EX_ADES : `EX_ADEL;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (syscall) begin
            exp_code <= `EX_SYS;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (my_break) begin
            exp_code <= `EX_BP;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (unknown_inst) begin
            exp_code <= `EX_RI;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (overflow) begin
            exp_code <= `EX_OV;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
            exception_new_pc <= exception_base + 32'h180;
            epc <= E_EPC;
            wr_exp <= 1'b1;
        end
        else if (eret) begin
            wr_exp <= 1'b0;
            clear_exl <= 1'b1;
            exception_new_pc <= epc_in;
            flush <= 1'b1;
            vice_flush1 <= 1'b1;
            vice_flush2 <= 1'b1;
            vice_flush3 <= 1'b1;
        end
        else begin
            exp_code <= 0;
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
