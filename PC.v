module PC(old_pc,reset,clk,w,next_pc);
parameter delay=10;
input reset,clk,w;
input [63:0]old_pc;
output [63:0]next_pc;

reg [63:0] next_pc;

always@(posedge clk)
  begin

   if(reset)

     delay next_pc = 64'b0; 

   else
    begin
     if(w)

       delay next_pc = old_pc;

    end
   end
endmodule