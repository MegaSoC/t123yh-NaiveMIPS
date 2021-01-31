`ifndef _NANOMIPS_GLOBAL_SVH
`define _NANOMIPS_GLOBAL_SVH

typedef enum {
    cInt  = 0, 
    cTLBMod = 1,
    cTLBL = 2, 
    cTLBS = 3,
    cAdEL = 4,
    cAdES = 5,
    cSys  = 8,
    cBp   = 9,
    cRI   = 10,
    cOv   = 12,
    cERET = 31  // treat eret as a special type of exception
} ExcCode_t;

typedef enum {
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

`endif