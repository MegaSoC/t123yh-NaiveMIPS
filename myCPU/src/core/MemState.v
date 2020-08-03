`include "my_global.h"
//注意，这�?个模块里面实际上把WriteBack级给包括进来�?//在后续扩展中，很可能会在这个模块中加入内部流水级,也就是说，很可能这个模块是二级流�?
module MemState(
        input Clk,
        input Clr,
        output dm_stall,
        input exp_flush,
        input [31:0] E_PC,
        input [31:0] E_MemWriteData,
        input [4:0] E_RtID,
        input [31:0] E_Data,
        input [8:0] E_ExtType,
        input [3:0] E_MemWriteEnable,
        input E_WriteRegEnable,
        input [4:0] E_RegId,
        input E_MemFamily,
        input [3:0] E_T,
        input rd_cp0_value,
        input [31:0] cp0_reg_value,
        input [`INSTRBUS_WIDTH-1:0] E_InstrBus,
        output reg M_WriteRegEnable,
        output wire [3:0] M_WriteRegEnableExted,
        output reg [4:0] M_RegId,
        output [31:0] M_Data,
        output reg [31:0] M_PC,
        output reg [3:0] M_T,
        input wire [31:0] data_sram_rdata,
        output wire [31:0] data_sram_wdata,
        input wire data_sram_data_ok,

        output read,
        output write,
        input hit,
        input wire uncached ,
        input [31:0] cache_rdata,
        output[31:0] data2cp0,

                input wire EstallClear
            );

        wire [31:0] MF_Rt = (E_RtID!=0 && M_WriteRegEnable && M_RegId==E_RtID) ? M_Data:
         E_MemWriteData;
    wire [1:0] AddrOffset = E_Data[1:0];
    wire lb,lbu,lh,lhu,lw,lwl,lwr,swl,swr;
    assign {lb,lbu,lh,lhu,lw,lwl,lwr,swl,swr}=E_ExtType;
    assign data2cp0 = MF_Rt;
    assign data_sram_wdata = swl?(MF_Rt>>({(~AddrOffset),3'b0})):
           (MF_Rt<<({AddrOffset,3'b0}));
        wire [31:0] MemReadData_Inter;
    assign MemReadData_Inter = (uncached)? data_sram_rdata: cache_rdata ;

    DmStall dmstall(
                .clk(Clk),
                .data_sram_data_ok(data_sram_data_ok),
                .InstrBus(E_InstrBus),
                .dm_stall(dm_stall),
                .read(read),
                .write(write),
                .uncached(uncached),
                .o_p_stall(!hit)
            );
        wire [31:0] Ans = E_MemFamily ? MemReadData_Inter:
         rd_cp0_value? cp0_reg_value:
         E_Data;
    wire [1:0] Offset_Inter = E_Data[1:0];


    reg [1:0] M_Offset;
    reg [8:0] M_ExtType;
    reg [31:0] M_RawData;
    reg M_MemFamily;

    initial begin
        M_WriteRegEnable <= 0;
        M_RegId <= 0;
        M_Offset <= 0;
        M_ExtType <= 0;
        M_RawData <= 0;
        M_MemFamily <= 0;
        M_PC <= 0;
    end
    always @ (posedge Clk) begin
        if(Clr | (exp_flush) /* | dm_stall */ ) begin
            M_WriteRegEnable <= 0;
            M_RegId <= 0;
            M_Offset <= 0;
            M_ExtType <= 0;
            M_RawData <= 0;
            M_MemFamily <= 0;
            M_PC <= 0;
            M_T<=0;
        end
        else if(!dm_stall ) begin //Estallclear 发生的唯�?情况�? w级为SW, E级为LW�? M级命�?
            M_WriteRegEnable <= E_WriteRegEnable;
            M_RegId <= E_RegId;
            M_Offset <= Offset_Inter;
            M_ExtType <= E_ExtType;
            M_RawData <= Ans;
            M_MemFamily <= E_MemFamily;
            M_PC <= E_PC;
            M_T<= E_T==0?0:E_T-1;
        end
    end

    wire [31:0] ExtMemData;
    MemExtUnit MemExtUnit(
                   .RawMemData(M_RawData),
                   .Offset(M_Offset),
                   .ExtType(M_ExtType),
                   .ExtMemData(ExtMemData),
                   .M_WriteRegEnable(M_WriteRegEnable),
                   .M_WriteRegEnableExted(M_WriteRegEnableExted)
               );
    assign M_Data = M_MemFamily ? ExtMemData:M_RawData;
endmodule
