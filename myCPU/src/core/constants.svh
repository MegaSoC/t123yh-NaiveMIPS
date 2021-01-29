`timescale 1ns / 1ps

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

`define ctrlNoException 0
`define ctrlUnknownInstruction 1
`define ctrlERET 2
`define ctrlSyscall 3
`define ctrlBreak 4

`define causeInt 0
`define causeERET 16
`define causeAdEL 4
`define causeAdES 5
`define causeRI 10
`define causeOv 12
`define causeSyscall 8
`define causeBreak 9

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
    bit calculateAddress;
    bit [1:0] memWidthCtrl;
    bit memReadSignExtend;

    bit branch;
    bit [3:0] cmpCtrl;
    bit absJump;
    bit absJumpLoc; // 1 = immediate; 0 = register

    bit aluSrc;
    bit [3:0] aluCtrl;
    bit checkOverflow;

    bit [2:0] generateException;
    bit writeCP0;
    bit [4:0] numberCP0;
} ControlSignals;

const ControlSignals kControlNop = '{
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
    calculateAddress: 0,
    memWidthCtrl: 0, 
    memReadSignExtend: 0, 

    branch: 0, 
    cmpCtrl: 'bx, 
    absJump: 0, 
    absJumpLoc: 'bx,

    aluSrc: 0, 
    aluCtrl: `aluDisabled, 
    checkOverflow: 0, 

    generateException: `ctrlNoException, 
    writeCP0: 0, 
    numberCP0: 0
};

`endif