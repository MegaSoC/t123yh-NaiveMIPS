`include "my_global.h"

module XALU(
        input Clk,
        input Clr,
        input [`INSTRBUS_WIDTH-1:0] InstrBus,

        input [31:0] XALU_A,
        input [31:0] XALU_B,
        output [31:0] XALU_HI,
        output [31:0] XALU_LO,

        output XALU_Busy,
        output reg mul_ok,
        input Intreq

    );


    wire `INSTR_SET;
    assign {`INSTR_SET} = InstrBus;
    reg MulSel;

    initial begin
        MulSel=0;
    end


        wire XALU_Start = (!Intreq)&(mult|multu|div|divu|mul);
    
        /*module DivCore(
    input Clk,
    input [31:0] A,
    input [31:0] B,
    input start,
    output reg [63:0] C,
    input sign,
    input [1:0] WriteEnable,
    output Busy
    );*/


    wire Div_Busy;
    wire [31:0] Div_HI,Div_LO;
    wire XALU_sign = (mult|div|mul);
    wire [1:0] WriteEnable = {mthi,mtlo};
    DivCore DivCore(
                .Clk(Clk),
                .A(XALU_A),
                .B(XALU_B),
                .start(XALU_Start),
                .C({Div_HI,Div_LO}),
                .sign(XALU_sign),
                .WriteEnable(WriteEnable),
                .Busy(Div_Busy)
            );


    /*module MultCore(
    input Clk, 
    input [31:0] A, 
    input [31:0] B, 
    output [31:0] HI,
    output [31:0] LO,
    input start, 
    input sign,
    input [1:0] WriteEnable,
    output Busy
    );*/
    wire [31:0] Mul_HI,Mul_LO;
    wire Mul_Busy;
    MultCore MultCore(
                 .Clk(Clk),
                 .A(XALU_A),
                 .B(XALU_B),
                 .HI(Mul_HI),
                 .LO(Mul_LO),
                 .start(XALU_Start),
                 .sign(XALU_sign),
                 .WriteEnable(WriteEnable),
                 .Busy(Mul_Busy)
             );
    


    always@(posedge Clk) begin
        if(Clr)begin
            mul_ok <= 1'b1;
        end

        else if(!Clr && XALU_Start) begin
            if(mul|mult) begin
                if(mul)begin
                    mul_ok <= 1'b0;
                end
                MulSel <= 1;
            end
            if(multu) begin
                MulSel <= 1;
            end
            if(div) begin
                MulSel <= 0;
            end
            if(divu) begin
                MulSel <= 0;
            end
        end
        else if(!XALU_Busy) begin
            mul_ok <= 1'b1;
        end

    end

    assign {XALU_HI,XALU_LO} = MulSel ? {Mul_HI,Mul_LO}:
           {Div_HI,Div_LO};
    assign XALU_Busy = MulSel ? Mul_Busy:Div_Busy;

endmodule
