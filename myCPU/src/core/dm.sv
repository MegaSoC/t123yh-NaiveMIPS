`include "constants.svh"

module DataMemoryWriteShifter(
           input [1:0] widthCtrl,
           input [31:0] address,
           input [31:0] writeDataIn,
           output logic [31:0] writeDataOut
);

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

module DataMemoryReadShifter (
    input [1:0] widthCtrl,
    input readEnable,
    input extendCtrl,
    output logic [31:0] readData,
    input [31:0] address,
    input [31:0] data_sram_rdata
);

logic [15:0] halfWord;
logic [7:0] readbyte;
always_comb begin
    readData = 0;
    readbyte = 'bx;
    if (!readEnable) begin
        readData = 'bX;
    end 
    else if (widthCtrl == `memWidth4) begin
        readData = data_sram_rdata;
    end
    else if (widthCtrl == `memWidth2) begin
        if (address[1]) begin
            halfWord = data_sram_rdata[31:16];
        end
        else begin
            halfWord = data_sram_rdata[15:0];
        end
        if (extendCtrl) begin
            readData = $signed(halfWord);
        end
        else begin
            readData = halfWord;
        end
    end
    else if (widthCtrl == `memWidth1) begin
        if (address[1:0] == 3) begin
            readbyte = data_sram_rdata[31:24];
        end
        else if (address[1:0] == 2) begin
            readbyte = data_sram_rdata[23:16];
        end
        else if (address[1:0] == 1) begin
            readbyte = data_sram_rdata[15:8];
        end
        else if (address[1:0] == 0) begin
            readbyte = data_sram_rdata[7:0];
        end
        if (extendCtrl) begin
            readData = $signed(readbyte);
        end
        else begin
            readData = readbyte;
        end
    end
end


endmodule