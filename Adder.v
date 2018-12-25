
module Adder(inputA, inputB, out);

 parameter delay = 10;
parameter n = 64;
input [n-1:0]inputA,inputB;
output [n-1:0]out;

assign #delay out = inputA + inputB;

always@(inputA, inputB)
$display ("\nAdder\nA = %b\nB = %b\nOutput = %b\n",inputA,inputB, out);


endmodule  