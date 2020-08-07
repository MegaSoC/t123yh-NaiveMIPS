`include "my_global.vh"

module SALU(//special alu:clo,clz
        input clk,
        input reset,
        input [`INSTRBUS_WIDTH-1:0] instrBus,

        input [31:0] salua,
        output [31:0] salur,

        output saluBusy,
        input saluFlush
    );


endmodule
