`include "constants.svh"

module Decoder #(
            parameter IMPLEMENT_LIKELY = 1
        )(
            input [31:0] instruction,
            input reset,
            input bubble,

            output ControlSignals controls
       );

wire [5:0] opcode = instruction[31:26];
wire [5:0] funct = instruction[5:0];

wire [4:0] rti = instruction[20:16];
wire [4:0] rsi = instruction[25:21];
wire [4:0] rdi = instruction[15:11];
wire [2:0] sel = instruction[2:0]; // for mfc0, mtc0

wire [25:0] bigImm = instruction[25:0];
wire [15:0] imm = instruction[15:0];
wire [31:0] zeroExtendedImmediate = imm;
wire [31:0] shiftedImmediate = {imm, 16'b0};
wire [31:0] signExtendedImmediate = $signed(imm);

const bit [4:0] reg_ra = 31;

const bit [5:0] R = 6'b000000;
const bit [5:0] REGIMM = 6'b000001;
const bit [5:0] ori = 6'b001101;
const bit [5:0] andi = 6'b001100;
const bit [5:0] xori = 6'b001110;
const bit [5:0] lw = 6'b100011;
const bit [5:0] sw = 6'b101011;
const bit [5:0] beq = 6'b000100;
const bit [5:0] beql = 5'b010100;
const bit [5:0] bne = 6'b000101;
const bit [5:0] bnel = 5'b010101;
const bit [5:0] blez = 6'b000110;
const bit [5:0] blezl = 6'b010110;
const bit [5:0] bgtz = 6'b000111;
const bit [5:0] bgtzl = 6'b010111;
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

const bit [4:0] bltz    = 5'b00000;
const bit [4:0] bltzl   = 5'b00010;
const bit [4:0] bgez    = 5'b00001;
const bit [4:0] bgezl   = 5'b00011;
const bit [4:0] bltzal  = 5'b10000;
const bit [4:0] bltzall = 5'b10010;
const bit [4:0] bgezal  = 5'b10001;
const bit [4:0] bgezall = 5'b10011;

const bit [4:0] mfc0 = 5'b00000;
const bit [4:0] mtc0 = 5'b00100;

const bit [5:0] slt = 6'b101010;
const bit [5:0] sltu = 6'b101011;
const bit [5:0] slti = 6'b001010;
const bit [5:0] sltiu = 6'b001011;

const bit [5:0] jr = 6'b001000;
const bit [5:0] syscall = 6'b001100;
const bit [5:0] _break = 6'b001101;

const bit [5:0] teq = 6'b110100;
const bit [5:0] tge = 6'b110000;
const bit [5:0] tgeu = 6'b110001;
const bit [5:0] tlt = 6'b110010;
const bit [5:0] tltu = 6'b110011;
const bit [5:0] tne  = 6'b110110;

const bit [4:0] teqi = 5'b01100;
const bit [4:0] tgei = 5'b01000;
const bit [4:0] tgeiu = 5'b01001;
const bit [4:0] tlti = 5'b01010;
const bit [4:0] tltiu = 5'b01011;
const bit [4:0] tnei = 5'b01110;

const bit debug = 1;

`define simpleALU \
    controls.regRead1 = rsi; \
    controls.regRead2 = rti;\
    controls.grfWriteSource = `grfWriteALU; \
    controls.destinationRegister = rdi;

`define simpleShift \
    controls.regRead1 = rti; \
    controls.grfWriteSource = `grfWriteALU; \
    controls.destinationRegister = rdi; \
    controls.aluSrc = 1; \
    controls.immediate = instruction[10:6];

`define simpleShiftVariable \
    controls.regRead1 = rti; \
    controls.regRead2 = rsi; \
    controls.grfWriteSource = `grfWriteALU; \
    controls.destinationRegister = rdi;

`define simpleALUImmediate \
    controls.regRead1 = rsi; \
    controls.grfWriteSource = `grfWriteALU; \
    controls.destinationRegister = rti; \
    controls.aluSrc = 1;

`define simpleBranch \
    controls.regRead1 = rsi; \
    controls.branch = 1; \
    controls.immediate = signExtendedImmediate;

