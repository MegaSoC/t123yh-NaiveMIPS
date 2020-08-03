`include "my_global.h"

module ALU(
        input	[31:0]	A,
        input	[31:0]	B,
        input	[4:0]	shamt,
        input	[15:0]	Imm16,
        input	[31:0]	PC,
        input	[`INSTRBUS_WIDTH-1:0]	InstrBus,
        output	[31:0]	C,
        output  		OverFlow
    );
    wire	`INSTR_SET;
    assign  {`INSTR_SET}         =   InstrBus;
    ///////////////////Extention///////////////////////////////////
    wire    zeroExtend           =   ori|Andi|Xori;
    wire    [31:0]  Imm32        =   zeroExtend  ?   {{16'b0},Imm16}:
            lui			?	{Imm16,{16'b0}}:
            {{16{Imm16[15]}},Imm16};

    //////////////////Add\Sub Family///////////////////////////////////
    wire    AS_Family            =   ((addiu|addu)|
                                      (((add|addi)|(lw|lwl|lwr|sw|swl|swr|lb))|((lbu|lh|lhu)|(sb|sh))))|
            (subu|
             sub);
    wire [31:0]	AS_A,AS_B;
    wire    isReg                =   ((add|addu)|(sub|subu));
    assign  AS_A                 =   A;
    assign  AS_B                 =   isReg   ?   B   :   Imm32;
    wire    [32:0]  signedAddTmp =   {AS_A[31],AS_A}+{AS_B[31],AS_B},
            signedSubTmp =   {AS_A[31],AS_A}-{AS_B[31],AS_B};
    wire    [31:0]  signedAddAns =   signedAddTmp[31:0],
            signedSubAns =   signedSubTmp[31:0],
            unsignAddAns =   AS_A+AS_B,
            unsignSubAns =   AS_A-AS_B;
    wire    addOverFlow          =   signedAddTmp[32]!=signedAddTmp[31],
            subOverFlow          =   signedSubTmp[32]!=signedSubTmp[31];
    assign  OverFlow             = ((addi | add) & addOverFlow) |
            (sub & subOverFlow);
    wire    [31:0]  AS_Ans       =   (subu)          ?   unsignSubAns:
            (sub)			?	signedSubAns:
            (addiu|addu)	?	unsignAddAns:
            signedAddAns;
    //////////////////BitCal Family/////////////////////////////////////
    wire    BC_Family            =   ((ori|my_Or)|
                                      (my_And|Andi))|
            ((my_Xor|Xori)|
             (my_Nor|lui));
    wire    [31:0]  BC_A         =   A,
            BC_B         =   (ori|Andi|Xori) ?   Imm32   :   B;
    wire    [31:0]  BC_Ans       =   (my_Xor|Xori)   ?   BC_A^BC_B:
            (ori|my_Or)	?	BC_A|BC_B:
            (my_And|Andi)	?	BC_A&BC_B:
            (lui)		?	Imm32:
            ~(BC_A|BC_B);//my_Nor
    //////////////////Shamt	Family/////////////////////////////////////
    wire    sllType              =   sll|sllv,
            srlType          =   srl|srlv,
            sraType          =   sra|srav;
    wire    ST_Family            =   sllType|srlType|sraType;
    wire    [31:0]  ST_A         =   (sll|srl|sra)   ?   shamt   :   A,
            ST_B         =   B;
    wire    [31:0]  ST_Ans       =   sllType ?   ST_B<<ST_A[4:0]:
            srlType	?	ST_B>>ST_A[4:0]:
            $signed($signed(ST_B)>>>ST_A[4:0]);
    /////////////////CMP Family////////////////////////////////////////
    wire    sltType              =   slt|slti,
            sltuType             =   sltu|sltiu;
    wire    CMP_Family           =   sltType|sltuType;

    wire    [31:0]  CMP_A        =   A,
            CMP_B        =   (slti|sltiu)    ?   Imm32   :   B;
    wire    [31:0]  CMP_Ans      =   sltType ?   ($signed(CMP_A)<$signed(CMP_B)):
            ($unsigned(CMP_A)<$unsigned(CMP_B));
    /////////////////JL Family/////////////////////////////////////////
    wire    JL_Family            =   jal|jalr|bltzal|bgezal;
    wire    [31:0]  JL_Ans       =   PC+8;

    /////////////////OUT PUT///////////////////////////////////////////
    assign  C                    =   AS_Family   ?   AS_Ans:
                         BC_Family	?	BC_Ans:
                         ST_Family	?	ST_Ans:
                         CMP_Family	?	CMP_Ans:
                         JL_Family	?	JL_Ans:
                         32'h22222222;//DEBUG
endmodule
