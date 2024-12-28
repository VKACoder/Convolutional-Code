module BMU(
    input [1:0] istate,
    input [1:0] cstate,
    input [1:0] rbits,
    output reg [1:0] bm
    );
    reg [1:0] abits; //Actual encoded bits
    reg [1:0] exor_value;
    
    always @ (*)
    begin
        case ({cstate, istate})
            4'b 0000: abits = 2'b 00;
            4'b 0001: abits = 2'b 10;
            4'b 0110: abits = 2'b 11;
            4'b 0111: abits = 2'b 01;
            4'b 1000: abits = 2'b 11;
            4'b 1001: abits = 2'b 01;
            4'b 1110: abits = 2'b 00;
            4'b 1111: abits = 2'b 10;
            default: abits = 2'b 00;
        endcase
    end
    
    //Calculate hamming distance - No. of bits that are same in rbits and abits
    always @ (abits)
    begin
        exor_value = abits ^ rbits;
    end
    
    always @ (exor_value)
    begin
        case (exor_value)
            2'b 00: bm = 0;
            2'b 01, 2'b 10: bm = 1;
            2'b 11: bm = 2;
        endcase
    end
endmodule
