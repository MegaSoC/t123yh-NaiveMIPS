`include "constants.v"

module Controller (
           input [31:0] instruction,
           input [31:0] debugPC,
           input [2:0] currentStage,
           input reset,
           input bubble,

           output logic [4:0] regRead1,
           output logic [4:0] regRead2,
           output logic regRead1Required,
           output logic regRead2Required,

           output logic [3:0] mulCtrl,
           output mulEnable,
           output logic mulOutputSel,

           output logic memLoad,
           output logic [1:0] memWidthCtrl,
           output logic memReadSignExtend,
           output logic memStore,
           output logic branch,
           output logic [31:0] immediate,
           output logic [4:0] destinationRegister,
           output logic aluSrc,
           output logic [3:0] aluCtrl,
           output logic [3:0] cmpCtrl,
           output logic absJump,
           output logic absJumpLoc, // 1 = immediate, 0 = register
           output logic [3:0] grfWriteSource,
           output logic checkOverflow,
           output logic [2:0] generateException,
           output logic writeCP0,
           output logic [4:0] numberCP0,

           output logic bye
       );

wire [5:0] opcode = instruction[31:26];
wire [5:0] funct = instruction[5:0];

wire [4:0] rti = instruction[20:16];
wire [4:0] rsi = instruction[25:21];
wire [4:0] rdi = instruction[15:11];

wire[25:0] bigImm = instruction[25:0];
wire [15:0] imm = instruction[15:0];
wire [31:0] zeroExtendedImmediate = imm;
wire [31:0] shiftedImmediate = {imm, 16'b0};
wire [31:0] signExtendedImmediate = $signed(imm);

assign mulEnable = mulCtrl != `mtDisabled;

const bit [4:0] reg_ra = 31;

const bit [5:0] R = 6'b000000;
const bit [5:0] REGIMM = 6'b000001;
const bit [5:0] ori = 6'b001101;
const bit [5:0] andi = 6'b001100;
const bit [5:0] xori = 6'b001110;
const bit [5:0] lw = 6'b100011;
const bit [5:0] sw = 6'b101011;
const bit [5:0] beq = 6'b000100;
const bit [5:0] bne = 6'b000101;
const bit [5:0] blez = 6'b000110;
const bit [5:0] bgtz = 6'b000111;
const bit [5:0] lui = 6'b001111;
const bit [5:0] jal = 6'b000011;
const bit [5:0] addiu = 6'b001001;
const bit [5:0] addi = 6'b001000;
const bit [5:0] j = 6'b000010;
const bit [5:0] lb = 6'b100000;
const bit [5:0] lbu = 6'b100100;
const bit [5:0] lh = 6'b100001;
const bit [5:0] lhu = 6'b100101;
const bit [5:0] sb = 6'b101000;
const bit [5:0] sh = 6'b101001;
const bit [5:0] special2 = 6'b011100;
const bit [5:0] cop0 = 6'b010000;

const bit [5:0] addu = 6'b100001;
const bit [5:0] add = 6'b100000;
const bit [5:0] subu = 6'b100011;
const bit [5:0] sub = 6'b100010;
const bit [5:0] _and = 6'b100100;
const bit [5:0] _or = 6'b100101;
const bit [5:0] _xor = 6'b100110;
const bit [5:0] _nor = 6'b100111;
const bit [5:0] sll = 6'b000000;
const bit [5:0] srl = 6'b000010;
const bit [5:0] sra = 6'b000011;
const bit [5:0] sllv = 6'b000100;
const bit [5:0] srlv = 6'b000110;
const bit [5:0] srav = 6'b000111;
const bit [5:0] jalr = 6'b001001;
const bit [5:0] mult = 6'b011000;
const bit [5:0] multu = 6'b011001;
const bit [5:0] div = 6'b011010;
const bit [5:0] divu = 6'b011011;
const bit [5:0] mfhi = 6'b010000;
const bit [5:0] mflo = 6'b010010;
const bit [5:0] mthi = 6'b010001;
const bit [5:0] mtlo = 6'b010011;
const bit [5:0] msub = 6'b000100;
const bit [5:0] madd = 6'b000000;
const bit [5:0] maddu = 6'b000001;
const bit [5:0] eret = 6'b011000;

