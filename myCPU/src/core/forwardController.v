module ForwardController (
           input [4:0] request,
           input [31:0] original,
           input enabled,
           output reg [31:0] value,
           output stallExec,

           // priority: src1 > src2
           input src1Valid,
           input [4:0] src1Reg,
           input [31:0] src1Value,

           input src2Valid,
           input [4:0] src2Reg,
           input [31:0] src2Value
       );

reg stall;
assign stallExec = stall & enabled;

always @(*) begin
    if (request == 0) begin
        value = 0;
        stall = 0;
    end
    else if (src1Reg == request) begin
        if (!src1Valid) begin
            stall = 1;
            value = 'bx;
        end
        else begin
            stall = 0;
            value = src1Value;
        end
    end
    else if (src2Reg == request) begin
        if (!src2Valid) begin
            stall = 1;
            value = 'bx;
        end
        else begin
            stall = 0;
            value = src2Value;
        end
    end
    else begin
        value = original;
        stall = 0;
    end
end

endmodule
