module ALU_TB(clk, a, b, op);
input clk;
output reg [63:0] a, b;
output reg [3:0] op;
integer k = 0;
always @(clk)
begin
a = 64'd5;
b = 64'd3;
k = k +1;
if (k == 6)
k = 0;
case(k)
0:
op = 4'b0000;
1:
op = 4'b0001;
2:
op = 4'b0010;
3:
op = 4'b0110;
4:
op = 4'b0111;
5:
op = 4'b1100;
endcase
end

endmodule
