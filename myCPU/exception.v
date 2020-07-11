`include "my_global.h"

module exception(
    //output
    flush,
    wr_exp,
    clear_exl,
    exp_code,
    epc,
    badvaddr,
    badvaddr_we,
    exception_new_pc,
    //input
    clk,
    pc,
    mm_pc,
    data_vaddr,
    data_we,
    data_miss,
    inst_miss,
    data_illegal,
    inst_illegal,
    data_dirty,
    data_invalid,
    inst_invalid,
    eret,
    break,
    syscall,
    unknown_inst,
    in_delayslot,
    overflow,
    epc_in,
    allow_int,
    interrupt_flag,
    inst_sram_data_ok,
    ///***
    icache_stall,
    E_now_exp,
    inst_uncached
    ///***
);
input wire clk;
input wire[31:0] pc;
input wire[31:0] mm_pc;
input wire[31:0] data_vaddr;
input wire data_we;
input wire data_miss;
input wire inst_miss;
input wire data_illegal;
input wire inst_illegal;
input wire data_dirty;
input wire data_invalid;
input wire inst_invalid;
input wire eret;
input wire break;
input wire syscall;
input wire unknown_inst;
input wire in_delayslot;
input wire overflow;
input wire[31:0] epc_in;
input wire allow_int;
input wire[7:0] interrupt_flag;
input wire inst_sram_data_ok;
input wire icache_stall;
// input wire if_exl;
// input wire mm_exl;
// input wire is_real_inst; //??

output reg flush;
output reg wr_exp;
output reg clear_exl;
output reg[4:0] exp_code;
output reg[31:0] epc;
output reg[31:0] badvaddr;
output reg badvaddr_we;
output reg[31:0] exception_new_pc;
///***
output wire E_now_exp;
input wire inst_uncached;
///***

wire[31:0] exception_base;
wire boot_exp_vec;
assign boot_exp_vec = 1'b1;
assign exception_base = boot_exp_vec ? 32'hBFC00200 : 32'h80000000;

initial begin
    flush <= 1'b0;
end
///***
assign E_now_exp = (allow_int & interrupt_flag != 8'b0) | 
                   (data_dirty & data_we) |
                   inst_miss | data_miss |
                   inst_invalid | data_invalid |
                   inst_illegal | data_illegal | 
                   syscall | break | unknown_inst| overflow | eret ;
///***
always @(posedge clk) begin
    clear_exl <= 1'b0;
    badvaddr_we <= 1'b0;
    badvaddr <= 32'b0;
    if (allow_int & interrupt_flag != 8'b0) begin // Interrupt
        exp_code <= `EX_INTERRUPT;
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180;
        epc <= in_delayslot ? mm_pc : mm_pc + 32'h4; //soft_int pc+4 hardware_int has bug
        wr_exp <= 1'b1;
    end
    else if (data_dirty & data_we) begin //TLB modification exception
        exp_code <= `EX_MOD; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180; //reduce
        epc <= in_delayslot ? (pc - 32'h4) : pc; //can reduce
        wr_exp <= 1'b1; //can reduce
        badvaddr_we <= 1'b1;
        badvaddr <= data_vaddr;
    end
    else if (inst_miss) begin //TLB exception (load or instruction fetch)
        exp_code <= `EX_TLBL; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h0; //reduce
        epc <= in_delayslot ? (pc - 32'h4) : pc; //can reduce
        wr_exp <= 1'b1; //can reduce
        badvaddr_we <= 1'b1;
        badvaddr <= pc;
    end
    else if (data_miss) begin 
        exp_code <= data_we ? `EX_TLBS : `EX_TLBL; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h0; //reduce
        epc <= in_delayslot ? (pc - 32'h4) : pc; //can reduce
        wr_exp <= 1'b1; //can reduce
        badvaddr_we <= 1'b1;
        badvaddr <= data_vaddr;
    end
    else if (inst_invalid) begin
        exp_code <= `EX_TLBL; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180; //reduce
        epc <= in_delayslot ? (pc - 32'h4) : pc; //can reduce
        wr_exp <= 1'b1; //can reduce
        badvaddr_we <= 1'b1;
        badvaddr <= pc;
    end
    else if (data_invalid) begin 
        exp_code <= data_we ? `EX_TLBS : `EX_TLBL; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180; //reduce
        epc <= in_delayslot ? (pc - 32'h4) : pc; //can reduce
        wr_exp <= 1'b1; //can reduce
        badvaddr_we <= 1'b1;
        badvaddr <= data_vaddr;
    end
    else if (inst_illegal) begin //Address error exception (load or instruction fetch)
        badvaddr <= pc;
        badvaddr_we <= 1'b1;
        exp_code <= `EX_ADEL;
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180;
        epc <= in_delayslot ? (pc - 32'h4) : pc;
        wr_exp <= 1'b1;
    end
    else if (data_illegal) begin //Address error exception (store)
        badvaddr <= data_vaddr;
        badvaddr_we <= 1'b1;
        exp_code <= data_we ? `EX_ADES : `EX_ADEL; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180;
        epc <= in_delayslot ? (pc - 32'h4) : pc;
        wr_exp <= 1'b1;
    end
    else if (syscall) begin //Syscall exception
        exp_code <= `EX_SYS; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180;
        epc <= in_delayslot ? (pc - 32'h4) : pc;
        wr_exp <= 1'b1;
    end
    else if (break) begin //Breakpoint exception
        exp_code <= `EX_BP; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180;
        epc <= in_delayslot ? (pc - 32'h4) : pc;
        wr_exp <= 1'b1;
    end
    else if (unknown_inst) begin //Reserved instruction exception
        exp_code <= `EX_RI; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180;
        epc <= in_delayslot ? (pc - 32'h4) : pc;
        wr_exp <= 1'b1;
    end
    else if (overflow) begin //Arithmetic Overflow exception
        exp_code <= `EX_OV; 
        flush <= 1'b1;
        exception_new_pc <= exception_base + 32'h180;
        epc <= in_delayslot ? (pc - 32'h4) : pc;
        wr_exp <= 1'b1;
    end
//    else if (Tr) begin //Trap exception
//        exp_code <= `EX_TRAP; 
//    end
//    else if (CacheErr) begin
//        exp_code <= `EX_CACHEERR; 
//    end
    else if (eret) begin
        wr_exp <= 1'b0;
        clear_exl <= 1'b1;
        exception_new_pc <= epc_in;
        flush <= 1'b1;
    end
    else begin
        exp_code <= 0;
        wr_exp <= 1'b0;
        // exception_new_pc <= exception_base + 32'h180;
        // flush <= !inst_sram_data_ok ? 1 : 1'b0;
        if (inst_sram_data_ok | (!icache_stall & !inst_uncached))
            flush <= 1'b0;
    end
end

endmodule //exception