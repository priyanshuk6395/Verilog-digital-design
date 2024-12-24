`timescale 1ns/1ns
`include "multiplier.v"
//iverilog -o name.vpp name.v
module TestbenchMultiplier;
    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] Product;

    // Instantiate the Multiplier4Bit module
    Multiplier4Bit multiplier (
        .A(A),
        .B(B),
        .Product(Product)
    );

    initial begin
        // Test case 1: A = 3, B = 2
        A = 4'b0011;  // 3
        B = 4'b0010;  // 2
        #10;
        $display("A = %b, B = %b, Product = %b", A, B, Product);

        // Test case 2: A = 15, B = 1
        A = 4'b1111;  // 15
        B = 4'b0001;  // 1
        #10;
        $display("A = %b, B = %b, Product = %b", A, B, Product);

        // Test case 3: A = 5, B = 5
        A = 4'b0101;  // 5
        B = 4'b0101;  // 5
        #10;
        $display("A = %b, B = %b, Product = %b", A, B, Product);

        // Finish the simulation
        $finish;
    end
endmodule