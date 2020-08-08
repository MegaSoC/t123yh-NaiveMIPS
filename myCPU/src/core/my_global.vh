`ifdef MYGLOBAL
`else
`define MYGLOBAL

`timescale 1ns / 1ps

`define INIT_Random 	31
`define INIT_PAGEMASKK  32'b0
`define INIT_PRID       32'H00004220
`define INIT_EBASE 		32'H80000000
`define INIT_STATUS     32'H00400000
`define INIT_CONF0 		{1'b1,3'b0,3'b0,9'b0,1'b0,2'b0,3'b0,3'b1,3'b0,1'b0,3'b11}
`define INIT_CONF1   	{32'b0}
`define INIT_SRSCTRL    32'H00000000
`define INIT_SRSMAP     32'H00000000
`define INIT_INTCTRL    32'Hfc000000
`define TLB_ENTRIES 	32
`define TLB_IDX_BITS 	5
 
 `define EX_INTERRUPT    6'D0
 `define EX_MOD          6'D1
 `define EX_TLBL         6'D2
 `define EX_TLBS         6'D3
 `define EX_ADEL         6'D4
 `define EX_ADES         6'D5
 `define EX_SYS          6'D8
 `define EX_BP           6'D9
 `define EX_RI           6'D10
 `define EX_CPU 	     6'D11
 `define EX_OV           6'D12
 `define EX_TRAP         6'D13
 `define EX_FPE          6'D15
 `define EX_CACHEERR     6'D30
 
 
 `define EX_ENTRY_RESET  32'Hbfc00000
 `define EX_ENTRY_BEV1   32'Hbfc00200
 `define EX_ENTRY_BEV0   32'H80000000
 
`define CP0_Index      8'b00000_000
`define CP0_Random     8'b00001_000
`define CP0_EntryLo0   8'b00010_000
`define CP0_EntryLo1   8'b00011_000
`define CP0_Context    8'b00100_000
`define CP0_PageMask   8'b00101_000
`define CP0_Wired      8'b00110_000
`define CP0_BadVAddr   8'b01000_000
`define CP0_Count      8'b01001_000
`define CP0_EntryHi    8'b01010_000
`define CP0_Compare    8'b01011_000
`define CP0_Status     8'b01100_000
`define CP0_Cause      8'b01101_000
`define CP0_EPC        8'b01110_000
`define CP0_PRId	   8'b01111_000
`define CP0_EBase 	   8'b01111_001
`define CP0_Conf0 	   8'b10000_000
`define CP0_Conf1 	   8'b10000_001
`define CP0_TagLo0     8'b11100_000
`define CP0_TagHi0     8'b11101_000
`define CP0_ErrorEPC   8'b11110_000

`define INSTRBUS_WIDTH  88
`define InstrWireSetWithOutNop    lb,lbu,lh,lhu,lw,sb,sh,sw,\
						          addi,addiu,add,addu,sub,subu,\
						          lui,ori,my_And,my_Or,my_Xor,my_Nor,Andi,Xori,\
						          beq,bne,blez,bgtz,bltz,bgez,bltzal,bgezal,j,jal,jr,jalr,\
						          mult,multu,div,divu,mfhi,mthi,mflo,mtlo,\
						          sll,srl,sra,sllv,srlv,srav,\
						          slt,slti,sltu,sltiu,mfc0,mtc0,eret,\
						          my_break, syscall, tlbp, tlbr, tlbwi, tlbwr, cache,lwl,lwr,swl,swr,mul,\
						          teq,teqi,tge,tgei,tgeiu,tgeu,tlt,tlti,tltiu,tltu,tne,tnei,\
						          beql,bgezall,bgezl,bgtzl,blezl,bltzall,bltzl,bnel
						          
`define INSTR_SET `InstrWireSetWithOutNop,nop
 
`endif
