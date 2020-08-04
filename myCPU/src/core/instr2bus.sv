`include "my_global.vh"

module instr2bus(
        input [31:0] MipsInstr,
        output [4:0] Shamt,
        output [4:0] Rs,
        output [4:0] Rt,
        output [4:0] Rd,
        output [15:0] Imm16,
        output [25:0] Imm26,
        output RegWriteEnable,
        output [4:0] WriteRegId,
        output [`INSTRBUS_WIDTH-1:0] InstrBus
    );
    assign Rs = MipsInstr[25:21];
    assign Rt = MipsInstr[20:16];
    assign Rd = MipsInstr[15:11];
    assign Shamt = MipsInstr[10:6];
    assign Imm16 = MipsInstr[15:0];
    assign Imm26 = MipsInstr[25:0];
    wire [5:0] OpCode = MipsInstr[31:26],
         Funct = MipsInstr[5:0];
    wire lb = (OpCode==6'h20),
         lbu = (OpCode==6'h24),
         lh = (OpCode==6'h21),
         lhu = (OpCode==6'h25),
         lw = (OpCode==6'h23),
         sb = (OpCode==6'h28),
         sh = (OpCode==6'h29),
         sw = (OpCode==6'h2b);

    wire addi = (OpCode==6'h8),
         addiu = (OpCode==6'h9),
         add = (OpCode==6'h0 && Funct==6'h20),
         addu = (OpCode==6'h0 && Funct==6'h21),
         sub = (OpCode==6'h0 && Funct==6'h22),
         subu = (OpCode==6'h0 && Funct==6'h23),
         lui = (OpCode==6'hf);

    wire ori = (OpCode==6'hd),
         my_And = (OpCode==6'h0 && Funct==6'h24),
         my_Or = (OpCode==6'h0 && Funct==6'h25),
         my_Xor = (OpCode==6'h0 && Funct==6'h26),
         my_Nor = (OpCode==6'h0 && Funct==6'h27),
         Andi = (OpCode==6'hc),
         Xori = (OpCode==6'he);
    wire beq = (OpCode==6'h4),
         bne = (OpCode==6'h5),
         blez = (OpCode==6'h6),
         bgtz = (OpCode==6'h7),
         bltz = (MipsInstr[31:26]==6'h1 && MipsInstr[20:16]==6'h0),
         bgez = (MipsInstr[31:26]==6'h1 && MipsInstr[20:16]==6'h1),
         j = (OpCode==6'h2),
         jal = (OpCode==6'h3),
         jr = (OpCode==6'h0 && Funct==6'h8),
         jalr = (OpCode==6'h0 && Funct==6'h9),
         nop = (MipsInstr==32'b0);

    wire mult = (OpCode==6'h0 && Funct==6'h18),
         multu = (OpCode==6'h0 && Funct==6'h19),
         div = (OpCode==6'h0 && Funct==6'h1a),
         divu = (OpCode==6'h0 && Funct==6'h1b),
         mfhi = (OpCode==6'h0 && Funct==6'h10),
         mthi = (OpCode==6'h0 && Funct==6'h11),
         mflo = (OpCode==6'h0 && Funct==6'h12),
         mtlo = (OpCode==6'h0 && Funct==6'h13);

    wire sll = (OpCode==6'h0 && Funct==6'h0),
         srl = (OpCode==6'h0 && Funct==6'h2),
         sra = (OpCode==6'h0 && Funct==6'h3),
         sllv = (OpCode==6'h0 && Funct==6'h4),
         srlv = (OpCode==6'h0 && Funct==6'h6),
         srav = (OpCode==6'h0 && Funct==6'h7);

    wire slt = (OpCode==6'h0 && Funct==6'h2a),
         slti = (OpCode==6'ha),
         sltu = (OpCode==6'h0 && Funct==6'h2b),
         sltiu = (OpCode==6'hb);
    wire mfc0 = (OpCode==6'b010000 && MipsInstr[25:21]==5'b00000),
         mtc0 = (OpCode==6'b010000 && MipsInstr[25:21]==5'b00100),
         eret = (MipsInstr==32'h42000018);
    wire my_break = (OpCode==6'h0 && Funct==6'hd),
         syscall =(OpCode==6'h0 && Funct==6'hc);

    wire bltzal = (OpCode==6'b000001 && MipsInstr[20:16]==5'b10000),
         bgezal = (OpCode==6'b000001 && MipsInstr[20:16]==5'b10001);

    wire tlbp = (MipsInstr==32'h42000008),
         tlbr = (MipsInstr==32'h42000001),
         tlbwi = (MipsInstr==32'h42000002),
         tlbwr = (MipsInstr==32'h42000006);

    wire cache = (OpCode==6'b101111);

    wire lwl = (MipsInstr[31:26]==6'b100010),
         lwr = (MipsInstr[31:26]==6'b100110),
         swl = (MipsInstr[31:26]==6'b101010),
         swr = (MipsInstr[31:26]==6'b101110);

    wire mul = (OpCode == 6'b011100 && MipsInstr[10:0] == 11'b10);

    assign RegWriteEnable = ~nop & (addi | addiu | add | addu | sub | subu |
                                    ori | lui | my_Or | my_And | my_Xor | my_Nor | Andi |Xori |
                                    lw | lh | lhu | lb | lbu |
                                    jal | jalr |
                                    mfhi | mflo | mul |
                                    sll | srl | sra | sllv | srlv | srav |
                                    slt | slti | sltu | sltiu |
                                    mfc0 |
                                    bltzal |bgezal|
                                    lwl|lwr);
    assign WriteRegId = (addi | addiu | ori | Xori | Andi | lui |
                         lw | lhu | lh | lbu | lb | slti | sltiu | mfc0|lwl|lwr) ? Rt:
           (add | addu | sub | subu | mfhi | mflo | mul |
            sll | srl | sra | sllv | srlv | srav | slt |
            sltu | my_And | my_Or | my_Xor | my_Nor | jalr) ? Rd:
           (jal | bltzal | bgezal) ? 5'd31:
           Rd;

    assign InstrBus = {`INSTR_SET};
endmodule
