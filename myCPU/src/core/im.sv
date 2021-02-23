`include "constants.svh"
module InstructionMemory(
           input clk,
           input reset,

           input absJump,
           input [31:0] absJumpAddress, // In bytes

           input stall,
           input exception,
           input fetchException,

           output [31:0] outputPC,
           output [31:0] instruction,
           output logic bubble,
           output logic isDelaySlot,

           output [31:0] inst_sram_addr,
           output logic inst_sram_readen,
           input [31:0] inst_sram_rdata,
           input inst_sram_valid
);

// TODO: 判断什么时候需要 readen（比如流水线遇到异常时，就不应该读取后续指令）

reg [31:0] pc;
logic [31:0] pc_next;

reg pendingException;
logic pendingException_next;
reg pendingJump;
logic pendingJump_next;
reg [31:0] pendingJumpAddr;
reg busy;
wire canSendNewCommand = inst_sram_valid || !busy;
assign instruction = inst_sram_rdata;
assign outputPC = pc;
assign inst_sram_addr = pc_next;

always_comb begin
    pc_next = 'bx;
    inst_sram_readen = 1;
    isDelaySlot = 0;
    bubble = 1;
    pendingJump_next = pendingJump;
    if (canSendNewCommand) begin
        if ((exception || pendingException) && !pendingJump && !absJump) begin
            pc_next = 0;
            inst_sram_readen = 0;
            pendingException_next = 1;
            pendingJump_next = 0;
        end
        else if (!stall) begin
            pendingException_next = 0;
            pendingJump_next = 0;
            if (!pendingException && !exception)
                bubble = !inst_sram_valid && !fetchException;
            if (!absJump && !pendingJump) begin
                if (!bubble)
                    pc_next = pc + 4;
                else
                    pc_next = pc;
            end
            else if (absJump) begin
                pc_next = absJumpAddress;
                isDelaySlot = 1;
            end
            else if (pendingJump) begin
                pc_next = pendingJumpAddr;
                isDelaySlot = 1;
            end
            if (pc_next[1:0] != 0) begin
                inst_sram_readen = 0;
            end
        end else begin
            pendingException_next = pendingException;
            pendingJump_next = pendingJump;
            pc_next = pc;
        end
    end else begin
        pc_next = pc;
        pendingException_next = 0;
        if (exception || pendingException) begin
            pendingException_next = 1;
            pendingJump_next = 0;
        end
        if (absJump || pendingJump) begin
            isDelaySlot = 1;
            pendingJump_next = 1;
        end
    end
end

always @(posedge clk) begin
    if (reset) begin
        pendingJump <= 0;
        pendingException <= 0;
        pc <= 32'hBFC00000;
        busy <= 0;
    end
    else begin
        pc <= pc_next;
        busy <= inst_sram_readen;
        pendingJump <= pendingJump_next;
        pendingException <= pendingException_next;
        if (absJump) begin
            pendingJumpAddr <= absJumpAddress;
        end
    end
end

endmodule
