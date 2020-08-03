`include "my_global.vh"

module StallCtrlUnit(
        input [`INSTRBUS_WIDTH-1:0] InstrBus,
        input [4:0] Rs,
        input [4:0] Rt,
        input [3:0] D_T,
        input D_WriteRegEnable,
        input [4:0] D_RegId,
        input [3:0] E_T,
        input E_WriteRegEnable,
        input [4:0] E_RegId,
        output stall,
        output [3:0] T,

        input XALU_Busy,
        input D_MultCalFamily,
        input exp_flush
    );
    wire `INSTR_SET;
    assign {`INSTR_SET} = InstrBus;
        wire NeedRs =(addi||addiu||add||addu||sub||subu||lw||lwl||lwr||sw||swl||swr||lb||lbu||lh||lhu||sb||sh||jr||jalr||mult||multu||div||divu||mthi||mtlo||
                  sllv||srlv||srav||my_And||my_Or||my_Xor||my_Nor||ori||Andi||Xori||slt||sltu||slti||sltiu||
                  beq||bne||blez||bgtz||bltz||bgez||bltzal||bgezal||mul);
    wire NeedRt =(add||addu||sub||subu||sw||swl||swr||sb||sh||mult||multu||div||divu||sll||srl||sra||sllv||srlv||srav||
                  my_And||my_Or||my_Xor||my_Nor||slt||sltu||beq||bne||mtc0||mul);

    wire [3:0] T_Rs =(beq||bne||blez||bgtz||bltz||bgez||bltzal||bgezal) ? 0:
         (addi||addiu||add||addu||sub||subu||lw||lwl||lwr||sw||swl||swr||lb||lbu||lh||lhu||sb||sh||mult||multu||div||mthi||mtlo||
          divu||sllv||srlv||srav||my_And||my_Or||my_Xor||my_Nor||ori||Andi||Xori||slt||sltu||slti||sltiu||mul) ? 1:0;

    wire [3:0] T_Rt =(beq||bne) ? 0:
         (add||addu||sub||subu||mult||multu||div||divu||sll||srl||sra||sllv||srlv||srav||
          my_And||my_Or||my_Xor||my_Nor||slt||sltu||mul) ? 1:
         (sw||swl||swr||sb||sh||mtc0) ? 2:0;

    wire [3:0] Tnew =(lw||lhu||lh||lbu||lb||mfc0) ? 3:
         (addi||addiu||add||addu||sub||subu||lui||jal||jalr||mfhi||mflo||sll||srl||sra||sllv||srlv||srav||
          my_And||my_Or||my_Xor||my_Nor||ori||Andi||Xori||slt||sltu||slti||sltiu) ? 2:
         (lwl|lwr) ? 4:
         3;
    assign T = Tnew;
    wire MultFamily;
    assign MultFamily = (mult|multu|div|divu|mfhi|mflo|mthi|mtlo|mul);
        wire Rt_stallByD = (D_WriteRegEnable && D_T>T_Rt && D_RegId==Rt);
    wire stall_Rs = NeedRs && Rs!=5'b0 &&( (D_WriteRegEnable && D_T>T_Rs && D_RegId==Rs)|| (E_WriteRegEnable && E_T>T_Rs && E_RegId==Rs)),
         stall_Rt = NeedRt && Rt!=5'b0 &&( Rt_stallByD|| (E_WriteRegEnable && E_T>T_Rt && E_RegId==Rt));

    wire stall_XALU;
    assign stall_XALU = ((XALU_Busy&MultFamily)|(MultFamily&D_MultCalFamily));
    assign stall = (stall_Rs|stall_Rt|stall_XALU) & !exp_flush ;

endmodule
