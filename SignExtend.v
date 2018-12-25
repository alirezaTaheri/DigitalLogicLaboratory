module SignExtend (in , opCode, out);
  parameter delay = 10;
input [31:0] in;
input [1:0] opCode;
output [63:0] out;
reg [31:0] x;
reg [8:0] rtype;
reg [18:0] cbtype;
wire z;


assign #delay z = opCode ==  2'b00 ?  in[20] : in[23];
assign #delay out = opCode == 2'b00 ? {{55{z}}, in[20:12]} : {{45{z}}, in[23:5]}; 


always @(*)
$display ("\nSignExtend: \nOpCode = %b \nInput = %b\nOutput = %b\n", opCode, in, out);
 endmodule