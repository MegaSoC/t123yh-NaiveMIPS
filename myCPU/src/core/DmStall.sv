`include "my_global.vh"

module DmStall(
        input [`INSTRBUS_WIDTH-1:0] InstrBus,
        input data_sram_data_ok,
        output wire dm_stall,
        input clk,
        output read,
        output write,
        input wire o_p_stall,
        input wire uncached
    );
    wire `INSTR_SET;
    assign {`INSTR_SET} = InstrBus;

    wire lw_type = (lb|lbu|lh|lhu|lw) ;
    wire sw_type= (sb|sh|sw);
    reg stall=0;
    assign read = lw_type;
    assign write =sw_type;

    wire doesnt_ok = ((lw_type|sw_type)& uncached & !data_sram_data_ok ) | ( (!uncached) & o_p_stall) ;

    assign dm_stall = doesnt_ok ;
    /*
    always @(posedge clk)
    begin
    if (data_sram_data_ok) begin
    stall <= 0;
    end
    else if(lw_type | sw_type) begin
    stall <= 1;
    end
    end
    */
endmodule
