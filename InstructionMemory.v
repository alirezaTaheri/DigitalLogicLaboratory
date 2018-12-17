module InstructionMemory(clock, readAddress, instruction);

input clock;
input [63:0] readAddress;
output reg [31:0] instruction;
reg [31:0] instructions [0:1000];
always @(posedge clock)
begin
instruction = instructions[readAddress];
end
endmodule 