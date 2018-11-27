module ALU(op, a, b, out, zero);
input [3:0] op;
input [63:0] a, b;
output reg [63:0] out;
output reg zero;
always @(a, b, op)
begin
$display("%d",op);
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
end

endmodule