const bit [4:0] bltz = 5'b00000;
const bit [4:0] bgez = 5'b00001;
const bit [4:0] bltzal = 5'b10000;
const bit [4:0] bgezal = 5'b10001;

const bit [4:0] mfc0 = 5'b00000;
const bit [4:0] mtc0 = 5'b00100;

const bit [5:0] slt = 6'b101010;
const bit [5:0] sltu = 6'b101011;
const bit [5:0] slti = 6'b001010;
const bit [5:0] sltiu = 6'b001011;

const bit [5:0] jr = 6'b001000;
const bit [5:0] syscall = 6'b001100;
const bit [5:0] _break = 6'b001101;

const bit debug = 1;

always_comb begin
    regRead1Required = 0;
    regRead2Required = 0;
    if (currentStage == `stageD) begin
        if (absJump || branch) begin
            regRead1Required = 1;
            regRead2Required = 1;
        end
    end
    else if (currentStage == `stageE) begin
        if (aluCtrl != `aluDisabled || mulCtrl != `mtDisabled) begin
            regRead1Required = 1;
            if (aluSrc == 0)
                regRead2Required = 1;
        end
    end
    else if (currentStage == `stageM) begin
        if (memStore) begin
            regRead2Required = 1;
        end
    end
    else if (currentStage == `stageW) begin
        if (writeCP0) begin
            regRead1Required = 1;
        end
    end
end

`define simpleALU \
    regRead1 = rsi; \
    regRead2 = rti;\
    grfWriteSource = `grfWriteALU; \
    destinationRegister = rdi;

`define simpleShift \
    regRead1 = rti; \
    grfWriteSource = `grfWriteALU; \
    destinationRegister = rdi; \
    aluSrc = 1; \
    immediate = instruction[10:6];

`define simpleShiftVariable \
    regRead1 = rti; \
    regRead2 = rsi; \
    grfWriteSource = `grfWriteALU; \
    destinationRegister = rdi;

`define simpleALUImmediate \
    regRead1 = rsi; \
    grfWriteSource = `grfWriteALU; \
    destinationRegister = rti; \
    aluSrc = 1;

`define simpleBranch \
    regRead1 = rsi; \
    branch = 1; \
    immediate = signExtendedImmediate;

`define simpleMemoryLoad \
    regRead1 = rsi; \
    memLoad = 1; \
    grfWriteSource = `grfWriteMem; \
    destinationRegister = rti; \
    aluSrc = 1; \
    aluCtrl = `aluAdd; \
    checkOverflow = 1; \
    immediate = signExtendedImmediate; 

`define simpleMemoryStore \
    regRead1 = rsi; \
    regRead2 = rti; \
    memStore = 1; \
    aluSrc = 1; \
    aluCtrl = `aluAdd; \
    checkOverflow = 1; \
    immediate = signExtendedImmediate;

`define simpleMUL   \
    regRead1 = rsi; \
    regRead2 = rti;

`define simpleLink \
    grfWriteSource = `grfWritePC; \
    destinationRegister = reg_ra;

always_comb begin
    memLoad = 0;
    memStore = 0;
    grfWriteSource = `grfWriteDisable;
    branch = 0;
    destinationRegister = 0;
    aluSrc = 0;
    aluCtrl = `aluDisabled;
    absJump = 0;
    regRead1 = 0;
    bye = 0;
    regRead2 = 0;
    memWidthCtrl = 0;
    memReadSignExtend = 0;
    checkOverflow = 0;
    mulOutputSel = 'bx;
    mulCtrl = `mtDisabled;
    generateException = `ctrlNoException;
    writeCP0 = 0;
    numberCP0 = 0;
`ifdef DEBUG

    immediate = 'bx;
    absJumpLoc = 'bx;
