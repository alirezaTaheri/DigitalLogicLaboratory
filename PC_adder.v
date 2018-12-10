module PC_Adder(pc,,clk,out);
input [63:0]pc;
input clk;
output reg [63:0]out;

always@(posedge clk)
  begin
  #10
    out = pc + 64'd4;
  end
endmodule