module CPU();

parameter delay = 100;

wire [63:0] PC_out;

wire [63:0] Adder_1_out;
wire [63:0] Adder_2_out;

wire [63:0] MUX_1_out;
wire [4:0] MUX_2_out;
wire [63:0] MUX_3_out;
wire[63:0] MUX_4_out;

wire [31:0] Instr_out;

wire Reg2Loc;
wire UncondBranch;
wire Branch;
wire MemRead;
wire MemtoReg;
wire ALUOp;
wire MemWrite;
wire ALUSrc;
wire RegWrite;

wire [63:0] Reg_Read_data_1;
wire [63:0] Reg_Read_data_2;

wire [63:0]Sign_out;
wire [63:0]Shift_out;

wire ALU_op;
wire Zero;
wire ALU_result;

wire [63:0]Mem_Read_data

wire clk;

reg PC_reset;
reg PC_write;

initial
begin
	PC_reset = 1'b1;
	PC_write = 1'b0;
end

always
begin
	PC_reset = 1'b0;
	PC_write = 1'b1;
end

Clock clock(clk);

MUX MUX_1(Adder_1_out,Adder_2_out,Branch & Zero);

PC PC(MUX_1_out,PC_reset,clk,PC_write,PC_out);

PC_Adder Adder(PC_out,64'd4,Adder_1_out);

InstructionMemory Instruction_memory(PC_out,Instr_out);

Control Control(Instr_out[31:21],Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0);

MUX MUX_2(Instr_out[20:16],Instr_out[4:0],Reg2Loc,MUX_2_out);

RegisterBank RegisterBank(Instr_out[9:5],MUX_2_out,Instr_out[4:0],RegWrite,clk,Reg_Read_data_1,Reg_Read_data_2,MUX_4_out);

SignExtend SignExtend(Instr_out,Sign_out);

ShiftLeft_2 ShiftLeft_2(Sign_out,Shift_out);

PC_Adder Adder_2(PC_out,Shift_out,Adder_2_out);

MUX MUX_3(Read_data_2,Sign_out,ALUSrc,MUX_3_out);

ALU_control ALU_control({ALUOp1,ALUOp2},Instr_out[31:21],ALU_op);

ALU ALU(Read_data_1,MUX_3_out,ALU_op,Zero,ALU_Result);

Data_memory(clk,MemWrite,MemRead,Mem_Read_data,Reg_Read_data_2,ALU_Result);

MUX MUX_4(Mem_Read_data,ALU_Result,MemtoReg,MUX_4_out);

endmodule