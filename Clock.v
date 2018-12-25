module Clock(clk);
output reg clk;

always 
begin

#100
clk = 1;
$display("\nClock: %b // Current Time: ",clk, $time);
#100
clk = 0;
$display("\nClock: %b // Current Time: ",clk, $time);
end
endmodule
