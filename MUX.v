module MUX(select, a, b, out);
parameter n;
input select;
input [n-1:0] a,b;
output [n-1:0] out;
assign out = select ? b : 1;
endmodule 