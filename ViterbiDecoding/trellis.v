module trellis(
    output [4:0] nstate,
    input [4:0] cstate,
    input tenab
    );

    assign nstate = (tenab ? (cstate == 5'b 00001 ? 5'b 00101 : 5'b 01111) : 5'b zzzzz);

endmodule
