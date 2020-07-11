`timescale 1ns / 1ps

module MemExtUnit(
    input   [31:0]  RawMemData,
    input   [1:0]   Offset,
    input   [8:0]   ExtType,
    output  [31:0]  ExtMemData,
    input   M_WriteRegEnable,
    output  [3:0]   M_WriteRegEnableExted
    );
    wire lb,lbu,lh,lhu,lw,lwl,lwr,swl,swr;
    assign {lb,lbu,lh,lhu,lw,lwl,lwr,swl,swr}=ExtType;
    wire [31:0] OffsetedData = lwl ? ( RawMemData<<({Offset,3'b0})):
                                      ( RawMemData>>({Offset,3'b0}));

    assign ExtMemData = lhu ?   {16'b0,OffsetedData[15:0]}:
                        lh  ?   {{16{OffsetedData[15]}},OffsetedData[15:0]}:
                        lbu ?   {24'b0,OffsetedData[7:0]}:
                        lb  ?   {{24{OffsetedData[7]}},OffsetedData[7:0]}:
                                OffsetedData;
    wire    [3:0]   WritePreExted = {4{M_WriteRegEnable}};
    assign M_WriteRegEnableExted = lwr  ?   WritePreExted>>Offset:
                                   lwl  ?   WritePreExted<<(~Offset):
                                            WritePreExted;
endmodule
