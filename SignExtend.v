module SignExtend (in, out, branch);
input [31:0] in;
input branch;
output reg [63:0] out;
reg [31:0] x;
reg [8:0] rtype;
reg [18:0] btype;
always @(*)
 begin
  if (branch == 1'b0)
  begin
    btype = in[5:23];
    if (btype[18] == 0)
      x = {45{1'b0}};
    else
      x = {45{1'b1}};
  end
else
  begin
    rtype = in[12:20];
    if (rtype[8] == 0)
      x = {55{1'b0}};
    else
      x = {55{1'b1}};
  end
end
  out = {x,in};
 end
endmodule 