module GeneralRegisterFile(
           input clk,
           input reset,
           input [31:0] debugPC,

           input [4:0] readAddress1,
           output reg [31:0] readOutput1,
           input [4:0] readAddress2,
           output reg [31:0] readOutput2,
           input [4:0] writeAddress,
           input [31:0] writeData
       );

reg [31:0] registers [31:0];

always @(*) begin
    readOutput1 = registers[readAddress1];
    readOutput2 = registers[readAddress2];
end

integer i;
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i <= 31; i = i + 1) begin
            registers[i] <= 0;
        end
    end
    else begin
        if (writeAddress != 0) begin
           // $display("@%h: $%d <= %h", debugPC, writeAddress, writeData);
            registers[writeAddress] <= writeData;
        end
    end
end

endmodule
