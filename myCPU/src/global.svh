`ifndef _NANOMIPS_GLOBAL_SVH
`define _NANOMIPS_GLOBAL_SVH

`define TLB_IDX_BITS 	5

`define ICACHE_WORD_PER_LINE 16
`define ICACHE_SET_ASSOC 4
`define ICACHE_SIZE (16*1024)
`define ICACHE_TAG_WIDTH (32 - $clog2(`ICACHE_SIZE/`ICACHE_SET_ASSOC))
`define DCACHE_WORD_PER_LINE 16
`define DCACHE_SET_ASSOC 4
`define DCACHE_SIZE (16*1024)
`define DCACHE_TAG_WIDTH (32 - $clog2(`DCACHE_SIZE/`DCACHE_SET_ASSOC))
`define MEM_WRITE_FIFO_DEPTH 4 

localparam [2:0] IS = $clog2(`ICACHE_SIZE/`ICACHE_SET_ASSOC/`ICACHE_WORD_PER_LINE/4/64);
localparam [2:0] IL = $clog2(`ICACHE_WORD_PER_LINE*4) - 1;
localparam [2:0] IA = `ICACHE_SET_ASSOC - 1;
localparam [2:0] DS = $clog2(`DCACHE_SIZE/`DCACHE_SET_ASSOC/`DCACHE_WORD_PER_LINE/4/64);
localparam [2:0] DL= $clog2(`DCACHE_WORD_PER_LINE*4) - 1;
localparam [2:0] DA = `DCACHE_SET_ASSOC - 1;


typedef enum logic [4:0] {
    cNone   = 5'bx,
    cInt    = 5'd0,
    cTLBMod = 5'd1,
    cTLBL   = 5'd2,
    cTLBS   = 5'd3,
    cAdEL   = 5'd4,
    cAdES   = 5'd5,
    cSys    = 5'd8,
    cBp     = 5'd9,
    cRI     = 5'd10,
    cCpU    = 5'd11,
    cOv     = 5'd12,
    cTr     = 5'd13,
    cERET   = 5'd31  // treat eret as a special type of exception
} ExcCode_t;

typedef enum logic [7:0] {
    cp0_nX          = 8'bx,
    cp0_nIndex      = 8'b00000000,
    cp0_nRandom     = 8'b00001000,
    cp0_nEntryLo0   = 8'b00010000,
    cp0_nEntryLo1   = 8'b00011000,
    cp0_nContext    = 8'b00100000,
    cp0_nPageMask   = 8'b00101000,
    cp0_nWired      = 8'b00110000,
    cp0_nBadVAddr   = 8'b01000000,
    cp0_nCount      = 8'b01001000,
    cp0_nEntryHi    = 8'b01010000,
    cp0_nCompare    = 8'b01011000,
    cp0_nStatus     = 8'b01100000,
    cp0_nCause      = 8'b01101000,
    cp0_nEPC        = 8'b01110000,
    cp0_nPRId       = 8'b01111000,
    cp0_nEBase      = 8'b01111001,
    cp0_nConf0      = 8'b10000000,
    cp0_nConf1      = 8'b10000001,
    cp0_nTagLo0     = 8'b11100000,
    cp0_nTagHi0     = 8'b11101000,
    cp0_nErrorEPC   = 8'b11110000
} cp0_number_t;

typedef enum logic [2:0] {
    CACHE_NOP = 0,
    CACHE_INDEX_WRITEBACK_INVALIDATE,
    CACHE_INDEX_STORE_TAG,
    CACHE_HIT_WRITEBACK_INVALIDATE,
    CACHE_HIT_INVALIDATE
} cache_op;

typedef struct packed {
    bit p;
    bit r;
    bit w;
    bit random;
} tlb_op_t;

`endif
