`include "my_global.vh"

module AT(
        input [`INSTRBUS_WIDTH-1:0] InstrBus,
        input [4:0] Rs,
        input [4:0] Rt,
        input [3:0] D_T,
        input [4:0] D_RegId,
        input [3:0] E_T,
        input E_RegWriteEnable,
        input [4:0] E_RegNumber,
        output stall,
        output [3:0] T,
        input salu_busy_real,
        input [`INSTRBUS_WIDTH-1:0] D_InstrBus,

        input XALU_Busy,
        input D_MultCalFamily,
        input ExceptionFlush
    );
    wire `INSTR_SET;
    assign {`INSTR_SET} = InstrBus;
    wire NeedRs =(addi||addiu||add||addu||sub||subu||(LL|lw)||lwl||lwr||(SC|sw)||swl||swr||lb||lbu||lh||lhu||sb||sh||jr||jalr||mult||multu||div||divu||mthi||mtlo||
                  sllv||srlv||srav||my_And||my_Or||my_Xor||my_Nor||ori||Andi||Xori||slt||sltu||slti||sltiu||
                  (beq||beql)||(bne||bnel)||(blez||blezl)||(bgtz||bgtzl)||(bltz||bltzl)||(bgez||bgezl)||(bltzal||bltzall)||(bgezal||bgezall)||mul||
                  teq||teqi||tge||tgei||tgeiu||tgeu||tlt||tlti||tltiu||tltu||tne||tnei||
                  clo||clz||madd||maddu||msub||msubu||movn||movz||CACHE);
    wire NeedRt =(add||addu||sub||subu||(SC|sw)||swl||swr||sb||sh||mult||multu||div||divu||sll||srl||sra||sllv||srlv||srav||
                  my_And||my_Or||my_Xor||my_Nor||slt||sltu||(beq||beql)||(bne||bnel)||mtc0||mul||
                  teq||tge||tgeu||tlt||tltu||tne||
                  madd||maddu||msub||msubu||movn||movz);

    wire [3:0] T_Rs =
         (addi||addiu||add||CACHE||addu||sub||subu||(LL|lw)||lwl||lwr||(SC|sw)||swl||swr||lb||lbu||lh||lhu||sb||sh||mult||multu||div||mthi||mtlo||
          divu||sllv||srlv||srav||my_And||my_Or||my_Xor||my_Nor||ori||Andi||Xori||slt||sltu||slti||sltiu||mul
          ||clo||clz||madd||maddu||msub||msubu) ? 1:0;

    wire [3:0] T_Rt =
         (add||addu||sub||subu||mult||multu||div||divu||sll||srl||sra||sllv||srlv||srav||
          my_And||my_Or||my_Xor||my_Nor||slt||sltu||mul||madd||maddu||msub||msubu) ? 1:
         ((SC|sw)||swl||swr||sb||sh||mtc0) ? 2:0;

    assign T =
           (addi||addiu||add||addu||sub||subu||lui||jal||jalr||mfhi||mflo||sll||srl||sra||sllv||srlv||srav||
            my_And||my_Or||my_Xor||my_Nor||ori||Andi||Xori||slt||sltu||slti||sltiu) ? 2:
           (lwl|lwr) ? 4:
           3;
    wire MultFamily;
    assign MultFamily = (mult|multu|div|divu|mfhi|mflo|mthi|mtlo|mul|madd|maddu|msub|msubu);
    wire stall_Rs = NeedRs && Rs!=5'b0 &&( (D_T>T_Rs && D_RegId==Rs)|| (E_T>T_Rs && E_RegNumber==Rs)),
         stall_Rt = NeedRt && Rt!=5'b0 &&( (D_T>T_Rt && D_RegId==Rt)|| (E_T>T_Rt && E_RegNumber==Rt));

    wire stall_XALU;
    wire clod = D_InstrBus[16];
    wire clzd = D_InstrBus[15];
    assign stall_XALU = ((XALU_Busy&MultFamily)|(MultFamily&D_MultCalFamily));
    assign stall = (stall_Rs|stall_Rt|stall_XALU|salu_busy_real|((clod|clzd))) & !ExceptionFlush ;

endmodule
