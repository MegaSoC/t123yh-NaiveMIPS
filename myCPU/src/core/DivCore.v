`timescale 1ns / 1ps

module DivCore(
        input Clk,
        input [31:0] A,
        input [31:0] B,
        input start,
        output reg [63:0] C,
        input sign,
        input [1:0] WriteEnable,
        output Busy
    );
    wire [31:0] PosiA = (A[31]&sign)?-A:A,
         PosiB = (B[31]&sign)?-B:B;

    reg [31:0] T;
    assign Busy = T[1];
    reg Busy_Buf;
    wire [1:0] Nega;
    assign Nega[1] = (A[31]&sign),
           Nega[0] = (B[31]&sign);
    reg [1:0] Nega_Buf;
    wire Complete = ~T[0];

    reg [66:0] tmpA,tmpB1,tmpB2,tmpB3;
    wire [66:0] sub1 = (tmpA<<2) - tmpB1,
         sub2 = (tmpA<<2) - tmpB2,
         sub3 = (tmpA<<2) - tmpB3;
    initial begin
        T <=0;
        tmpA <= 0;
        tmpB1 <= 0;
        tmpB2 <= 0;
        tmpB3 <= 0;
        Busy_Buf <= 0;

    end

    wire [31:0] HI = Nega_Buf[1] ? (-tmpA[63:32]):tmpA[63:32],
         LO = (Nega_Buf[1]^Nega_Buf[0]) ? (-tmpA[31:0]):tmpA[31:0];

    wire [31:0] debug = tmpA[31:0];
    always @ (posedge Clk) begin
        if(start) begin
            T <= 32'hffffffff;
            Nega_Buf <= Nega;
            tmpA <= {32'b0,PosiA};
            tmpB1 <= {PosiB,32'b0};
            tmpB2 <= {PosiB,32'b0}+{PosiB,32'b0};
            tmpB3 <= {PosiB,33'b0}+{PosiB,32'b0};
        end
        else if(T[15]&&(tmpA[47:16]<tmpB1[63:32])) begin            T <= (T>>16);
            tmpA <= (tmpA<<16);
        end
        else if(T[7]&&(tmpA[55:24]<tmpB1[63:32])) begin            T <= (T>>8);
            tmpA <= (tmpA<<8);
        end
        else if(T[3]&&(tmpA[59:28]<tmpB1[63:32])) begin            T <= (T>>4);
            tmpA <= (tmpA<<4);
        end
        else if(T[0]) begin            T <= (T>>2);
            tmpA <= (!sub3[66]) ? sub3 + 3:
                 (!sub2[66]) ? sub2 + 2:
                 (!sub1[66]) ? sub1 + 1:
                 tmpA<<2;
            /*tmpA <= (tmpA[63]==sub3[63]) ? sub3 + 3:
            (tmpA[63]==sub2[63]) ? sub2 + 2:
            (tmpA[63]==sub1[63]) ? sub1 + 1:
            tmpA<<2;*/
        end

        Busy_Buf <= Busy;



        C <= WriteEnable[1] ? {A,C[31:0]}:
          WriteEnable[0] ? {C[63:32],A}:
          (Busy_Buf==1'b1 && Busy==1'b0) ? {HI,LO}:
          C;
    end

    
endmodule

