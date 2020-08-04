`timescale 1ns / 1ps

module MemExtUnit(
        input [31:0] RawMemData,
        input [1:0] Offset,
        input [8:0] ExtType,
        input M_MemFamily,
        output [31:0] ExtMemData,
        output [31:0] M_Data,
        input M_WriteRegEnable,
        output [3:0] M_WriteRegEnableExted
    );
    assign M_Data = M_MemFamily ? ExtMemData:RawMemData;
    wire lb,lbu,lh,lhu,lw,lwl,lwr,swl,swr;
    assign {lb,lbu,lh,lhu,lw,lwl,lwr,swl,swr}=ExtType;
    logic [31:0] lwld,alwld;
    assign lwld = ( RawMemData<<({Offset,3'b0}));
    assign alwld = ( RawMemData>>({Offset,3'b0}));

    logic normal;
    assign normal = !(lb|lbu|lh|lhu|lwl);
    assign ExtMemData = ({32{lhu}} & {16'b0,alwld[15:0]})|
           ({32{lh}} & {{16{alwld[15]}},alwld[15:0]})|
           ({32{lbu}} & {24'b0,alwld[7:0]})|
           ({32{lb}} & {{24{alwld[7]}},alwld[7:0]})|
           ({32{lwl}} & lwld)|
           ({32{normal}} & alwld);
    wire [3:0] WritePreExted = {4{M_WriteRegEnable}};
    logic pnormal;
    assign pnormal = !(lwl|lwr);
    assign M_WriteRegEnableExted = ({32{lwr}}&(WritePreExted>>Offset)) | ({32{lwl}}&( WritePreExted<<(~Offset))) | ({32{pnormal}}&(WritePreExted));

endmodule
