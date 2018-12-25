module CPU();

wire [63:0]pcIn;

wire [63:0]pcOut;

wire [63:0]usualPc;

wire [31:0]instruction;
wire Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0;


wire [4:0]mux1Out;

wire [63:0]aData;
wire [63:0]bData;

wire [63:0]extendedImmediate;

wire [63:0]relativeBranch;

wire [63:0]branchPc;

wire [63:0]mux2Out;

wire [3:0]aluOperation;

wire aluZero;
wire [63:0]dataMemoryAddress;

wire [63:0]dataMemoryReadData;

wire [63:0]cData;

wire clk;

reg pcReset;
initial  
begin  
	pcReset=1'b1;
        #10 pcReset = 1'b0; 
end 


Clock clock(clk);

PC pc(pcIn, pcReset, clk,1'b1,  pcOut);
Adder adder2 (pcOut, 64'd4, usualPc);
InstructionMemory instrcutionMemory(pcOut, instruction);

Control control(instruction[31:21], Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1);
MUX mux2to1_1(Reg2Loc,instruction[20:16], instruction[4:0], mux1Out); defparam mux2to1_1.n = 5;
RegisterBank RegisterBank(instruction[9:5], mux1Out, instruction[4:0], aData, bData, cData, RegWrite, clk);
SignExtend signExtend(instruction,{ALUOp0, ALUOp1} ,extendedImmediate);

ShiftLeft shiftLeft(extendedImmediate , relativeBranch);
Adder #(.n(64)) adder (pcOut, relativeBranch, branchPc);
MUX mux2to1_2(ALUSrc, bData, extendedImmediate, mux2Out);
ALUControl aluControl({ALUOp0,ALUOp1}, instruction[31:21], aluOperation);
ALU alu(aData, mux2Out, aluOperation, aluZero, dataMemoryAddress);

MUX mux2to1_3(Branch & aluZero, usualPc, branchPc, pcIn);
DataMemory dataMemory(dataMemoryAddress, bData, MemRead, MemWrite, dataMemoryReadData, clk);
MUX mux2to1_4(MemtoReg, dataMemoryAddress, dataMemoryReadData, cData);

endmodule
