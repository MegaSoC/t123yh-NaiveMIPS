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
           output logic bubble_o,
           output logic isDelaySlot,

           output [31:0] inst_sram_addr,
           output logic inst_sram_readen,
           input [31:0] inst_sram_rdata,
           input inst_sram_valid,
           input inst_sram_addressError,
           input inst_sram_tlb_miss,
           input inst_sram_tlb_invalid,
           input inst_sram_tlb_ready,
           
           output logic inst_sram_addressError_o,
           output logic inst_sram_tlb_miss_o,
           output logic inst_sram_tlb_invalid_o
);

// TODO: 判断什么时候需要 readen（比如流水线遇到异常时，就不应该读取后续指令）

reg [31:0] pc;
logic [31:0] pc_next;

wire currentFetchException = inst_sram_addressError || inst_sram_tlb_miss || inst_sram_tlb_invalid;
reg pendingException;
logic pendingException_next;
reg pendingJump;
logic pendingJump_next;
reg [31:0] pendingJumpAddr;
reg busy;
logic bubble;
wire hasResponse = (inst_sram_valid || currentFetchException) && inst_sram_tlb_ready || pc[1:0] != 0;
wire canSendNewCommand = hasResponse || !busy;
assign inst_sram_addr = pc_next;
reg lastStall;
reg latchResult;
reg [31:0] lastInstruction;
reg last_addressError;
reg last_tlb_miss;
reg last_tlb_invalid;
assign instruction = latchResult ? lastInstruction : inst_sram_rdata;
assign inst_sram_addressError_o = latchResult ? last_addressError : inst_sram_addressError;
assign inst_sram_tlb_invalid_o = latchResult ? last_tlb_invalid : inst_sram_tlb_invalid;
assign inst_sram_tlb_miss_o = latchResult ? last_tlb_miss : inst_sram_tlb_miss;
assign outputPC = pc;
assign bubble_o = latchResult ? 0 : bubble;
logic latchResult_next;
always_comb if (stall && !bubble)
        latchResult_next = 1;
    else if (!stall)
        latchResult_next = 0;
    else
        latchResult_next = latchResult;

always_comb begin
    pc_next = 'bx;
    inst_sram_readen = !(latchResult_next && !bubble_o);
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
        else begin
            pendingException_next = 0;
            pendingJump_next = 0;
            if (!pendingException && !exception)
                bubble = !hasResponse;
            if (!absJump && !pendingJump) begin
                if (!bubble_o)
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
        lastStall <= 0;
        last_addressError <= 0;
        last_tlb_invalid <= 0;
        last_tlb_miss <= 0;
        latchResult <= 0;
    end
    else begin
        busy <= inst_sram_readen;
        pendingJump <= pendingJump_next;
        pendingException <= pendingException_next;
        if (absJump) begin
            pendingJumpAddr <= absJumpAddress;
        end
        lastStall <= stall;
        latchResult <= latchResult_next;
        if (!stall)
            pc <= pc_next;
        last_addressError <= inst_sram_addressError_o;
        last_tlb_miss <= inst_sram_tlb_miss_o;
        last_tlb_invalid <= inst_sram_tlb_invalid_o;
        lastInstruction <= instruction;
    end
end

endmodule
