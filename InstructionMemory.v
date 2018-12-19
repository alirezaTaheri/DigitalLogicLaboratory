module InstructionMemory(clock, readAddress, instruction);

input clock;
input [63:0] readAddress;
output reg [31:0] instruction;
reg [31:0] instructions [0:3];
always @(posedge clock)
begin

instructions[0] = 32'h8B1F03E5;
instructions[1] = 32'hF84000A4;
instructions[2] = 32'h8B040086;
instructions[3] = 32'hF80010A6;

instruction = instructions[readAddress];
end
endmodule
