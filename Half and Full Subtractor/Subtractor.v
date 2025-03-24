`timescale 1ns / 1ps
module Subtractor (
input a,b,bin,
output bh,ch,bf,cf ); /* bh-difference of halfsubtractor
                        ch-Borrow of half subtractor
                        bf-difference of full subtractor
                        cf-borrow of full subtractor   */

wire w1,w2,w3,w4,w5;
not (w5,a);
//For Half Subtractor
xor (bh,a,b);
and (ch,w5,b);  

// For full Subtractor
 xor (w1,a,b);
 xor (bf,w1,bin);
 and (w2,w5,b);
 and (w3,b,bin);
 and (w4,bin,w5);
 or (cf,w2,w3,w4);
endmodule

// Module for impleneting on FPGA 
module top(sw,led);
input [2:0]sw;
output [3:0]led;
Subtractor top(.a(sw[0]),
            .b(sw[1]),
            .bin(sw[2]),
            .bh(led[0]),
            .ch(led[1]),
            .bf(led[2]),
            .cf(led[3])
            );
endmodule