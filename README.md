# Convolutional-Code

**Work in progress**

This repo contains the verilog design of **(2,1,2) Convolutional encoder and viterbi based decoder.**

## (n,k,m) Convolutional encoder:

'n' stands for no. of output bits per time step,

'k' stands for no. of input bits per time step,

'm' stands for length of the shift register. m = K -1, where 'K' is the constraint length which define how many input bits (current and previous) affect the encoder’s output at any time step.

The code rate is given (k/n).

Depending on the value of 'n', n generator polynomials will be used to produce n output bits per time step.

## (2,1,2) Convolutional encoder:

n = 2, k = 1 and m = 2 => K = 3

The n generator polynomials used are: GP<sub>0</sub> = 1 + x and GP<sub>1</sub> = 1 + x + x<sup>2</sup>.

<img width="1014" height="572" alt="image" src="https://github.com/user-attachments/assets/197a96fe-d1c0-4278-b7b9-873a6e9c37b3" />

The encoder can be designed using FSM (used in the design) or simple shift register and exor gates.

## Viterbi Decoder

