`include "constants.v"
module DataMemory(
           input clk,
           input reset,
           input writeEnable,
           input readEnable,
           input [1:0] widthCtrl,
           input [31:0] address,
           input [31:0] writeDataIn,
           output exception
);

logic addressException;
assign exception = addressException;
always_comb begin
    addressException = 0;
    if (readEnable || writeEnable) begin
        if (widthCtrl == `memWidth4) begin
            if (address[1:0] != 0) begin
                addressException = 1;
            end
        end
        else if (widthCtrl == `memWidth2) begin
            if (address[0] != 0) begin
                addressException = 1;
            end
        end
    end
end

endmodule
