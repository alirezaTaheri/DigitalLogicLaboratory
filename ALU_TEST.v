module ALU_TEST();
 wire clk;
 wire [63:0] a, b, out;
 wire [3:0] op;
 wire  zero;
Clock os(clk);
ALU_TB testBench(clk, a, b, op);
ALU alu(op, a, b, out, zero);

endmodule 