  module RegisterBank(Read_register_1,Read_register_2,Write_register, write, clk, Read_data_1, Read_data_2, Write_data);

   input write, clk;

   input [4:0] Read_register_1,Read_register_2,Write_register;
   input  [63:0] Write_data;
   output [63:0] Read_data_1, Read_data_2;
   reg[63:0] registers [31:0];

   assign Read_data_1 = registers[Read_register_1];
   assign Read_data_2 = registers[Read_register_2];

   always @(clk)
     begin
       if (write)
         begin
           registers[Write_register] = Write_data;
         end
     end
   endmodule
