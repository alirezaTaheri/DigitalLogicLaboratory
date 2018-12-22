module ALUControl(ALUOp1, ALUOp2, opCodeField, operation);
input ALUOp1, ALUOp2;
input [10:0] opCodeField;
output reg[3:0] operation;
wire x = {ALUOp1, ALUOp2, opCodeField};
always@(*)
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
endcase
end
endmodule 