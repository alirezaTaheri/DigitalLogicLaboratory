module ShiftLeft (in , out);
parameter delay = 10;
input [63:0] in;
output [63:0] out;
assign out = in << 2;
//assign #delay out  = {in[61:0], 2'b00};
always @(*)
$display ("ShiftLeft:\nIn =  %b \nOut = %b\n",in, out);
endmodule