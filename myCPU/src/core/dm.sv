`include "constants.svh"

module DataMemoryWriteShifter(
           input [1:0] widthCtrl,
           input [31:0] address,
           input [31:0] writeDataIn,
           input unaligned,
           input leftPart,
           output logic [31:0] writeDataOut,
           output logic [3:0] writeByteEn
);
wire [1:0] offset = address[1:0];

always_comb begin
    writeDataOut = 'bx;
    writeByteEn = 0;
    if (unaligned) begin
        if (leftPart) begin
            writeDataOut = writeDataIn >> {~offset, 3'b0};
            writeByteEn = 4'b1111 >> (~offset);
        end else begin 
            writeDataOut = writeDataIn << {offset, 3'b0};
            writeByteEn = 4'b1111 << offset;
        end
    end else begin
        if (widthCtrl == `memWidth4) begin
            writeDataOut = writeDataIn;
            writeByteEn = 4'b1111;
        end
        else if (widthCtrl == `memWidth2) begin
            writeByteEn = 4'b0011 << offset;
            writeDataOut = {16'b0, writeDataIn[15:0]} << {offset, 3'b0};
        end
        else if (widthCtrl == `memWidth1) begin
            writeByteEn = 4'b0001 << offset;
            writeDataOut = {24'b0, writeDataIn[7:0]} << {offset, 3'b0};
        end
    end
end
endmodule

module DataMemoryReadShifter(
    input [1:0] widthCtrl,
    input extendCtrl,
    input [31:0] address,
    input [31:0] data_sram_rdata,
    input [31:0] originalData,
    input unaligned,
    input leftPart,
    output logic [31:0] readData
);

logic [15:0] halfWord;
logic [7:0] readbyte;
wire [1:0] offset = address[1:0];
logic [31:0] mask;
logic [31:0] shiftedData;
always_comb begin
    readData = 0;
    readbyte = 'bx;
    if (unaligned) begin
        if (leftPart) begin
            readData = (data_sram_rdata<<({~offset,3'b0})) | (originalData & ~(32'hFFFFFFFF << {~offset, 3'b0}));
        end else begin
            readData = (data_sram_rdata>>({offset,3'b0})) | (originalData & ~(32'hFFFFFFFF >> {offset, 3'b0}));
        end
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