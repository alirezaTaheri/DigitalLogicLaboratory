module PC(old_pc,reset,clk,w,next_pc);

input reset,clk,w;
input [63:0]old_pc;
output [63:0]next_pc;

reg [63:0] next_pc;

always@(posedge clk)
  begin
  #10
   if(reset)
    begin
     next_pc = 64'b0; 
    end
   else
    begin
     if(w)
      begin
       next_pc = old_pc;
      end
    end
   end
endmodule