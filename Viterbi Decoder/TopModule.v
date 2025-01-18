module TopModule(
    input din,
    input dinvalid,
    input clk,
    input rst,
    output reg [7:0] dout,
    output reg done
    );
    
    //parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
    
    wire [15:0] dbits; //Parallel data
    reg parallelStart; //Start SIPO operation
    wire parallelDone; //SIPO operation done
    
    reg [17:0] path0, path1, path2, path3; //Four possible paths 
    reg [4:0] pm0, pm1, pm2, pm3; //Path metric value
    wire [3:0] bm0, bm1, bm2, bm3; //Branch metric value
    
    reg bmuStart;
    wire bmuDone00, bmuDone01, bmuDone10, bmuDone11;
    wire [1:0] i1bm00, i1bm11, i2bm00, i2bm11;
    
    reg stageStart;
    wire [11:0] p0, p1, p2, p3;
    wire stageDone;
    
    reg [2:0] pstate, nstate;
    
    //Serial to parallel data - 16 bits
    SIPO sipo(.dout(dbits), .done(parallelDone), .din(din), .start(parallelStart), .clk(clk), .rst(rst));
    
    //BMU for first two stages
    BMU bmu100(2'b 00, 2'b 00, dbits[15:14], bmuStart, i1bm00, bmuDone00);
    BMU bmu111(2'b 00, 2'b 10, dbits[15:14], bmuStart, i1bm11, bmuDone01);
    BMU bmu200(2'b 00, 2'b 00, dbits[13:12], bmuStart, i2bm00, bmuDone10);
    BMU bmu211(2'b 00, 2'b 10, dbits[13:12], bmuStart, i2bm11, bmuDone11);
    
    //Stage 3 to Stage 8
    stage3 stage38(dbits[11:0], clk, rst, stageStart, bm0, bm1, bm2, bm3, p0, p1, p2, p3, stageDone);
    
    //Control logic
    always @ (posedge clk)
    begin
        if (!rst)
        begin
            //Reset values
            parallelStart <= 1'b 0;
            path0 <= 18'b 000000;
            path1 <= 18'b 001001;
            path2 <= 18'b 000010;
            path3 <= 18'b 001011;
            pm0 <= 5'b 0;
            pm1 <= 5'b 0;
            pm2 <= 5'b 0;
            pm3 <= 5'b 0;
            bmuStart <= 1'b 0;
            stageStart <= 1'b 0;
        end
        else
        begin
            if (dinvalid && !parallelDone)
            begin
                parallelStart <= 1'b 1;
            end
            else if (parallelDone)
            begin
                parallelStart <= 1'b 0;
                bmuStart <= 1'b 1;
                stageStart <= 1'b 1;
            end
            
            if (stageDone)
            begin
                //To be implemented
            end
        end
    end
    
    always @ (parallelDone, bmuDone00, bmuDone01, bmuDone10, bmuDone11)
    begin
        if (bmuDone00 && bmuDone01 && bmuDone10 && bmuDone11 && parallelDone)
        begin
            pm0 <= i1bm00 + i2bm00;
            pm1 <= i1bm11 + i2bm11;
            pm2 <= i1bm00 + i2bm11;
            pm3 <= i1bm11 + i2bm00;
        end
    end
    
//    always @ (posedge clk)
//    begin
//        if (!rst)
//            pstate <= S0;
//        else
//            pstate <= nstate;
//    end
endmodule
