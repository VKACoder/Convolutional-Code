module testbench();
  reg Din, clk, rst;
  wire [1:0] Dout;
  
  always #5 clk = !clk;
  
  encoder DUT(.Din(Din), .clk(clk), .rst(rst), .Dout(Dout));
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
  
  initial
    begin
      $monitor("Input = %b and Output %b", Din, Dout);
    end
  
  initial
    begin
      clk = 1'b 0;
      rst = 1'b 1;
      #1 rst = 1'b 0;
      #2 rst = 1'b 1;
      @ (posedge clk) Din = 1'b 0; //MSB
      @ (posedge clk) Din = 1'b 1;
      @ (posedge clk) Din = 1'b 0;
      @ (posedge clk) Din = 1'b 1;
      @ (posedge clk) Din = 1'b 0;
      @ (posedge clk) Din = 1'b 1;
      @ (posedge clk) Din = 1'b 0;
      @ (posedge clk) Din = 1'b 1; //LSB
      #5 $finish;
    end
endmodule
