`timescale 1ns / 1ps

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
        input [31:0] exception_new_pc,
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
        ///***
        input icache_stall,
        input uncache_inst,
        input wire [31:0] I_icache_rdata,
        output wire I_nextNotReady,
        input wire [31:0] inst_sram_addr
        ///***
    );
    wire [31:0] PC_Inter;
    assign I_PC_Pass = PC_Inter;

    wire [1:0] next_state ;
    reg can_pass;
    InstrFetchUnit IFU(
                       .Clk(Clk),
                       .Clr(Clr),
                       .is_exception(exp_flush),
                       .stall(D_stall_Pass |dm_stall ), //todo: stall 与en信号冲突
                       .exception_new_pc(exception_new_pc),
                       .NewPcAddr(D_NewPC_Pass),
                       .PC(PC_Inter),
                       .im_pc(im_pc),
                       .en( next_state==`FETCH )
                   );

    //////////////////////////////////////////////////////////////////////////////

    initial begin
        I_PC <= 0;
        I_Instr <= 0;
    end
    always @ (posedge Clk) begin
        if (Clr | exp_flush /* | (!dm_stall & next_state!=`FETCH ) */ ) begin
            I_PC <= 0;
            I_Instr <= 0;
            I_inst_miss <= 0;
            I_inst_illegal <= 0;
            I_inst_invalid <= 0;
        end
        // else if (!D_stall_Pass & !dm_stall & (inst_sram_data_ok | !icache_stall) ) begin
        // I_PC <= PC_Inter;
        // I_Instr <= Instr_Inter;
        // end
        else if (next_state==`FETCH) begin
            I_PC <= PC_Inter;
            I_Instr <=(uncache_inst)? Instr_axi_Inter: I_icache_rdata;
            I_inst_miss <= inst_exp_miss;
            I_inst_illegal <= inst_exp_illegal;
            I_inst_invalid <= inst_exp_invalid;
        end
    end


    assign I_nextNotReady = next_state!= `FETCH ;
    assign next_state =
           (!D_stall_Pass & !dm_stall & ((uncache_inst & inst_sram_data_ok ) | (!uncache_inst & !icache_stall ))) ? `FETCH : `IDLE ;



    /*
    reg [31:0] mid_pc;
    reg [31:0] mid_Instr;


    always @ (posedge Clk) begin
    if (Clr | exp_flush) begin
    I_PC <= 0;
    I_Instr <= 0;
    end
    else if (!D_stall_Pass & !dm_stall & (inst_sram_data_ok | !icache_stall) ) begin
    I_PC <= PC_Inter;
    I_Instr <= Instr_Inter;
    end
    end

    always @ (posedge Clk) begin
    if (Clr | exp_flush) begin
    mid_PC <= 0;
    mid_Instr <= 0;
    end
    else if (!D_stall_Pass & !dm_stall & (inst_sram_data_ok | !icache_stall) ) begin
    mid_PC <= PC_Inter;
    mid_Instr <= Instr_Inter;
    end
    end
    */
    ///////////////////////////////////////////////////////////////////////////////
endmodule
