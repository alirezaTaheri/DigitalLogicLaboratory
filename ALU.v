module ALU(a,b,op,zero,out);
parameter delay = 10;
input [3:0] op;
input [63:0] a, b;
output reg [63:0] out;
output reg zero;
always @(a, b, op)
begin
#delay
case(op)
4'b0000:
 out = a & b;

4'b0001:
out = a | b;

4'b0010:
 out = a + b;

4'b0110:
 out = a - b;

4'b0111:
 out = b;

4'b1100:
 out = ~(a | b);

default:
 out = a;

endcase
 zero = 0;
if (out == 0)
 zero = 1;
$display("\nALU:\nOperation = %b\nA = %b\nB = %b\nOutput = %b\nZero = %b\n ",op, a, b, out, zero);
end

	
endmodule 
