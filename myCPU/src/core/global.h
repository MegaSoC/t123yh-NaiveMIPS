`ifdef GLOBAL_H
`else
`define GLOBAL_H

`timescale 1ns / 1ps

//----------------------------------------------------------

`define INSTRBUS_WIDTH  58

`define INIT_STATUS     32'H00400000
`define INIT_PRID       32'H00004220

`define INIT_SRSCTRL    32'H00000000
`define INIT_SRSMAP     32'H00000000
`define INIT_INTCTRL    32'Hfc000000
 
 /*Exception encoding*/
 `define EX_INTERRUPT    6'D0
 `define EX_MOD          6'D1
 `define EX_TLBL         6'D2
 `define EX_TLBS         6'D3
 `define EX_ADEL         6'D4
 `define EX_ADES         6'D5
 `define EX_SYS          6'D8
 `define EX_BP           6'D9
 `define EX_RI           6'D10
 `define EX_OV           6'D12
 `define EX_TRAP         6'D13
 `define EX_FPE          6'D15
 `define EX_CACHEERR     6'D30
 
 /*Exception Entry Addr*/
 `define EX_ENTRY_RESET  32'Hbfc00000
 `define EX_ENTRY_BEV1   32'Hbfc00200
 `define EX_ENTRY_BEV0   32'H80000000
 
//                  number
`define CP0_Index    5'D0
`define CP0_Random   5'D1
`define CP0_EntryLo0 5'D2
`define CP0_EntryLo1 5'D3
`define CP0_Context  5'D4
`define CP0_PageMask 5'D5
`define CP0_Wired    5'D6
`define CP0_BadVAddr 5'D8
`define CP0_Count    5'D9
`define CP0_EntryHi  5'D10
`define CP0_Compare  5'D11
`define CP0_Status   5'D12
`define CP0_Cause    5'D13
`define CP0_EPC      5'D14
`define CP0_PRId     5'D15
// TagLo TagHi
`define CP0_ErrorEPC 5'D30

 
`endif
