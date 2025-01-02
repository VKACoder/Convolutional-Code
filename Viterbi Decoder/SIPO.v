module SIPO(
    input din,
    input clk,
    input rst,
    input start,
    output reg done,
    output reg [15:0] dout
    );
    reg [3:0] count;
    
    always @ (posedge clk)
    begin
        if (!rst)
        begin
            dout <= 16'b 0;
            count <= 4'b 0;
            done <= 1'b 0;
        end
        else
        begin
            if (!done && start )
            begin
                dout <= {dout[14:0], din};
                count <= count + 1'b 1;
            end
            if (count == 4'b 1110)
                done <= 1'b 1;
        end
        if (start == 1'b 0)
            done <= 1'b 0;
    end
endmodule
