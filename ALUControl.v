module ALUControl(ALUOp, opCodeField, operation);

parameter delay = 10;
input [1:0] ALUOp;
input [10:0] opCodeField;
output reg[3:0] operation;
wire[12:0] x = {ALUOp, opCodeField};
always@(*)
#delay
begin
casex (x)
13'b00XXXXXXXXXXX:
operation = 4'b0010;
13'bX1XXXXXXXXXXX:
operation = 4'b0111;
13'b1X10001011000:
operation = 4'b0010;
13'b1X11001011000:
operation = 4'b0110;
13'b1X10001010000:
operation = 4'b0000;
13'b1X10101010000:
operation = 4'b0001;
default: 
operation = 4'b1111;
endcase
$display ("\nALUControl: \nx = %b \nALUOp = %b \nOpCodeField = %b\nOperation = %b\n", x,ALUOp,opCodeField, operation);
end

endmodule 