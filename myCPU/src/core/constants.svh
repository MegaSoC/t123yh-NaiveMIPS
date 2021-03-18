`timescale 1ns / 1ps

`include "../global.svh"

`ifndef _NANOMIPS_CONSTANTS_SVH
`define _NANOMIPS_CONSTANTS_SVH

`define aluDisabled 0
`define aluSub 1
`define aluOr 2
`define aluAnd 3
`define aluShiftLeft 4
`define aluAdd 5
`define aluNor 6
`define aluXor 7
`define aluShiftRight 8
`define aluArithmeticShiftRight 9
`define aluSLT 10
`define aluSLTU 11
`define aluSEQ 12
`define aluSNE 13
`define aluSGE 14
`define aluSGEU 15

`define cmpEqual 1
`define cmpNotEqual 2
`define cmpLessThanOrEqualToZero 3
`define cmpLessThanZero 4
`define cmpGreaterThanOrEqualToZero 5
`define cmpGreaterThanZero 6

`define memWidth4 2'b10
`define memWidth2 2'b01
`define memWidth1 2'b00

// `define DEBUG
// `define VERBOSE

`define grfWriteDisable 0
`define grfWriteALU 1
`define grfWriteMem 2
`define grfWritePC 3
`define grfWriteMul 4
`define grfWriteCP0 5
`define grfWriteBitCounter 6
`define grfWriteLLbit 7
`define grfWriteMove 8

`define absJumpImmediate 1
`define absJumpRegister 0

`define stageD 3'd1
`define stageE 3'd2
`define stageM 3'd3
`define stageW 3'd4

`define mtDisabled 0
`define mtMultiply 1
`define mtMultiplyUnsigned 2
`define mtDivide 3
`define mtDivideUnsigned 4
`define mtSetHI 5
`define mtSetLO 6
`define mtMSUB 7
`define mtMADD 8
`define mtMADDU 9
`define mtMSUBU 10

`define ctrlNoException 0
`define ctrlUnknownInstruction 1
`define ctrlERET 2
`define ctrlSyscall 3
`define ctrlBreak 4

typedef struct packed {
    bit [4:0] regRead1;
    bit [4:0] regRead2;
    bit [3:0] grfWriteSource;
    bit [4:0] destinationRegister;
    bit [31:0] immediate;

    bit mulEnable;
    bit mulOutputSel;
    bit [3:0] mulCtrl;

    bit memLoad;
    bit memStore;
    cache_op memICacheOp;
    cache_op memDCacheOp;
    bit memWaitForIdle;
    bit calculateAddress;
    bit [1:0] memWidthCtrl;
    bit memReadSignExtend;
    bit memUnaligned;
    bit memLeftPart;

    bit branch;
    bit branchLikely;
    bit [3:0] cmpCtrl;
    bit absJump;
    bit absJumpLoc; // 1 = immediate; 0 = register

    bit aluSrc;
    bit [3:0] aluCtrl;
    bit checkOverflow;
    bit trap;

    bit [2:0] generateException;
    bit writeCP0;
    cp0_number_t numberCP0;
    bit privileged;

    bit bitCounterEnable;
    bit bitCounterType;

    bit setLLbit;
    bit checkLLbit;

    bit move;
    bit moveCondition;

    tlb_op_t tlbop;
} ControlSignals;

localparam ControlSignals kControlNop = ControlSignals'{
    regRead1: 0,
    regRead2: 0,
    grfWriteSource: `grfWriteDisable,
    destinationRegister: 0,
    immediate: 'bx,

    mulEnable: 0,
    mulOutputSel: 'bx,
    mulCtrl: `mtDisabled,

    memLoad: 0,
    memStore: 0,
    memICacheOp: CACHE_NOP,
    memDCacheOp: CACHE_NOP,
    memWaitForIdle: 0,
    calculateAddress: 0,
    memWidthCtrl: 0,
    memReadSignExtend: 0,
    memUnaligned: 0,
    memLeftPart: 0,

    branch: 0,
    branchLikely: 0,
    cmpCtrl: 'bx,
    absJump: 0,
    absJumpLoc: 'bx,

    aluSrc: 0,
    aluCtrl: `aluDisabled,
    checkOverflow: 0,
    trap: 0,

    generateException: `ctrlNoException,
    writeCP0: 0,
    numberCP0: cp0_nX,
    privileged: 0,

    bitCounterEnable: 0,
    bitCounterType: 'bx,

    setLLbit: 0,
    checkLLbit: 0,

    move: 0,
    moveCondition: 'bx,

    tlbop: tlb_op_t'{p: 0, r: 0, w: 0, random: 0}
};

`endif
