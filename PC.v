
module PC(old_pc, reset, clk,w, next_pc);
parameter delay=10;
input reset,clk,w;
input [63:0]old_pc;
output [63:0]next_pc;

reg [63:0] next_pc;
initial
next_pc = 64'b0;

always@(posedge clk)
  begin

   if(reset)

     #delay next_pc = 64'b0; 

   else
    begin
     if(w)

       #delay next_pc = old_pc;

    end
$display("\nPC:\nOldPc = %b\nNextPc = %b\nReset = %b\nWrite = %b\n", old_pc, next_pc, reset, w);
   end
endmodule