`else
    immediate = 0;
    absJumpLoc = 0;
`endif

    if (!reset && !bubble)
    case (opcode)
        cop0: begin
            case (funct)
                6'b000000: begin
                    case (rsi)
                        mfc0: begin
                            destinationRegister = rti;
                            grfWriteSource = `grfWriteCP0;
                            numberCP0 = rdi;
                        end
                        mtc0: begin
                            regRead1 = rti;
                            writeCP0 = 1;
                            numberCP0 = rdi;
                        end
                    endcase
                end
                eret: begin
                    generateException = `ctrlERET;
                end
                default: begin
                    generateException = `ctrlUnknownInstruction;
                end
            endcase
        end
        special2: begin
            case (funct)
                msub: begin
                    `simpleMUL
                    mulCtrl = `mtMSUB;
                end
                madd: begin
                    `simpleMUL
                    mulCtrl = `mtMADD;
                end
                maddu: begin
                    `simpleMUL
                    mulCtrl = `mtMADDU;
                end
                default: begin
                    generateException = `ctrlUnknownInstruction;
                end
            endcase
        end

        REGIMM: begin
            case (rti)
                bltzal: begin
                    `simpleBranch
                    `simpleLink
                    cmpCtrl = `cmpLessThanZero;
                end
                bgezal: begin
                    `simpleBranch
                    `simpleLink
                    cmpCtrl = `cmpGreaterThanOrEqualToZero;
                end
                bltz: begin
                    `simpleBranch
                    cmpCtrl = `cmpLessThanZero;
                end
                bgez: begin
                    `simpleBranch
                    cmpCtrl = `cmpGreaterThanOrEqualToZero;
                end

                default: begin
                    generateException = `ctrlUnknownInstruction;
                end
            endcase
        end
        
        R: begin
            case(funct)
                addu: begin
                    `simpleALU
                    aluCtrl = `aluAdd;
                end
                subu: begin
                    `simpleALU
                    aluCtrl = `aluSub;
                end
                add: begin
                    `simpleALU
                    aluCtrl = `aluAdd;
                    checkOverflow = 1;
                end
                sub: begin
                    `simpleALU
                    aluCtrl = `aluSub;
                    checkOverflow = 1;
                end

                _and: begin
                    `simpleALU
                    aluCtrl = `aluAnd;
                end
                _or: begin
                    `simpleALU
                    aluCtrl = `aluOr;
                end
                _nor: begin
                    `simpleALU
                    aluCtrl = `aluNor;
                end
                _xor: begin
                    `simpleALU
                    aluCtrl = `aluXor;
                end

                sll: begin
                    `simpleShift
                    aluCtrl = `aluShiftLeft;
                end
                srl: begin
                    `simpleShift
                    aluCtrl = `aluShiftRight;
                end
                sra: begin
                    `simpleShift
                    aluCtrl = `aluArithmeticShiftRight;
                end

                sllv: begin
                    `simpleShiftVariable
                    aluCtrl = `aluShiftLeft;
                end
                srlv: begin
                    `simpleShiftVariable
                    aluCtrl = `aluShiftRight;
                end
                srav: begin
                    `simpleShiftVariable
                    aluCtrl = `aluArithmeticShiftRight;
                end

                slt: begin
                    `simpleALU
                    aluCtrl = `aluSLT;
                end

                sltu: begin
                    `simpleALU
                    aluCtrl = `aluSLTU;
                end

                jr: begin
                    regRead1 = rsi;
                    absJump = 1;
                    absJumpLoc = `absJumpRegister;
                end

                jalr: begin
                    regRead1 = rsi;
                    absJump = 1;
                    absJumpLoc = `absJumpRegister;
                    grfWriteSource = `grfWritePC;
                    destinationRegister = rdi;
                end

                syscall: begin
                    generateException = `ctrlSyscall;
                end

                _break: begin
                    generateException = `ctrlBreak;
                end

                mult: begin
                    `simpleMUL
                    mulCtrl = `mtMultiply;
                end

                multu: begin
                    `simpleMUL
                    mulCtrl = `mtMultiplyUnsigned;
                end

                div: begin
                    `simpleMUL
                    mulCtrl = `mtDivide;
                end

                divu: begin
                    `simpleMUL
                    mulCtrl = `mtDivideUnsigned;
                end

                mfhi: begin
                    mulOutputSel = 1;
                    destinationRegister = rdi;
                    grfWriteSource = `grfWriteMul;
                end

                mflo: begin
                    mulOutputSel = 0;
                    destinationRegister = rdi;
                    grfWriteSource = `grfWriteMul;
                end

                mthi: begin
                    regRead1 = rsi;
                    mulCtrl = `mtSetHI;
                end

                mtlo: begin
                    regRead1 = rsi;
                    mulCtrl = `mtSetLO;
                end

                default: begin
                    generateException = `ctrlUnknownInstruction;
                end
            endcase
        end

        addiu: begin
            `simpleALUImmediate
            immediate = signExtendedImmediate;
            aluCtrl = `aluAdd;
        end

        addi: begin
            `simpleALUImmediate
            immediate = signExtendedImmediate;
            aluCtrl = `aluAdd;
            checkOverflow = 1;
        end

        ori: begin
            `simpleALUImmediate
            immediate = zeroExtendedImmediate;
            aluCtrl = `aluOr;
        end

        xori: begin
            `simpleALUImmediate
            immediate = zeroExtendedImmediate;
            aluCtrl = `aluXor;
        end

        andi: begin
            `simpleALUImmediate
            immediate = zeroExtendedImmediate;
            aluCtrl = `aluAnd;
        end

        slti: begin
            `simpleALUImmediate
            immediate = signExtendedImmediate;
            aluCtrl = `aluSLT;
        end

        sltiu: begin
            `simpleALUImmediate
            immediate = signExtendedImmediate;
            aluCtrl = `aluSLTU;
        end

        lw: begin
            `simpleMemoryLoad
            memWidthCtrl = `memWidth4;
        end

        lh: begin
            `simpleMemoryLoad
            memWidthCtrl = `memWidth2;
            memReadSignExtend = 1;
        end

        lb: begin
            `simpleMemoryLoad
            memWidthCtrl = `memWidth1;
            memReadSignExtend = 1;
        end

        lhu: begin
            `simpleMemoryLoad
            memWidthCtrl = `memWidth2;
            memReadSignExtend = 0;
        end

        lbu: begin
            `simpleMemoryLoad
            memWidthCtrl = `memWidth1;
            memReadSignExtend = 0;
        end

        sw: begin
            `simpleMemoryStore
            memWidthCtrl = `memWidth4;
        end

        sh: begin
            `simpleMemoryStore
            memWidthCtrl = `memWidth2;
        end

        sb: begin
            `simpleMemoryStore
            memWidthCtrl = `memWidth1;
        end

        beq: begin
            `simpleBranch
            regRead2 = rti;
            cmpCtrl = `cmpEqual;
        end

        bne: begin
            `simpleBranch
            regRead2 = rti;
            cmpCtrl = `cmpNotEqual;
        end

        blez: begin
            `simpleBranch
            cmpCtrl = `cmpLessThanOrEqualToZero;
        end

        bgtz: begin
            `simpleBranch
            cmpCtrl = `cmpGreaterThanZero;
        end 


        lui: begin
            regRead1 = rsi;
            grfWriteSource = `grfWriteALU;
            destinationRegister = rti;
            aluSrc = 1;
            aluCtrl = `aluAdd;
            immediate = shiftedImmediate;
        end

        jal: begin
            absJump = 1;
            absJumpLoc = `absJumpImmediate;
            immediate = bigImm;
            `simpleLink
        end

        j: begin
            absJump = 1;
            absJumpLoc = `absJumpImmediate;
            immediate = bigImm;
        end

        default: begin
            generateException = `ctrlUnknownInstruction;
        end
    endcase
end

endmodule