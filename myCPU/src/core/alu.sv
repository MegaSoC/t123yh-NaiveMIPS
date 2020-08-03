`include "my_global.vh"

module ALU(
        input [31:0] srca,
        input [31:0] srcb,
        input [4:0] shamt,
        input [15:0] Imm16,
        input [31:0] PC,
        input [`INSTRBUS_WIDTH-1:0] InstrBus,
        output [31:0] aluresult,
        output OverFlow
    );
    logic `INSTR_SET;
    assign {`INSTR_SET} = InstrBus;
    logic [31:0] Imm32;
    assign Imm32        = (ori|Andi|Xori) ? {{16'b0},Imm16}:
         lui ? {Imm16,{16'b0}}:
         {{16{Imm16[15]}},Imm16};

    logic normal;
    assign normal       = (addiu|addu|add|addi|lw|lwl|lwr|sw|swl|swr|lb|lbu|lh|lhu|sb|sh|subu|sub);
    logic [31:0] normal_a,normal_b;
    logic isReg;
    assign isReg        = ((add|addu)|(sub|subu));
    assign normal_a     = srca;
    assign normal_b     = isReg ? srcb : Imm32;
    logic [32:0] add_tmp,sub_tmp;
    assign add_tmp      = {normal_a[31],normal_a}+{normal_b[31],normal_b};
    assign     sub_tmp  = {normal_a[31],normal_a}-{normal_b[31],normal_b};
    logic [31:0] add_r, sub_r,addu_r,subu_r;
    assign add_r        = add_tmp[31:0];
    assign   sub_r      = sub_tmp[31:0];
    assign   addu_r     = normal_a+normal_b;
    assign  subu_r      = normal_a-normal_b;
    logic add_o, sub_o;
    assign add_o        = add_tmp[32]!=add_tmp[31];
    assign   sub_o      = sub_tmp[32]!=sub_tmp[31];
    assign OverFlow     = ((addi | add) & add_o) |           (sub & sub_o);
    logic [31:0] normal_r;
    assign  normal_r    = (subu) ? subu_r:
         (sub) ? sub_r:
         (addiu|addu) ? addu_r:
         add_r;
         
    logic i;
    assign  i           = (ori|my_Or|my_And|Andi|my_Xor|Xori| my_Nor|lui);
    logic [31:0] i_a,i_b;
    assign  i_a         = srca;
    assign    i_b       = (ori|Andi|Xori) ? Imm32 : srcb;
    logic [31:0] i_r;
    assign i_r          = (my_Xor|Xori) ? i_a^i_b:
         (ori|my_Or) ? i_a|i_b:
         (my_And|Andi) ? i_a&i_b:
         (lui) ? Imm32:
         ~(i_a|i_b);     
           
    logic s ;
    assign s            = (sll|sllv)|(srl|srlv)|(sra|srav);
    logic [31:0] s_a ,s_b;
    assign s_a          = (sll|srl|sra) ? shamt : srca;
    assign   s_b        = srcb;
    logic [31:0] s_r;
    assign  s_r         = (sll|sllv) ? s_b<<s_a[4:0]:
         (srl|srlv) ? s_b>>s_a[4:0]:
         $signed($signed(s_b)>>>s_a[4:0]);

    logic cmp;
    assign cmp          = (slt|slti)|(sltu|sltiu);
    logic [31:0] cmp_a,cmp_b;
    assign  cmp_a       = srca;
    assign     cmp_b    = (slti|sltiu) ? Imm32 : srcb;
    logic [31:0] cmp_r;
    assign  cmp_r       = (slt|slti) ? ($signed(cmp_a)<$signed(cmp_b)):
         ($unsigned(cmp_a)<$unsigned(cmp_b));
         
    assign aluresult    = normal ? normal_r:
           i ? i_r:
           s ? s_r:
           cmp ? cmp_r:
           (jal|jalr|bltzal|bgezal) ? (PC+8):
           32'h17373507;endmodule
