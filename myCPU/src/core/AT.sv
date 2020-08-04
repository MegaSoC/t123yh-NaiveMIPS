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

        input XALU_Busy,
        input D_MultCalFamily,
        input ExceptionFlush
    );
    wire `INSTR_SET;
    assign {`INSTR_SET} = InstrBus;
    wire NeedRs =(addi||addiu||add||addu||sub||subu||lw||lwl||lwr||sw||swl||swr||lb||lbu||lh||lhu||sb||sh||jr||jalr||mult||multu||div||divu||mthi||mtlo||
                  sllv||srlv||srav||my_And||my_Or||my_Xor||my_Nor||ori||Andi||Xori||slt||sltu||slti||sltiu||
                  beq||bne||blez||bgtz||bltz||bgez||bltzal||bgezal||mul);
    wire NeedRt =(add||addu||sub||subu||sw||swl||swr||sb||sh||mult||multu||div||divu||sll||srl||sra||sllv||srlv||srav||
                  my_And||my_Or||my_Xor||my_Nor||slt||sltu||beq||bne||mtc0||mul);

    wire [3:0] T_Rs =
         (addi||addiu||add||addu||sub||subu||lw||lwl||lwr||sw||swl||swr||lb||lbu||lh||lhu||sb||sh||mult||multu||div||mthi||mtlo||
          divu||sllv||srlv||srav||my_And||my_Or||my_Xor||my_Nor||ori||Andi||Xori||slt||sltu||slti||sltiu||mul) ? 1:0;

    wire [3:0] T_Rt =
         (add||addu||sub||subu||mult||multu||div||divu||sll||srl||sra||sllv||srlv||srav||
          my_And||my_Or||my_Xor||my_Nor||slt||sltu||mul) ? 1:
         (sw||swl||swr||sb||sh||mtc0) ? 2:0;

    assign T =
           (addi||addiu||add||addu||sub||subu||lui||jal||jalr||mfhi||mflo||sll||srl||sra||sllv||srlv||srav||
            my_And||my_Or||my_Xor||my_Nor||ori||Andi||Xori||slt||sltu||slti||sltiu) ? 2:
           (lwl|lwr) ? 4:
           3;
    wire MultFamily;
    assign MultFamily = (mult|multu|div|divu|mfhi|mflo|mthi|mtlo|mul);
    wire stall_Rs = NeedRs && Rs!=5'b0 &&( (D_T>T_Rs && D_RegId==Rs)|| (E_T>T_Rs && E_RegNumber==Rs)),
         stall_Rt = NeedRt && Rt!=5'b0 &&( (D_T>T_Rt && D_RegId==Rt)|| (E_T>T_Rt && E_RegNumber==Rt));

    wire stall_XALU;
    assign stall_XALU = ((XALU_Busy&MultFamily)|(MultFamily&D_MultCalFamily));
    assign stall = (stall_Rs|stall_Rt|stall_XALU) & !ExceptionFlush ;

endmodule
