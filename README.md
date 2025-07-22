# Convolutional-Code

**Work in progress**

This repo contains the verilog design of **(2,1,2) Convolutional encoder and viterbi based decoder.**

## (n,k,m) Convolutional Encoder:

'n' stands for no. of output bits per time step,

'k' stands for no. of input bits per time step,

'm' stands for length of the shift register. m = K -1, where 'K' is the constraint length which define how many input bits (current and previous) affect the encoder’s output at any time step.

The code rate is given (k/n).

Depending on the value of 'n', n generator polynomials will be used to produce n output bits per time step.

## (2,1,2) Convolutional encoder:

n = 2, k = 1 and m = 2 => K = 3

The n generator polynomials used are: GP<sub>0</sub> = 1 + x and GP<sub>1</sub> = 1 + x + x<sup>2</sup>.

<img width="1342" height="766" alt="image" src="https://github.com/user-attachments/assets/f8864978-d917-4f1f-bd0a-38da649a8a34" />

The encoder can be designed using FSM or simple shift register and exor gates.

## Viterbi Decoder

*To be updated*
