`include "constants.svh"
module DataMemory(
           input clk,
           input reset,
           input dataValid,
           input writeEnable,
           input readEnable,
           input [1:0] widthCtrl,
           input [31:0] address,
           input [31:0] writeDataIn,
           input LLbit,
           output logic writeEnableOut,
           output logic readEnableOut,
           output logic [31:0] writeDataOut
);

always_comb begin
    readEnableOut = 0;
    writeEnableOut = 0;
    if (dataValid) begin
        writeEnableOut = writeEnable;
        readEnableOut = readEnable;
    end
end

always_comb begin
    writeDataOut = 0;
    if (widthCtrl == `memWidth4) begin
        writeDataOut = writeDataIn;
    end
    else if (widthCtrl == `memWidth2) begin
        if (address[1] == 1) begin
            writeDataOut = {writeDataIn[15:0], 16'b0};
        end
        else begin
            writeDataOut = {16'b0, writeDataIn[15:0]};
        end
    end
    else if (widthCtrl == `memWidth1) begin
        if (address[1:0] == 3) begin
            writeDataOut = {writeDataIn[7:0], 24'b0};
        end
        else if (address[1:0] == 2) begin
            writeDataOut = {8'b0, writeDataIn[7:0], 16'b0};
        end
        else if (address[1:0] == 1) begin
            writeDataOut = {16'b0, writeDataIn[7:0], 8'b0};
        end
        else begin
            writeDataOut = {24'b0, writeDataIn[7:0]};
        end
    end
end

endmodule
