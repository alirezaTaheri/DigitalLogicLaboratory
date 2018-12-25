module RegisterBank(a,b,c,aData,bData,cData,write,clk);
parameter delay = 10;
   reg[63:0] registers [31:0];
   input [4:0] a,b,c;
   input write, clk;
   input  [63:0] cData;
   output [63:0] aData, bData;
   integer k;
   initial
   for (k = 0;k<32;k = k +1)
	registers[k] = k;

   assign aData = registers[a], bData = registers[b];
//   always @(posedge clk)
//   begin 
//   #delay
//   aData <= registers[a];
//   bData <= registers[b];
//$display ("\nRegister Bank (Read):\nA Address = %b\nB Address = %b\nA Data = %b\nB Data = %b\n ",a,b,aData, bData);
//   end

   always @(posedge clk, write)
   begin
   #delay
   if (write)
   registers[c] = cData;
$display ("\nRegister Bank (Write = %b):\nC Address = %b\nC Data = %b\n ",write, c, cData);
   end

endmodule
