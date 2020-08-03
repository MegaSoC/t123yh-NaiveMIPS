`include "my_global.h"

module MemCtrlUnit(
        input [`INSTRBUS_WIDTH-1:0] InstrBus,
        input [1:0] Offset,//地址末尾的两�??
        output [8:0] ExtType,
        output [3:0] MemWriteEnable,
        output MemFamily,
        output load_alignment_err,
        output store_alignment_err,
                output LoadFamily,
        output E_MemSaveType_Inter
            );
    wire `INSTR_SET;
    assign {`INSTR_SET} = InstrBus;
    assign ExtType = {lb,lbu,lh,lhu,lw,lwl,lwr,swl,swr};
    assign MemFamily = lb|lbu|lh|lhu|lw|sb|sh|sw;
    assign load_alignment_err = (lw & Offset[1:0]!=0) |
           (lh & Offset[0] !=0) |
           (lhu & Offset[0] !=0) ;
    assign store_alignment_err = (sw & Offset[1:0]!=0) |
           (sh & Offset[0] !=0) ;
    assign MemWriteEnable = store_alignment_err ? 4'b0000: //必须提前禁止写内�??
           sw ? 4'b1111:
           sh ? 4'b0011<<Offset:
           sb ? 4'b0001<<Offset:
           swl ? 4'b1111>>(~Offset):
           swr ? 4'b1111<<(Offset):
           4'b0000;
    assign LoadFamily = lb|lbu|lh|lhu|lw|lwl|lwr ;

    assign E_MemSaveType_Inter = sw|sb|sh ;

endmodule
