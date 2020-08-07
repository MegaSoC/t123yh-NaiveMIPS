`timescale 1ns / 1ps

module NTrap(
        input [31:0] instr,
        input signed [31:0] rs,
        input signed [31:0] rt,
        output [31:0] is_trap
    );
    wire [4:0] Rt;
    assign Rt = instr[20:16];
    wire [5:0] OpCode = instr[31:26],
         Funct = instr[5:0];

    wire [31:0] urs,urt;
    assign urs = rs;
    assign urt = rt;
    wire signed [31:0] imm32;
    wire [31:0] uimm32;
    assign imm32 = {{16{instr[15]}},instr[15:0]};
    assign uimm32 = imm32;

    wire teq = (OpCode == 6'h0 && Funct == 6'b110100);
    wire teqi = (OpCode == 6'h1 && Rt == 5'b01100);
    wire tge = (OpCode == 6'h0 && Funct == 6'b110000);
    wire tgei = (OpCode == 6'h1 && Rt == 5'b01000);
    wire tgeiu = (OpCode == 6'h1 && Rt == 5'b01001);
    wire tgeu = (OpCode == 6'h0 && Funct == 6'b110001);
    wire tlt = (OpCode == 6'h0 && Funct == 6'b110010);
    wire tlti = (OpCode == 6'h1 && Rt == 5'b01010);
    wire tltiu = (OpCode == 6'h1 && Rt == 5'b01011);
    wire tltu = (OpCode == 6'h0 && Funct == 6'b110011);
    wire tne = (OpCode == 6'h0 && Funct == 6'b110110);
    wire tnei = (OpCode == 6'h1 && Rt == 5'b01110);

    assign is_trap = (teq && rs == rt) || 
                     (teqi && rs == imm32) || 
                     (tge && rs >= rt) || 
                     (tgei && rs >= imm32) || 
                     (tgeiu && urs >= uimm32) || 
                     (tgeu && urs >= urt) || 
                     (tlt && rs <= rt) || 
                     (tlti && rs <= imm32) || 
                     (tltiu && urs <= uimm32) || 
                     (tltu && urs <= urt) || 
                     (tne && rs != rt) || 
                     (tnei && rs != imm32);

endmodule
