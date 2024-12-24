`timescale 1ns/1ns
`include "adder.v"
//iverilog -o name.vpp name.v

module TestbenchAdder;
    reg [3:0] A;
    reg [3:0] B;
    wire [3:0] Sum;
    wire CarryOut;

    // Instantiate the Adder4Bit module
    Adder4Bit adder (
        .A(A),
        .B(B),
        .Sum(Sum),
        .CarryOut(CarryOut)
    );

    initial begin
        // Test case 1: No carry
        A = 4'b0011;  // 3
        B = 4'b0101;  // 5
        #10;
        $display("A = %b, B = %b, Sum = %b, CarryOut = %b", A, B, Sum, CarryOut);

        // Test case 2: With carry
        A = 4'b1111;  // 15
        B = 4'b0001;  // 1
        #10;
        $display("A = %b, B = %b, Sum = %b, CarryOut = %b", A, B, Sum, CarryOut);

        // Test case 3: Random addition
        A = 4'b1001;  // 9
        B = 4'b0110;  // 6
        #10;
        $display("A = %b, B = %b, Sum = %b, CarryOut = %b", A, B, Sum, CarryOut);

        // Finish the simulation
        $finish;
    end
endmodule