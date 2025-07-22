module encoder(input Din, input clk, input rst, output reg [1:0] Dout);
  
  parameter S0 = 2'b 00, S1 = 2'b 01, S2 = 2'b 10, S3 = 2'b 11;
  reg [1:0] pstate, nstate;
  
  always @(posedge clk, negedge rst)
    begin
      if (!rst)
        begin
          Dout <= 2'b 00;
          pstate <= S0;
        end
      else
        pstate <= nstate;
    end
  
  always @ (Din, pstate)
    begin
      case (pstate)
        S0: 
          begin
            if (Din == 1'b 0)
          	  begin
                nstate = S0;
                Dout = 2'b 00;
              end
            else if (Din == 1'b 1)
              begin
                nstate = S2;
                Dout = 2'b 11;
              end
          end
        S1: 
          begin
            if (Din == 1'b 0)
          	  begin
                nstate = S0;
                Dout = 2'b 10;
              end
        	else if (Din == 1'b 1)
              begin
                nstate = S2;
                Dout = 2'b 01;
              end
          end
        S2: 
          begin
            if (Din == 1'b 0)
          	  begin
                nstate = S1;
                Dout = 2'b 11;
              end
        	else if (Din == 1'b 1)
              begin
                nstate = S3;
                Dout = 2'b 00;
              end
          end
        S3: 
          begin
            if (Din == 1'b 0)
          	  begin
                nstate = S1;
                Dout = 2'b 01;
              end
        	else if (Din == 1'b 1)
              begin
                nstate = S3;
                Dout = 2'b 10;
              end
          end
      endcase
    end
endmodule