`define simpleTrap \
    controls.trap = 1; \
    controls.regRead1 = rsi; \
    controls.regRead2 = rti; \
    controls.aluSrc = 0;

`define simpleTrapImmediate \
    controls.trap = 1; \
    controls.regRead1 = rsi; \
    controls.immediate = signExtendedImmediate; \
    controls.aluSrc = 1;

`define simpleMemoryLoad \
    controls.regRead1 = rsi; \
    controls.memLoad = 1; \
    controls.grfWriteSource = `grfWriteMem; \
    controls.destinationRegister = rti; \
    controls.checkOverflow = 1; \
    controls.immediate = signExtendedImmediate; \
    controls.calculateAddress = 1;

`define simpleMemoryStore \
    controls.regRead1 = rsi; \
    controls.regRead2 = rti; \
    controls.memStore = 1; \
    controls.checkOverflow = 1; \
    controls.immediate = signExtendedImmediate; \
    controls.calculateAddress = 1;

`define simpleMUL   \
    controls.regRead1 = rsi; \
    controls.regRead2 = rti;

`define simpleLink \
    controls.grfWriteSource = `grfWritePC; \
    controls.destinationRegister = reg_ra;

always_comb begin
    controls = kControlNop;

    if (!reset && !bubble)
    case (opcode)
        cop0: begin
            case (funct)
                6'b000000: begin
                    case (rsi)
                        mfc0: begin
                            controls.destinationRegister = rti;
                            controls.grfWriteSource = `grfWriteCP0;
                            controls.numberCP0 = cp0_number_t'({rdi, sel});
                        end
                        mtc0: begin
                            controls.regRead1 = rti;
                            controls.writeCP0 = 1;
                            controls.numberCP0 = cp0_number_t'({rdi, sel});
                        end
                    endcase
                end
                eret: begin
                    controls.generateException = `ctrlERET;
                end
                default: begin
                    controls.generateException = `ctrlUnknownInstruction;
                end
            endcase
        end
        special2: begin
            case (funct)
                msub: begin
                    `simpleMUL
                    controls.mulCtrl = `mtMSUB;
                end
                madd: begin
                    `simpleMUL
                    controls.mulCtrl = `mtMADD;
                end
                maddu: begin
                    `simpleMUL
                    controls.mulCtrl = `mtMADDU;
                end
                default: begin
                    controls.generateException = `ctrlUnknownInstruction;
                end
            endcase
        end

        REGIMM: begin
            case (rti)
                bltzal: begin
                    `simpleBranch
                    `simpleLink
                    controls.cmpCtrl = `cmpLessThanZero;
                end
                bgezal: begin
                    `simpleBranch
                    `simpleLink
                    controls.cmpCtrl = `cmpGreaterThanOrEqualToZero;
                end
                bltz: begin
                    `simpleBranch
                    controls.cmpCtrl = `cmpLessThanZero;
                end
                bgez: begin
                    `simpleBranch
                    controls.cmpCtrl = `cmpGreaterThanOrEqualToZero;
                end
                bltzall: begin
                    `simpleBranch
                    `simpleLink
                    controls.cmpCtrl = `cmpLessThanZero;
                    controls.branchLikely = 1;
                end
                bgezall: begin
                    `simpleBranch
                    `simpleLink
                    controls.cmpCtrl = `cmpGreaterThanOrEqualToZero;
                    controls.branchLikely = 1;
                end
                bltzl: begin
                    `simpleBranch
                    controls.cmpCtrl = `cmpLessThanZero;
                    controls.branchLikely = 1;
                end
                bgezl: begin
                    `simpleBranch
                    controls.cmpCtrl = `cmpGreaterThanOrEqualToZero;
                    controls.branchLikely = 1;
                end

                teqi: begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSEQ;
                end

                tnei: begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSNE;
                end

                tgei: begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSGE;
                end

                tgeiu: begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSGEU;
                end

                tlti: begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSLT;
                end

                tltiu: begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSLTU;
                end

                default: begin
                    controls.generateException = `ctrlUnknownInstruction;
                end
            endcase
        end
        
        R: begin
            case(funct)
                addu: begin
                    `simpleALU
                    controls.aluCtrl = `aluAdd;
                end
                subu: begin
                    `simpleALU
                    controls.aluCtrl = `aluSub;
                end
                add: begin
                    `simpleALU
                    controls.aluCtrl = `aluAdd;
                    controls.checkOverflow = 1;
                end
                sub: begin
                    `simpleALU
                    controls.aluCtrl = `aluSub;
                    controls.checkOverflow = 1;
                end

                _and: begin
                    `simpleALU
                    controls.aluCtrl = `aluAnd;
                end
                _or: begin
                    `simpleALU
                    controls.aluCtrl = `aluOr;
                end
                _nor: begin
                    `simpleALU
                    controls.aluCtrl = `aluNor;
                end
                _xor: begin
                    `simpleALU
                    controls.aluCtrl = `aluXor;
                end

                sll: begin
                    `simpleShift
                    controls.aluCtrl = `aluShiftLeft;
                end
                srl: begin
                    `simpleShift
                    controls.aluCtrl = `aluShiftRight;
                end
                sra: begin
                    `simpleShift
                    controls.aluCtrl = `aluArithmeticShiftRight;
                end

                sllv: begin
                    `simpleShiftVariable
                    controls.aluCtrl = `aluShiftLeft;
                end
                srlv: begin
                    `simpleShiftVariable
                    controls.aluCtrl = `aluShiftRight;
                end
                srav: begin
                    `simpleShiftVariable
                    controls.aluCtrl = `aluArithmeticShiftRight;
                end

                slt: begin
                    `simpleALU
                    controls.aluCtrl = `aluSLT;
                end

                sltu: begin
                    `simpleALU
                    controls.aluCtrl = `aluSLTU;
                end

                jr: begin
                    controls.regRead1 = rsi;
                    controls.absJump = 1;
                    controls.absJumpLoc = `absJumpRegister;
                end

                jalr: begin
                    controls.regRead1 = rsi;
                    controls.absJump = 1;
                    controls.absJumpLoc = `absJumpRegister;
                    controls.grfWriteSource = `grfWritePC;
                    controls.destinationRegister = rdi;
                end

                syscall: begin
                    controls.generateException = `ctrlSyscall;
                end

                _break: begin
                    controls.generateException = `ctrlBreak;
                end

                mult: begin
                    `simpleMUL
                    controls.mulCtrl = `mtMultiply;
                end

                multu: begin
                    `simpleMUL
                    controls.mulCtrl = `mtMultiplyUnsigned;
                end

                div: begin
                    `simpleMUL
                    controls.mulCtrl = `mtDivide;
                end

                divu: begin
                    `simpleMUL
                    controls.mulCtrl = `mtDivideUnsigned;
                end

                mfhi: begin
                    controls.mulOutputSel = 1;
                    controls.destinationRegister = rdi;
                    controls.grfWriteSource = `grfWriteMul;
                end

                mflo: begin
                    controls.mulOutputSel = 0;
                    controls.destinationRegister = rdi;
                    controls.grfWriteSource = `grfWriteMul;
                end

                mthi: begin
                    controls.regRead1 = rsi;
                    controls.mulCtrl = `mtSetHI;
                end

                mtlo: begin
                    controls.regRead1 = rsi;
                    controls.mulCtrl = `mtSetLO;
                end

                teq: begin
                    `simpleTrap
                    controls.aluCtrl = `aluSEQ;
                end

                tge: begin
                    `simpleTrap
                    controls.aluCtrl = `aluSGE;
                end

                tgeu: begin
                    `simpleTrap
                    controls.aluCtrl = `aluSGEU;
                end

                tlt: begin
                    `simpleTrap
                    controls.aluCtrl = `aluSLT;
                end

                tltu: begin
                    `simpleTrap
                    controls.aluCtrl = `aluSLTU;
                end

                tne: begin
                    `simpleTrap
                    controls.aluCtrl = `aluSNE;
                end

                default: begin
                    controls.generateException = `ctrlUnknownInstruction;
                end
            endcase
        end

        addiu: begin
            `simpleALUImmediate
            controls.immediate = signExtendedImmediate;
            controls.aluCtrl = `aluAdd;
        end

        addi: begin
            `simpleALUImmediate
            controls.immediate = signExtendedImmediate;
            controls.aluCtrl = `aluAdd;
            controls.checkOverflow = 1;
        end

        ori: begin
            `simpleALUImmediate
            controls.immediate = zeroExtendedImmediate;
            controls.aluCtrl = `aluOr;
        end

        xori: begin
            `simpleALUImmediate
            controls.immediate = zeroExtendedImmediate;
            controls.aluCtrl = `aluXor;
        end

        andi: begin
            `simpleALUImmediate
            controls.immediate = zeroExtendedImmediate;
            controls.aluCtrl = `aluAnd;
        end

        slti: begin
            `simpleALUImmediate
            controls.immediate = signExtendedImmediate;
            controls.aluCtrl = `aluSLT;
        end

        sltiu: begin
            `simpleALUImmediate
            controls.immediate = signExtendedImmediate;
            controls.aluCtrl = `aluSLTU;
        end

        lw: begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth4;
        end

        lh: begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth2;
            controls.memReadSignExtend = 1;
        end

        lb: begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth1;
            controls.memReadSignExtend = 1;
        end

        lhu: begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth2;
            controls.memReadSignExtend = 0;
        end

        lbu: begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth1;
            controls.memReadSignExtend = 0;
        end

        sw: begin
            `simpleMemoryStore
            controls.memWidthCtrl = `memWidth4;
        end

        sh: begin
            `simpleMemoryStore
            controls.memWidthCtrl = `memWidth2;
        end

        sb: begin
            `simpleMemoryStore
            controls.memWidthCtrl = `memWidth1;
        end

        beq: begin
            `simpleBranch
            controls.regRead2 = rti;
            controls.cmpCtrl = `cmpEqual;
        end

        bne: begin
            `simpleBranch
            controls.regRead2 = rti;
            controls.cmpCtrl = `cmpNotEqual;
        end

        blez: begin
            `simpleBranch
            controls.cmpCtrl = `cmpLessThanOrEqualToZero;
        end

        bgtz: begin
            `simpleBranch
            controls.cmpCtrl = `cmpGreaterThanZero;
        end 

        beql: begin
            `simpleBranch
            controls.regRead2 = rti;
            controls.cmpCtrl = `cmpEqual;
            controls.branchLikely = 1;
        end

        bnel: begin
            `simpleBranch
            controls.regRead2 = rti;
            controls.cmpCtrl = `cmpNotEqual;
            controls.branchLikely = 1;
        end

        blezl: begin
            `simpleBranch
            controls.cmpCtrl = `cmpLessThanOrEqualToZero;
            controls.branchLikely = 1;
        end

        bgtzl: begin
            `simpleBranch
            controls.cmpCtrl = `cmpGreaterThanZero;
            controls.branchLikely = 1;
        end 

        lui: begin
            controls.regRead1 = rsi;
            controls.grfWriteSource = `grfWriteALU;
            controls.destinationRegister = rti;
            controls.aluSrc = 1;
            controls.aluCtrl = `aluAdd;
            controls.immediate = shiftedImmediate;
        end

        jal: begin
            controls.absJump = 1;
            controls.absJumpLoc = `absJumpImmediate;
            controls.immediate = bigImm;
            `simpleLink
        end

        j: begin
            controls.absJump = 1;
            controls.absJumpLoc = `absJumpImmediate;
            controls.immediate = bigImm;
        end

        default: begin
            controls.generateException = `ctrlUnknownInstruction;
        end
    endcase
    controls.mulEnable = controls.mulCtrl != `mtDisabled;
    if (!IMPLEMENT_LIKELY && controls.branchLikely) begin
        controls.generateException = `ctrlUnknownInstruction;
    end
end

endmodule
