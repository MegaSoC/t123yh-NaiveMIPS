`include "def.svh"

module onehot_3s8(in,out);
    input logic [2:0] in ;
    output logic [7:0] out ;
    always_ff @(*) begin
        case(in)
                    3'b000:out=8'b00000001;
                    3'b001:out=8'b00000010;
                    3'b010:out=8'b00000100;
                    3'b011:out=8'b00001000;
                    3'b100:out=8'b00010000;
                    3'b101:out=8'b00100000;
                    3'b110:out=8'b01000000;
                    3'b111:out=8'b10000000;
        endcase
    end
    
endmodule

module load_data_sel(datain, offset, dataout);
    input  [255:0] datain;
    input  [  2:0] offset; //word offset
    output [ 31:0] dataout;
    
    logic [7:0] hot_wire ;
    assign hot_wire[0] = offset==3'b000;
    assign hot_wire[1] = offset==3'b001;
    assign hot_wire[2] = offset==3'b010;
    assign hot_wire[3] = offset==3'b011;
    assign hot_wire[4] = offset==3'b100;
    assign hot_wire[5] = offset==3'b101;
    assign hot_wire[6] = offset==3'b110;
    assign hot_wire[7] = offset==3'b111;
    /*
    assign dataout = ({32{offset==3'b000}} & datain[ 31:  0]) |
                     ({32{offset==3'b001}} & datain[ 63: 32]) |
                     ({32{offset==3'b010}} & datain[ 95: 64]) |
                     ({32{offset==3'b011}} & datain[127: 96]) |
                     ({32{offset==3'b100}} & datain[159: 128]) |
                     ({32{offset==3'b101}} & datain[191: 160]) |
                     ({32{offset==3'b110}} & datain[223: 192]) |
                     ({32{offset==3'b111}} & datain[255: 224]) ;
    */
    assign dataout = ({32{hot_wire[0]}} & datain[ 31:  0]) |
                     ({32{hot_wire[1]}} & datain[ 63: 32]) |
                     ({32{hot_wire[2]}} & datain[ 95: 64]) |
                     ({32{hot_wire[3]}} & datain[127: 96]) |
                     ({32{hot_wire[4]}} & datain[159: 128]) |
                     ({32{hot_wire[5]}} & datain[191: 160]) |
                     ({32{hot_wire[6]}} & datain[223: 192]) |
                     ({32{hot_wire[7]}} & datain[255: 224]) ;
    endmodule
    
    module expand(enable,offset,out,v);
    input   enable;
    input  [  2:0] offset; //word offset
    output [ 31:0] out;
    input [3:0]v;
    
    genvar i;
    generate
        for(i=0;i<= 3'b111;i=i+1)begin
            assign out[i*4+3:i*4] = ((offset == i) & enable )?  v:4'b0;
        end
    endgenerate
    
    endmodule