module MUX(select, a, b, out);
	parameter n = 64;
parameter delay = 10;
input select;
input [n-1:0] a,b;
output [n-1:0] out;
assign #delay  out = select ? b : a;
always @(*)
$display ("\nMUX: \nA = %b \nB = %b\nSelect = %b\nOut = %b\n", a,b, select,out);
endmodule
