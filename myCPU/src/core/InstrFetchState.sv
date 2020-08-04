`timescale 1ns / 1ps
`define TextAddr (32'hbfc00000)
`define IDLE 2'b01
`define FETCH 2'b10
module InstrFetchState(
        input Clk,
        input Clr,
        input dm_stall,
        input exp_flush,
        input inst_sram_data_ok,
        input D_stall_Pass,
        input [31:0] D_NewPC_Pass,
        input [31:0] Instr_axi_Inter,

        input inst_exp_miss,
        input inst_exp_illegal,
        input inst_exp_invalid,
        output reg [31:0] I_PC,
        output [31:0] I_PC_Pass,
        output reg [31:0] I_Instr,
        output [31:0] im_pc ,

        output reg I_inst_miss,
        output reg I_inst_illegal,
        output reg I_inst_invalid,
                input icache_stall,
        input uncache_inst,
        input wire [31:0] I_icache_rdata,
        output wire I_nextNotReady
            );

    
    reg [31:0] pc_reg;
    
    assign I_PC_Pass = pc_reg;
    assign im_pc = pc_reg;

    wire [1:0] next_state ;
    reg can_pass;
  

    always @ (posedge Clk) begin
        if (Clr | exp_flush  ) begin
            I_PC <= 0;
            I_Instr <= 0;
            if(Clr)begin
                pc_reg <= `TextAddr;
            end
            I_inst_miss <= 0;
            I_inst_illegal <= 0;
            I_inst_invalid <= 0;
        end
        else begin
            if (next_state==`FETCH) begin
                I_PC <= pc_reg;
                I_Instr <=(uncache_inst)? Instr_axi_Inter: I_icache_rdata;
                I_inst_miss <= inst_exp_miss;
                I_inst_illegal <= inst_exp_illegal;
                I_inst_invalid <= inst_exp_invalid;
            end
            if((next_state==`FETCH) && !(D_stall_Pass |dm_stall))begin
                pc_reg <= D_NewPC_Pass;
            end
        end
    end


    assign I_nextNotReady = next_state!= `FETCH ;
    assign next_state =
           (!D_stall_Pass & !dm_stall & ((uncache_inst & inst_sram_data_ok ) | (!uncache_inst & !icache_stall ))) ? `FETCH : `IDLE ;

endmodule

