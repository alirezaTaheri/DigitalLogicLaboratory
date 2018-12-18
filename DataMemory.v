<<<<<<< HEAD
module DataMemory(clock, write, read, readData, writeData, address);
input clock, read, write;
input [63:0] address, writeData;
output [63:0] readData;
reg [63:0] data[0:4];
always @(posedge clock)
begin
data[0] = 64'd5;
data[1] = 64'd5;
data[2] = 64'd5;
data[3] = 64'd5;
data[4] = 64'd5;
if (write == 1'b1)
data[address] = writeData;
end

assign readData = (read == 1'b1 ? data[address] : readData);

=======
module DataMemory(clock, write, read, readData, writeData, address);
input clock, read, write;
input [63:0] address, writeData;
output [63:0] readData;

reg [63:0] data[0:1000];
      
always @(posedge clock)
   begin
      data[3] = 64'd5;
      if (write == 1'b1)
         data[address] = writeData;
   end

assign readData = (read == 1'b1 ? data[address] : readData);

>>>>>>> 9b53df80601313a25b971817cc8ae8a7522a0f00
endmodule 