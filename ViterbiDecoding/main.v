module main
# (parameter N = 8)
(
    output dout,
    input din, clk, rst, stop
);
    parameter S0 = 3'b 000, S1 = 3'b 001, S2 = 3'b 010, S3 = 3'b 011, S4 = 3'b 100, S5 = 3'b 101;

    reg [N - 1: 0] dout; //Decoded output
    reg [1:0] buf1, buf2; //Buffer for incoming bits; Vector size is 2 because the code rate is 1/2
    reg [1:0] buf_ov; //Flag to indicate the register - buf1 is full
    reg [1:0] pdata; //Encoded bits to be processed
    reg [2:0] pstate, nstate; //Present and Next state of state diagram
    reg [3:0] ctstate, ntstate; //States in trellis structure
    reg [1:0] count;
    reg pvalid; 

    always @ (posedge clk, negedge rst)
    begin
        if (!rst)
        begin
            buf_ov <= 2'b 00;
            buf1 <= 2'b 00;
            buf2 <= 2'b 00;
            count <= 1'b 0;
            pstate <= S0;
            ctstate <= 4'b 0001;
            ntstate <= 4'b 0000;
        end
        else
        begin
            if (buf_ov[1] == 1'b 0)
            begin
                buf1 <= ({buf1, din} << 1);
            end
            else
            begin
                buf2 <= ({buf2, din} << 1); 
            end
            buf_ov <= (buf_ov == 2'b 11) ? 2'b 00 : buf_ov + 1;
            pstate <= nstate;
        end
    end

    always @ (pstate)
    begin
        case (pstate)
            S0: if (!stop)
                begin
                    if (pvalid == 1'b 1)
                    begin
                        //Code part - if the pdata reg has valid data  
                    end
                end
        endcase
    end

    //Code part for storing the serial data in pdata reg every two cycles
    always @ (buf_ov)
    begin
        if (buf_ov == 2'b 01)
        begin
            pdata = buf1;
            pvalid = 1'b 1;
        end
        else if (buf_ov == 2'b 11)
        begin
            pdata = buf2;
            pvalid = 1'b 1;
        end

    end
endmodule   
