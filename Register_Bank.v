  module RegisterBank(a, b, c, write, clk, aData, bData, cData);
   reg[63:0] registers [31:0];
   input [4:0] a,b,c;
   input write, clk;
   input  [63:0] cData;
   output reg [63:0] aData, bData;

   always @(clk)
   begin 
   aData = registers[a];
   bData = registers[b];
   end

   always @(clk, write)
   begin
   if (write)
   begin
   registers[c] = cData;
   end
   end
   endmodule
