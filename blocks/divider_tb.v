`timescale 1ns/1ns
`include "divider.v"
//iverilog -o name.vpp name.v

module TestbenchDivider;
    reg [3:0] A;
    reg [3:0] B;
    wire [3:0] Quotient;
    wire [3:0] Remainder;

    // Instantiate the Divider4Bit module
    Divider4Bit divider (
        .A(A),
        .B(B),
        .Quotient(Quotient),
        .Remainder(Remainder)
    );

    initial begin
        // Test case 1: A = 8, B = 2
        A = 4'b1000;  // 8
        B = 4'b0010;  // 2
        #10;
        $display("A = %b, B = %b, Quotient = %b, Remainder = %b", A, B, Quotient, Remainder);

        // Test case 2: A = 10, B = 3
        A = 4'b1010;  // 10
        B = 4'b0011;  // 3
        #10;
        $display("A = %b, B = %b, Quotient = %b, Remainder = %b", A, B, Quotient, Remainder);

        // Test case 3: A = 15, B = 0 (division by zero)
        A = 4'b1111;  // 15
        B = 4'b0000;  // 0
        #10;
        $display("A = %b, B = %b, Quotient = %b, Remainder = %b", A, B, Quotient, Remainder);

        // Finish the simulation
        $finish;
    end
endmodule