`timescale 1ns/1ns
`include "comparator.v"
//iverilog -o name.vpp name.v

module Testbench;
    reg [3:0] A;
    reg [3:0] B;
    wire Equal;

    // Instantiate the EqualityComparator4Bit module
    EqualityComparator4Bit comparator (
        .A(A),
        .B(B),
        .Equal(Equal)
    );

    initial begin
        // Test case 1: A = B
        A = 4'b1010;
        B = 4'b1010;
        #10;  // Wait 10 time units
        $display("A = %b, B = %b, Equal = %b", A, B, Equal);

        // Test case 2: A != B
        A = 4'b1010;
        B = 4'b1111;
        #10;
        $display("A = %b, B = %b, Equal = %b", A, B, Equal);

        // Test case 3: A = B
        A = 4'b0000;
        B = 4'b0000;
        #10;
        $display("A = %b, B = %b, Equal = %b", A, B, Equal);

        // Finish the simulation
        $finish;
    end
endmodule