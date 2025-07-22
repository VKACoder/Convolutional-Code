#Convolutional-Code

**Work in progress**

This repo contains the verilog design of **(2,1,2) Convolutional encoder and viterbi based decoder.**

## (n,k,m) Convolutional encoder:

'n' stands for no. of output bits per time step,

'k' stands for no. of input bits per time step,

'm' stands for length of the shift register. m = K -1, where 'K' is the constraint length which define how many input bits (current and previous) affect the encoder’s output at any time step.

The code rate is given (k/n)
