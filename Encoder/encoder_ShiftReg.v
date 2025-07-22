module encoder (input Din, input clk, input rst, output reg [1:0] Dout);
  
  reg [1:0] shift_reg;
  
  always @ (posedge clk)
    begin
      if (rst == 1'b 0)
        begin 
          Dout <= 2'b 00;
          shift_reg <= 2'b 00;
        end
      else
        begin
          Dout[1] <= Din ^ shift_reg[1];
          Dout[0] <= Din ^ shift_reg[1] ^ shift_reg[0];
          shift_reg <= {Din, shift_reg[1]};          
        end
    end
  
endmodule
