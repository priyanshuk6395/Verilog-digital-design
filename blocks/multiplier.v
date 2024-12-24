module Multiplier4Bit (
input [3:0] A ,
input [3:0] B ,
output [7:0] Product
) ;
assign Product = A * B ;
endmodule