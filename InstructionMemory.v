module InstructionMemory (readAddress, instruction);

parameter delay = 10;
//input clock;
input [63:0] readAddress;
output [31:0] instruction;
reg [31:0] instructions [0:31];
initial 
begin
instructions[0] = 32'h8B1F03E5;
instructions[1] = 32'hF84000A4;
instructions[2] = 32'h8B040086;
instructions[3] = 32'hF80010A6;
end
always @(*)
//#delay instruction = instructions[readAddress];
$display ("\nInstruction Memory:\nRead Address = %b\nInstruction = %b\n", readAddress, instruction);
assign instruction = instructions[readAddress[31:2]]; 

endmodule