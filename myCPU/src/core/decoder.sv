`include "constants.svh"

module Decoder #(
            parameter IMPLEMENT_LIKELY
        ) (
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
    controls.immediate = signExtendedImmediate; \
    controls.calculateAddress = 1;

`define simpleMemoryStore \
    controls.regRead1 = rsi; \
    controls.regRead2 = rti; \
    controls.memStore = 1; \
    controls.immediate = signExtendedImmediate; \
    controls.calculateAddress = 1;

`define simpleMUL   \
    controls.regRead1 = rsi; \
    controls.regRead2 = rti;

`define simpleLink \
    controls.grfWriteSource = `grfWritePC; \
    controls.destinationRegister = 31; // $ra

`define simpleBitCount \
    controls.grfWriteSource = `grfWriteBitCounter; \
    controls.destinationRegister = rdi; \
    controls.bitCounterEnable = 1; \
    controls.regRead1 = rsi; 

always_comb begin
    controls = kControlNop;

    if (!reset && !bubble)
    case (opcode)
        6'b010000: // cop0
        begin
            casez ({rsi, funct})
                // last 3 bits of mfc0 and mtc0 are sel
                11'b00000000???: // mfc0
                begin 
                    controls.destinationRegister = rti;
                    controls.grfWriteSource = `grfWriteCP0;
                    controls.numberCP0 = cp0_number_t'({rdi, sel});
                end
                11'b00100000???: // mtc0
                begin
                    controls.regRead1 = rti;
                    controls.writeCP0 = 1;
                    controls.numberCP0 = cp0_number_t'({rdi, sel});
                end
                11'b10000011000: // eret
                begin                           
                    controls.generateException = `ctrlERET;
                end
                default: begin
                    controls.generateException = `ctrlUnknownInstruction;
                end
            endcase
        end
        6'b011100: // SPECIAL2
        begin
            case (funct)
                6'b000100: // msub
                begin
                    `simpleMUL
                    controls.mulCtrl = `mtMSUB;
                end
                6'b000000: // madd
                begin
                    `simpleMUL
                    controls.mulCtrl = `mtMADD;
                end
                6'b000001: // maddu
                begin
                    `simpleMUL
                    controls.mulCtrl = `mtMADDU;
                end
                6'b000101: // msubu
                begin
                    `simpleMUL
                    controls.mulCtrl = `mtMSUBU;
                end

                6'b000010: // mul
                begin
                    `simpleMUL
                    controls.mulCtrl = `mtMultiply;
                    controls.mulOutputSel = 0;
                    controls.destinationRegister = rdi;
                    controls.grfWriteSource = `grfWriteMul;
                end

                6'b100001: // clo
                begin
                    `simpleBitCount
                    controls.bitCounterType = 1;
                end

                6'b100000: // clz
                begin
                    `simpleBitCount
                    controls.bitCounterType = 0;
                end

                default: begin
                    controls.generateException = `ctrlUnknownInstruction;
                end
            endcase
        end

        6'b000001: // REGIMM
        begin
            case (rti)
                5'b10000: // bltzal
                begin
                    `simpleBranch
                    `simpleLink
                    controls.cmpCtrl = `cmpLessThanZero;
                end
                5'b10001: // bgezal
                begin
                    `simpleBranch
                    `simpleLink
                    controls.cmpCtrl = `cmpGreaterThanOrEqualToZero;
                end
                5'b00000: // bltz
                begin
                    `simpleBranch
                    controls.cmpCtrl = `cmpLessThanZero;
                end
                5'b00001: // bgez
                begin
                    `simpleBranch
                    controls.cmpCtrl = `cmpGreaterThanOrEqualToZero;
                end
                5'b10010: // bltzall
                begin
                    `simpleBranch
                    `simpleLink
                    controls.cmpCtrl = `cmpLessThanZero;
                    controls.branchLikely = 1;
                end
                5'b10011: // bgezall
                begin
                    `simpleBranch
                    `simpleLink
                    controls.cmpCtrl = `cmpGreaterThanOrEqualToZero;
                    controls.branchLikely = 1;
                end
                5'b00010: // bltzl
                begin
                    `simpleBranch
                    controls.cmpCtrl = `cmpLessThanZero;
                    controls.branchLikely = 1;
                end
                5'b00011: // bgezl
                begin
                    `simpleBranch
                    controls.cmpCtrl = `cmpGreaterThanOrEqualToZero;
                    controls.branchLikely = 1;
                end

                5'b01100: // teqi
                begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSEQ;
                end
                5'b01110: // tnei
                begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSNE;
                end
                5'b01000: // tgei
                begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSGE;
                end
                5'b01001: // tgeiu
                begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSGEU;
                end
                5'b01010: // tlti
                begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSLT;
                end
                5'b01011: // tltiu
                begin
                    `simpleTrapImmediate
                    controls.aluCtrl = `aluSLTU;
                end

                default: begin
                    controls.generateException = `ctrlUnknownInstruction;
                end
            endcase
        end
        
        6'b000000: // SPECIAL
        begin
            case(funct)
                6'b100001: // addu
                begin
                    `simpleALU
                    controls.aluCtrl = `aluAdd;
                end
                6'b100011: // subu
                begin
                    `simpleALU
                    controls.aluCtrl = `aluSub;
                end
                6'b100000: // add
                begin
                    `simpleALU
                    controls.aluCtrl = `aluAdd;
                    controls.checkOverflow = 1;
                end
                6'b100010: // sub
                begin
                    `simpleALU
                    controls.aluCtrl = `aluSub;
                    controls.checkOverflow = 1;
                end

                6'b100100: // and
                begin
                    `simpleALU
                    controls.aluCtrl = `aluAnd;
                end
                6'b100101: // or
                begin
                    `simpleALU
                    controls.aluCtrl = `aluOr;
                end
                6'b100111: // nor
                begin
                    `simpleALU
                    controls.aluCtrl = `aluNor;
                end
                6'b100110: // xor
                begin
                    `simpleALU
                    controls.aluCtrl = `aluXor;
                end

                6'b000000: // sll
                begin
                    `simpleShift
                    controls.aluCtrl = `aluShiftLeft;
                end
                6'b000010: // srl
                begin
                    `simpleShift
                    controls.aluCtrl = `aluShiftRight;
                end
                6'b000011: // sra
                begin
                    `simpleShift
                    controls.aluCtrl = `aluArithmeticShiftRight;
                end

                6'b000100: // sllv
                begin
                    `simpleShiftVariable
                    controls.aluCtrl = `aluShiftLeft;
                end
                6'b000110: // srlv
                begin
                    `simpleShiftVariable
                    controls.aluCtrl = `aluShiftRight;
                end
                6'b000111: // srav
                begin
                    `simpleShiftVariable
                    controls.aluCtrl = `aluArithmeticShiftRight;
                end

                6'b101010: // slt
                begin
                    `simpleALU
                    controls.aluCtrl = `aluSLT;
                end

                6'b101011: // sltu
                begin
                    `simpleALU
                    controls.aluCtrl = `aluSLTU;
                end

                6'b001000: // jr
                begin
                    controls.regRead1 = rsi;
                    controls.absJump = 1;
                    controls.absJumpLoc = `absJumpRegister;
                end

                6'b001001: // jalr
                begin
                    controls.regRead1 = rsi;
                    controls.absJump = 1;
                    controls.absJumpLoc = `absJumpRegister;
                    controls.grfWriteSource = `grfWritePC;
                    controls.destinationRegister = rdi;
                end

                6'b001100: // syscall
                begin
                    controls.generateException = `ctrlSyscall;
                end

                6'b001101: // break
                begin
                    controls.generateException = `ctrlBreak;
                end

                6'b011000: // mult
                begin
                    `simpleMUL
                    controls.mulCtrl = `mtMultiply;
                end

                6'b011001: // multu
                begin
                    `simpleMUL
                    controls.mulCtrl = `mtMultiplyUnsigned;
                end

                6'b011010: // div
                begin
                    `simpleMUL
                    controls.mulCtrl = `mtDivide;
                end

                6'b011011: // divu
                begin
                    `simpleMUL
                    controls.mulCtrl = `mtDivideUnsigned;
                end

                6'b010000: // mfhi
                begin
                    controls.mulOutputSel = 1;
                    controls.destinationRegister = rdi;
                    controls.grfWriteSource = `grfWriteMul;
                end

                6'b010010: // mflo
                begin
                    controls.mulOutputSel = 0;
                    controls.destinationRegister = rdi;
                    controls.grfWriteSource = `grfWriteMul;
                end

                6'b010001: // mthi
                begin
                    controls.regRead1 = rsi;
                    controls.mulCtrl = `mtSetHI;
                end

                6'b010011: // mtlo
                begin
                    controls.regRead1 = rsi;
                    controls.mulCtrl = `mtSetLO;
                end

                6'b110100: // teq
                begin
                    `simpleTrap
                    controls.aluCtrl = `aluSEQ;
                end

                6'b110000: // tge
                begin
                    `simpleTrap
                    controls.aluCtrl = `aluSGE;
                end

                6'b110001: // tgeu
                begin
                    `simpleTrap
                    controls.aluCtrl = `aluSGEU;
                end

                6'b110010: // tlt
                begin
                    `simpleTrap
                    controls.aluCtrl = `aluSLT;
                end

                6'b110011: // tltu
                begin
                    `simpleTrap
                    controls.aluCtrl = `aluSLTU;
                end

                6'b110110: // tne
                begin
                    `simpleTrap
                    controls.aluCtrl = `aluSNE;
                end

                default: begin
                    controls.generateException = `ctrlUnknownInstruction;
                end
            endcase
        end

        6'b001001: // addiu
        begin
            `simpleALUImmediate
            controls.immediate = signExtendedImmediate;
            controls.aluCtrl = `aluAdd;
        end
        6'b001000: // addi
        begin
            `simpleALUImmediate
            controls.immediate = signExtendedImmediate;
            controls.aluCtrl = `aluAdd;
            controls.checkOverflow = 1;
        end
        6'b001101: // ori
        begin
            `simpleALUImmediate
            controls.immediate = zeroExtendedImmediate;
            controls.aluCtrl = `aluOr;
        end
        6'b001110: // xori
        begin
            `simpleALUImmediate
            controls.immediate = zeroExtendedImmediate;
            controls.aluCtrl = `aluXor;
        end
        6'b001100: // andi
        begin
            `simpleALUImmediate
            controls.immediate = zeroExtendedImmediate;
            controls.aluCtrl = `aluAnd;
        end

        6'b001010: // slti
        begin
            `simpleALUImmediate
            controls.immediate = signExtendedImmediate;
            controls.aluCtrl = `aluSLT;
        end
        6'b001011: // sltiu
        begin
            `simpleALUImmediate
            controls.immediate = signExtendedImmediate;
            controls.aluCtrl = `aluSLTU;
        end

        6'b100011: // lw
        begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth4;
        end
        6'b100001: // lh
        begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth2;
            controls.memReadSignExtend = 1;
        end
        6'b100000: // lb
        begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth1;
            controls.memReadSignExtend = 1;
        end
        6'b100101: // lhu
        begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth2;
            controls.memReadSignExtend = 0;
        end
        6'b100100: // lbu
        begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth1;
            controls.memReadSignExtend = 0;
        end

        6'b101011: // sw
        begin
            `simpleMemoryStore
            controls.memWidthCtrl = `memWidth4;
        end
        6'b101001: // sh
        begin
            `simpleMemoryStore
            controls.memWidthCtrl = `memWidth2;
        end
        6'b101000: // sb
        begin
            `simpleMemoryStore
            controls.memWidthCtrl = `memWidth1;
        end

        6'b000100: // beq
        begin
            `simpleBranch
            controls.regRead2 = rti;
            controls.cmpCtrl = `cmpEqual;
        end
        6'b000101: // bne
        begin
            `simpleBranch
            controls.regRead2 = rti;
            controls.cmpCtrl = `cmpNotEqual;
        end
        6'b000110: // blez
        begin
            `simpleBranch
            controls.cmpCtrl = `cmpLessThanOrEqualToZero;
        end
        6'b000111: // bgtz
        begin
            `simpleBranch
            controls.cmpCtrl = `cmpGreaterThanZero;
        end 

        5'b010100: // beql
        begin
            `simpleBranch
            controls.regRead2 = rti;
            controls.cmpCtrl = `cmpEqual;
            controls.branchLikely = 1;
        end
        5'b010101: // bnel
        begin
            `simpleBranch
            controls.regRead2 = rti;
            controls.cmpCtrl = `cmpNotEqual;
            controls.branchLikely = 1;
        end
        6'b010110: // blezl
        begin
            `simpleBranch
            controls.cmpCtrl = `cmpLessThanOrEqualToZero;
            controls.branchLikely = 1;
        end
        6'b010111: // bgtzl
        begin
            `simpleBranch
            controls.cmpCtrl = `cmpGreaterThanZero;
            controls.branchLikely = 1;
        end 

        6'b001111: // lui
        begin
            controls.regRead1 = rsi;
            controls.grfWriteSource = `grfWriteALU;
            controls.destinationRegister = rti;
            controls.aluSrc = 1;
            controls.aluCtrl = `aluAdd;
            controls.immediate = shiftedImmediate;
        end

        6'b000011: // jal
        begin
            controls.absJump = 1;
            controls.absJumpLoc = `absJumpImmediate;
            controls.immediate = bigImm;
            `simpleLink
        end
        6'b000010: // j
        begin
            controls.absJump = 1;
            controls.absJumpLoc = `absJumpImmediate;
            controls.immediate = bigImm;
        end

        6'b110000: // ll
        begin
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth4;
            controls.setLLbit = 1;
        end
        6'b111000: // sc
        begin
            `simpleMemoryStore
            controls.memWidthCtrl = `memWidth4;
            controls.checkLLbit = 1;
            controls.destinationRegister = rti;
            controls.grfWriteSource = `grfWriteLLbit;
        end

        6'b100010: begin // lwl
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth4;
            controls.regRead2 = rti;
            controls.memUnaligned = 1;
            controls.memLeftPart = 1;
        end
        6'b100110: begin // lwr
            `simpleMemoryLoad
            controls.memWidthCtrl = `memWidth4;
            controls.regRead2 = rti;
            controls.memUnaligned = 1;
            controls.memLeftPart = 0;
        end
        6'b101010: begin // swl
            `simpleMemoryStore
            controls.memWidthCtrl = `memWidth4;
            controls.memUnaligned = 1;
            controls.memLeftPart = 1;
        end
        6'b101110: begin // swr
            `simpleMemoryStore
            controls.memWidthCtrl = `memWidth4;
            controls.memUnaligned = 1;
            controls.memLeftPart = 0;
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
