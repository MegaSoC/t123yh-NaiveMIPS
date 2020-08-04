`include "my_global.vh"
//注意，这�??个模块里面实际上把WriteBack级给包括进来�??//在后续扩展中，很可能会在这个模块中加入内部流水级,也就是说，很可能这个模块是二级流�??
module M(
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
        output reg [3:0] M_WriteRegEnableExted,
        output reg [4:0] M_RegId,
        output reg [31:0] M_Data,
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

    wire `INSTR_SET;
    assign {`INSTR_SET} = E_InstrBus;
    wire [31:0] MF_Rt                         = (E_RtID!=0 && M_WriteRegEnable && M_RegId==E_RtID) ? M_Data : E_MemWriteData;
    wire [1:0] AddrOffset                     = E_Data[1:0];
    
    assign read = (lb|lbu|lh|lhu|lw);
    assign write = (sb|sh|sw);
    assign dm_stall = ((read|write)& uncached & !data_sram_data_ok ) | ( (!uncached) & (!hit));
    assign data2cp0                           = MF_Rt;
    assign data_sram_wdata                    = swl?(MF_Rt>>({(~AddrOffset),3'b0})):
           (MF_Rt<<({AddrOffset,3'b0}));
    wire [31:0] MemReadData_Inter;
    assign MemReadData_Inter                  = (uncached)? data_sram_rdata: cache_rdata ;

    wire [31:0] Ans                           = E_MemFamily ? MemReadData_Inter:
         rd_cp0_value? cp0_reg_value:
         E_Data;
    wire [1:0] Offset_Inter                   = E_Data[1:0];


    reg [1:0] M_Offset;
    reg [8:0] M_ExtType;
    reg [31:0] M_RawData;
    reg M_MemFamily;
    wire [31:0] E_Datarrr;
    wire [3:0] E_WriteRegEnableExtedrrr;

    always @ (posedge Clk) begin
        if(Clr | (exp_flush)  ) begin
            M_WriteRegEnable                  <= 0;
            M_RegId                           <= 0;
            M_Offset                          <= 0;
            M_ExtType                         <= 0;
            M_RawData                         <= 0;
            M_MemFamily                       <= 0;
            M_PC                              <= 0;
            M_T                               <=0;
            M_Data                            <= 0;
            M_WriteRegEnableExted             <= 0;
        end
        else if(!dm_stall ) begin 
            M_WriteRegEnable                  <= E_WriteRegEnable;
            M_RegId                           <= E_RegId;
            M_Offset                          <= Offset_Inter;
            M_ExtType                         <= E_ExtType;
            M_RawData                         <= Ans;
            M_MemFamily                       <= E_MemFamily;
            M_PC                              <= E_PC;
            M_T                               <= E_T==0?0:E_T-1;
            M_Data                            <= E_Datarrr;
            M_WriteRegEnableExted             <= E_WriteRegEnableExtedrrr;
        end
    end
   
    MemExtUnit MemExtUnit(
       .RawMemData(Ans),
       .Offset(Offset_Inter),
       .ExtType(E_ExtType),
       .M_MemFamily(E_MemFamily),
       .M_Data(E_Datarrr),
       .M_WriteRegEnable(E_WriteRegEnable),
       .M_WriteRegEnableExted(E_WriteRegEnableExtedrrr)
   );
    
endmodule
