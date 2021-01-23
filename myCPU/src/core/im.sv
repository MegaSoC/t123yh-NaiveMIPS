`include "constants.v"
module InstructionMemory(
           input clk,
           input reset,
           input absJump,
           input pcStall,
           input hang,
           input [31:0] absJumpAddress, // In bytes
           output [31:0] outputPC,
           output [31:0] instruction,
           output reg exception,
           output [31:0] inst_sram_addr,
           output inst_sram_readen,
           input [31:0] inst_sram_rdata,
           input inst_sram_valid,
           output bubble
       );

// TODO: 判断什么时候需要 readen（比如流水线遇到异常时，就不应该读取后续指令）
assign inst_sram_readen = 1;

// reg [31:0] memory [4095:0];
wire isHanging;


// wire [31:0] realAddress = pc - 32'h3000;
reg [31:0] pc;
reg hangState;
assign outputPC = hangState ? 0 : pc;
wire pendingRead = !pcStall && !inst_sram_valid;
assign bubble = hangState || pendingRead;
// assign instruction = isHanging ? 0 : memory[realAddress[13:2]];
assign instruction = isHanging ? 0 : inst_sram_rdata;
assign isHanging = hang || hangState;
reg pendingJump;
reg [31:0] pendingJumpAddr;

always @(*) begin
    exception = 0;
    if (!hangState) begin
        if (pc[1:0] != 0) begin
            exception = 1;
        end
    end
end

logic [31:0] nextPC;
assign inst_sram_addr = nextPC;
logic notJumping, jumped;

always_comb begin
    notJumping = 0;
    jumped = 0;
                if (reset) begin
                    nextPC  = 32'hBFC00000;
                end
                else begin
                    if (pcStall || pendingRead) begin
                        nextPC = pc;
                        notJumping = absJump;
                    end
                    else if (absJump) begin
                        nextPC = absJumpAddress;
                    end
                    else if (pendingJump) begin
                        nextPC = pendingJumpAddr;
                        jumped = 1;
                    end
                    else begin
                        if (hang) begin
                            nextPC = pc;
                        end
                        else if (!isHanging) begin
                            nextPC = pc + 4;
                        end
                    end
                end
            end

            always @(posedge clk) begin
`ifdef DEBUG
                // $display("@%h, delta = %d, instruction = %h", pc, relJumpDelta, instruction);
`endif
                if (reset)
                begin
                    hangState <= 0;
                    pendingJump <= 0;
                    pendingJumpAddr <= 0;
                end
                else begin
                    if (pcStall) begin
                    end
                    else if (absJump) begin
                        hangState <= 0;
                    end
                    else begin
                        if (hang) begin
                            hangState <= 1;
                        end
                    end
                    if (notJumping) begin
                        pendingJump <= 1;
                        pendingJumpAddr <= absJumpAddress;
                    end else begin
                        if (jumped) begin
                            pendingJump <= 0;
                        end
                    end
                end
                pc <= nextPC;
            end

            always @(*) begin
`ifdef VERBOSE
                $display("PC @ %h", pc);
`endif

            end

            endmodule
