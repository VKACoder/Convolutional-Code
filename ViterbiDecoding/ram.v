module ram(output reg [9:0] data_out, 
           input [9:0] data_in, 
           input [7:0] addr, 
           input clk, rst, rw, cs);
    //read if rw = 1 and write if rw = 0; cs - active low chip select
    reg [9:0] mem [255:0];  //256 words x 10 bit memory
    integer i;

    always @ (posedge clk, negedge rst)
    begin
        if (!rst)
        begin
            for (i = 0; i < 256; i = i + 1)
            begin
                mem[i] = {10 {1'b 0}}; //Initializes the entire memory
            end
            mem[0] = 10'b 11111_11100;
        end
        else
        begin
            if (!cs)
            begin
                if (rw)
                    data_out = mem[addr]; //Read
                else
                    mem[addr] = data_in;  //Write
            end
        end
    end
endmodule
