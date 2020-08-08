`include "my_global.vh"

module SALU(//special alu:clo,clz
        input clk,
        input reset,
        input clo,
        input clz,

        input [31:0] salua,
        output [31:0] salur,

        output saluBusy,
        input saluFlush
    );


    /*wire [31:0] clor,clzr;

    assign clor = ((salua & 32'hffffffff) == 32'hffffffff) ? 32'd32 : 
                  ((salua & 32'hfffffffe) == 32'hfffffffe) ? 32'd31 : 
                  ((salua & 32'hfffffffc) == 32'hfffffffc) ? 32'd30 : 
                  ((salua & 32'hfffffff8) == 32'hfffffff8) ? 32'd29 : 
                  ((salua & 32'hfffffff0) == 32'hfffffff0) ? 32'd28 : 
                  ((salua & 32'hffffffe0) == 32'hffffffe0) ? 32'd27 : 
                  ((salua & 32'hffffffc0) == 32'hffffffc0) ? 32'd26 : 
                  ((salua & 32'hffffff80) == 32'hffffff80) ? 32'd25 : 
                  ((salua & 32'hffffff00) == 32'hffffff00) ? 32'd24 : 
                  ((salua & 32'hfffffe00) == 32'hfffffe00) ? 32'd23 : 
                  ((salua & 32'hfffffc00) == 32'hfffffc00) ? 32'd22 : 
                  ((salua & 32'hfffff800) == 32'hfffff800) ? 32'd21 : 
                  ((salua & 32'hfffff000) == 32'hfffff000) ? 32'd20 : 
                  ((salua & 32'hffffe000) == 32'hffffe000) ? 32'd19 : 
                  ((salua & 32'hffffc000) == 32'hffffc000) ? 32'd18 : 
                  ((salua & 32'hffff8000) == 32'hffff8000) ? 32'd17 : 
                  ((salua & 32'hffff0000) == 32'hffff0000) ? 32'd16 : 
                  ((salua & 32'hfffe0000) == 32'hfffe0000) ? 32'd15 : 
                  ((salua & 32'hfffc0000) == 32'hfffc0000) ? 32'd14 : 
                  ((salua & 32'hfff80000) == 32'hfff80000) ? 32'd13 : 
                  ((salua & 32'hfff00000) == 32'hfff00000) ? 32'd12 : 
                  ((salua & 32'hffe00000) == 32'hffe00000) ? 32'd11 : 
                  ((salua & 32'hffc00000) == 32'hffc00000) ? 32'd10 : 
                  ((salua & 32'hff800000) == 32'hff800000) ? 32'd9  : 
                  ((salua & 32'hff000000) == 32'hff000000) ? 32'd8  : 
                  ((salua & 32'hfe000000) == 32'hfe000000) ? 32'd7  : 
                  ((salua & 32'hfc000000) == 32'hfc000000) ? 32'd6  : 
                  ((salua & 32'hf8000000) == 32'hf8000000) ? 32'd5  : 
                  ((salua & 32'hf0000000) == 32'hf0000000) ? 32'd4  : 
                  ((salua & 32'he0000000) == 32'he0000000) ? 32'd3  : 
                  ((salua & 32'hc0000000) == 32'hc0000000) ? 32'd2  : 
                  ((salua & 32'h80000000) == 32'h80000000) ? 32'd1  : 32'd0;
    
    wire [31:0] anti_saluta;
    assign anti_saluta = ~salua;
    
    assign clzr = ((anti_saluta & 32'hffffffff) == 32'hffffffff) ? 32'd32 : 
                  ((anti_saluta & 32'hfffffffe) == 32'hfffffffe) ? 32'd31 : 
                  ((anti_saluta & 32'hfffffffc) == 32'hfffffffc) ? 32'd30 : 
                  ((anti_saluta & 32'hfffffff8) == 32'hfffffff8) ? 32'd29 : 
                  ((anti_saluta & 32'hfffffff0) == 32'hfffffff0) ? 32'd28 : 
                  ((anti_saluta & 32'hffffffe0) == 32'hffffffe0) ? 32'd27 : 
                  ((anti_saluta & 32'hffffffc0) == 32'hffffffc0) ? 32'd26 : 
                  ((anti_saluta & 32'hffffff80) == 32'hffffff80) ? 32'd25 : 
                  ((anti_saluta & 32'hffffff00) == 32'hffffff00) ? 32'd24 : 
                  ((anti_saluta & 32'hfffffe00) == 32'hfffffe00) ? 32'd23 : 
                  ((anti_saluta & 32'hfffffc00) == 32'hfffffc00) ? 32'd22 : 
                  ((anti_saluta & 32'hfffff800) == 32'hfffff800) ? 32'd21 : 
                  ((anti_saluta & 32'hfffff000) == 32'hfffff000) ? 32'd20 : 
                  ((anti_saluta & 32'hffffe000) == 32'hffffe000) ? 32'd19 : 
                  ((anti_saluta & 32'hffffc000) == 32'hffffc000) ? 32'd18 : 
                  ((anti_saluta & 32'hffff8000) == 32'hffff8000) ? 32'd17 : 
                  ((anti_saluta & 32'hffff0000) == 32'hffff0000) ? 32'd16 : 
                  ((anti_saluta & 32'hfffe0000) == 32'hfffe0000) ? 32'd15 : 
                  ((anti_saluta & 32'hfffc0000) == 32'hfffc0000) ? 32'd14 : 
                  ((anti_saluta & 32'hfff80000) == 32'hfff80000) ? 32'd13 : 
                  ((anti_saluta & 32'hfff00000) == 32'hfff00000) ? 32'd12 : 
                  ((anti_saluta & 32'hffe00000) == 32'hffe00000) ? 32'd11 : 
                  ((anti_saluta & 32'hffc00000) == 32'hffc00000) ? 32'd10 : 
                  ((anti_saluta & 32'hff800000) == 32'hff800000) ? 32'd9  : 
                  ((anti_saluta & 32'hff000000) == 32'hff000000) ? 32'd8  : 
                  ((anti_saluta & 32'hfe000000) == 32'hfe000000) ? 32'd7  : 
                  ((anti_saluta & 32'hfc000000) == 32'hfc000000) ? 32'd6  : 
                  ((anti_saluta & 32'hf8000000) == 32'hf8000000) ? 32'd5  : 
                  ((anti_saluta & 32'hf0000000) == 32'hf0000000) ? 32'd4  : 
                  ((anti_saluta & 32'he0000000) == 32'he0000000) ? 32'd3  : 
                  ((anti_saluta & 32'hc0000000) == 32'hc0000000) ? 32'd2  : 
                  ((anti_saluta & 32'h80000000) == 32'h80000000) ? 32'd1  : 32'd0;*/

    reg [31:0] count_result;
    reg [31:0] salua_reg;
    reg state;//0 can accept cal;1 is calling
    reg count_finish;
    wire is_valid;
    assign is_valid = (clo && salua_reg[31-count_result[4:0]]) || (clz && !salua_reg[31-count_result[4:0]]);
    assign salur = count_result;
    assign saluBusy = !count_finish;

    //assign salur = clo ? clor : clzr;

    always_ff @(posedge clk)begin
        if(reset | saluFlush)begin
            count_result <= 0;
            count_finish <= 1;
            salua_reg <= 0;
            state <= 0;
        end
        else begin
            
            case (state)
                0:begin
                    if(clo || clz)begin
                        state <= 1;
                        salua_reg <= salua;
                        count_result <= 0;
                        count_finish <= 0;
                    end
                end
                1:begin
                    if(is_valid && count_result <= 31)begin
                        count_result <= count_result + 1;
                    end
                    else begin
                        count_finish <= 1;
                        state <= 0;
                    end
                end
            endcase
        end
    end


endmodule
