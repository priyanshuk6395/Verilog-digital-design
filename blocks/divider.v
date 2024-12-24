module Divider4Bit (
input [3:0] A , // Dividend
input [3:0] B , // Divisor
output [3:0] Quotient ,
output [3:0] Remainder
) ;
assign Quotient = ( B != 0) ? A / B : 0;
assign Remainder = ( B != 0) ? A % B : 0;
endmodule