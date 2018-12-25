module Control(in,Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0);
parameter delay = 10;
  input [10:0] in;
  output reg Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
  always @(in)
  begin
  #delay
    casex (in)
    11'b1XX0101X000 : 
      {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} = 9'b000100010;

    11'b11111000010 : 
      {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} = 9'b111110000;

    11'b11111000000 : 
      {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} = 9'b111001000;

    11'b10110100XXX : 
      {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} = 9'b101000101;

    default : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} = 9'b000000000;
  endcase
$display ("\nControl: \nIn = %b / Reg2Loc = %b / ALUSrc = %b / MemtoReg = %b / RegWrite = %b / MemRead = %b / MemWrite = %b / Branch = %b / ALUOp1 = %b / ALUOp0 = %b /\n", in,Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);
end


endmodule 
