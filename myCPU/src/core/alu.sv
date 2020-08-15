`include "my_global.vh"

module ALU(
        input [31:0] srca,
        input [31:0] srcb,
        input [4:0] shamt,
        input [15:0] Imm16,
        input [31:0] PC,
        input [`INSTRBUS_WIDTH-1:0] InstrBus,
        output [31:0] aluresult,
        output [31:0] datainter,
        input mfhi1,
        input mflo1,
        input mul1,
        input [31:0] hi,
        input [31:0] lo,
        input llbit,
        output [31:0] Data_Inter_onlyaddr,
        output OverFlow
    );
    logic `INSTR_SET;
    assign {`INSTR_SET} = InstrBus;
    logic [31:0] Imm32;
    logic [2:0] extendop;
    assign extendop[0] = (ori|Andi|Xori);
    assign extendop[1] = lui;
    assign extendop[2] = !(ori|Andi|Xori|lui);
    assign Imm32 = ({{16'b0},Imm16}&{32{extendop[0]}}) | ({Imm16,{16'b0}}&{32{extendop[1]}}) | ({{16{Imm16[15]}},Imm16}&{32{extendop[2]}});

    logic normal;
    assign normal = (addiu|addu|add|addi|(LL|lw)|lwl|lwr|(SC|sw)|swl|swr|lb|lbu|lh|lhu|sb|sh|subu|sub);
    logic [31:0] normal_a,normal_b;
    logic isReg;
    assign isReg = ((add|addu)|(sub|subu));
    assign normal_a = srca;
    assign normal_b = isReg ? srcb : Imm32;
    logic [32:0] add_tmp,sub_tmp;
    assign add_tmp = {normal_a[31],normal_a}+{normal_b[31],normal_b};
    assign sub_tmp = {normal_a[31],normal_a}-{normal_b[31],normal_b};
    logic [31:0] add_r, sub_r,addu_r,subu_r;
    assign add_r = add_tmp[31:0];
    assign sub_r = sub_tmp[31:0];
    assign addu_r = normal_a+normal_b;
    assign subu_r = normal_a-normal_b;
    logic add_o, sub_o;
    assign add_o = add_tmp[32]!=add_tmp[31];
    assign sub_o = sub_tmp[32]!=sub_tmp[31];
    assign OverFlow = ((addi | add) & add_o) | (sub & sub_o);
    logic [31:0] normal_r;
    logic [3:0] normal_op;
    assign normal_op[0] = subu;
    assign normal_op[1] = sub;
    assign normal_op[2] = (addiu|addu);
    assign normal_op[3] = !(subu|sub|addiu|addu);
    assign normal_r = ({32{normal_op[0]}}&subu_r) | ({32{normal_op[1]}}&sub_r) | ({32{normal_op[2]}}&addu_r) | ({32{normal_op[3]}}&add_r);


    logic i;
    assign i = (ori|my_Or|my_And|Andi|my_Xor|Xori| my_Nor|lui);
    logic [31:0] i_a,i_b;
    assign i_a = srca;
    assign i_b = (ori|Andi|Xori) ? Imm32 : srcb;
    logic [31:0] i_r;

    logic [4:0] i_op;
    assign i_op[0] = (my_Xor|Xori);
    assign i_op[1] = (my_Or|ori);
    assign i_op[2] = (my_And|Andi);
    assign i_op[3] = lui;
    assign i_op[4] = !(my_Xor|Xori|my_Or|ori|my_And|Andi|lui);
    assign i_r = ({32{i_op[0]}}&(i_a^i_b)) | ({32{i_op[1]}}&(i_a|i_b)) | ({32{i_op[2]}}&(i_a&i_b)) | ({32{i_op[3]}}&(Imm32)) | ({32{i_op[4]}}&(~(i_a|i_b)));

    logic s ;
    assign s = (sll|sllv)|(srl|srlv)|(sra|srav);
    logic [31:0] s_a ,s_b;
    assign s_a = (sll|srl|sra) ? shamt : srca;
    assign s_b = srcb;
    logic [31:0] s_r;
    assign s_r = (sll|sllv) ? s_b<<s_a[4:0]:
           (srl|srlv) ? s_b>>s_a[4:0]:
           $signed($signed(s_b)>>>s_a[4:0]);

    logic cmp;
    assign cmp = (slt|slti)|(sltu|sltiu);
    logic [31:0] cmp_a,cmp_b;
    assign cmp_a = srca;
    assign cmp_b = (slti|sltiu) ? Imm32 : srcb;
    logic [31:0] cmp_r;
    assign cmp_r = (slt|slti) ? ($signed(cmp_a)<$signed(cmp_b)):($unsigned(cmp_a)<$unsigned(cmp_b));

    logic mov;
    assign mov = (movn|movz);
    logic [31:0] movr;
    assign movr = srca;

    logic type_pc;
    assign type_pc = (jal|jalr|(bltzal||bltzall)|(bgezal||bgezall));

    wire [31:0] cache_r;
    assign cache_r = srca + Imm32;

    assign Data_Inter_onlyaddr = ({32{CACHE}}&cache_r) | ({32{!CACHE}}&add_r);

    assign aluresult = ({32{normal}}&normal_r) | ({32{i}}&i_r) | ({32{s}}&s_r) | ({32{cmp}}&cmp_r) | ({32{type_pc}}&(PC+8) | ({32{mov}}&movr));

    assign datainter = ({32{mfhi1}} & hi) | ({32{mflo1|mul}} & lo) | ({32{normal}}&normal_r) | ({32{i}}&i_r) | ({32{s}}&s_r) | ({32{cmp}}&cmp_r) | ({32{type_pc}}&(PC+8)| ({32{mov}}&movr) | ({32{CACHE}}&cache_r));
endmodule
