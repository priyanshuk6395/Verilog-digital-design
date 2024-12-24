module EqualityComparator4Bit (
input [3:0] A ,
input [3:0] B ,
output reg Equal
) ;
always @ (*) begin
if ( A == B )
Equal = 1;
else
Equal = 0;
end
endmodule