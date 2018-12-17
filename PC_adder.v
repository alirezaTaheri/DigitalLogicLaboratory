module PC_Adder(inputA,inputB,clk,out);
input [63:0]inputA,b;
input clk;
output reg [63:0]out;

always@(posedge clk)
  begin
  #10
    out = inputA + inputB;
  end
endmodule