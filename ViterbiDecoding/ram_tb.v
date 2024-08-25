module ram_tb();
    reg [9:0] data_in;
    reg clk, rst, rw, cs;
    reg [7:0] addr;
    wire [9:0] data_out;
    
    ram DUT(.data_in(data_in), .data_out(data_out), .clk(clk), .rst(rst), .rw(rw), .cs(cs), .addr(addr));

    always #10 clk = !clk;

    initial
    begin
        $dumpfile("RAM.vcd");
        $dumpvars(1);
    end

    initial 
    begin
        clk = 1'b 0;
        rst = 1'b 1;
        #1 rst = 1'b 0;
        #2 rst = 1'b 1;

        cs = 1'b 1;
        rw = 1'b 0;
        addr = 8'b 00000000;
        data_in = 10'b 1111111111;

        #20 cs = 1'b 0;
        rw = 1'b 1;

        #20 $finish;
    end
endmodule
