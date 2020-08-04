`timescale 1ns / 1ps

module NPC(
        input [31:0] instr,
        input signed [31:0] rs,
        input signed [31:0] rt,
        input [31:0] ipc,
        input ExceptionFlush,
        input [31:0] epc,
        output [31:0] npc
    );
    wire [25:0] Imm26 = instr[25:0];
    wire [15:0] Imm16 = instr[15:0];
    wire [5:0] op = instr[31:26],
         func = instr[5:0];
    wire [31:0] pc4 = ipc+4;
    wire j = (op==6'h2),
         jal = (op==6'h3);
    wire j_type = j|jal;
    wire [31:0] jpc = {ipc[31:28],Imm26,2'b00};
    wire jr = (op==6'h0 && func==6'h8),
         jalr = (op==6'h0 && func==6'h9);
    wire jr_type = jr|jalr;
    wire [31:0] jrpc = rs;
    wire beq = (op==6'h4),
         bne = (op==6'h5),
         blez = (op==6'h6),
         bgtz = (op==6'h7),
         bltz = (instr[31:26]==6'h1 && instr[20:16]==6'h0),
         bgez = (instr[31:26]==6'h1 && instr[20:16]==6'h1);
    wire bltzal = (op==6'b000001 && instr[20:16]==5'b10000),
         bgezal = (op==6'b000001 && instr[20:16]==5'b10001);
    wire b_type = (beq|bne|blez)|(bgtz|bltz|bgez)|(bltzal|bgezal);

    logic b_valid;
    assign b_valid = (beq&(rs==rt)) | (bne&(rs!=rt)) | (blez&(rs<=0)) | (bgtz&(rs>0)) | ((bltz|bltzal)&(rs<0)) | ((bgez|bgezal)&(rs>=0));
    wire [31:0] bpc = ipc + {{14{Imm16[15]}},Imm16,2'b00};
    logic normal;
    assign normal = !(j_type | jr_type | (b_type & b_valid));
    assign npc = ExceptionFlush ? epc :
           ({32{j_type}}&jpc) | ({32{jr_type}}&jrpc) | ({32{(b_type & b_valid)}}&bpc) | ({32{normal}}&pc4);

endmodule
