module TB();
    reg din;
    reg dinvalid;
    reg clk;
    reg rst;
    wire [7:0] dout;
    wire done;
    
    TopModule DUT(din, dinvalid, clk, rst, dout, done);
    
    always #10 clk = ~clk;
    
    initial
    begin
        clk = 1'b 0;
        @ (posedge clk) rst = 1'b 1;   
        @ (posedge clk) rst = 1'b 0;
        #5 rst = 1'b 1;
            
        @ (negedge clk) din = 1'b 0; dinvalid = 1'b 1; 
        @ (negedge clk) din = 1'b 1;
        @ (negedge clk) din = 1'b 0;
        @ (negedge clk) din = 1'b 1;
        @ (negedge clk) din = 1'b 1;
        @ (negedge clk) din = 1'b 0;
        @ (negedge clk) din = 1'b 1;
        @ (negedge clk) din = 1'b 0;
        @ (negedge clk) din = 1'b 1;
        @ (negedge clk) din = 1'b 0;
        @ (negedge clk) din = 1'b 1;
        @ (negedge clk) din = 1'b 0;
        @ (negedge clk) din = 1'b 1;
        @ (negedge clk) din = 1'b 0;
        @ (negedge clk) din = 1'b 1;
        @ (negedge clk) din = 1'b 0;
        @ (negedge clk) dinvalid = 1'b 0;     
    end
endmodule
