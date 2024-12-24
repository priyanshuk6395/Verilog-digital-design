`timescale 1ns/1ns
`include "alu.v"
//iverilog -o name.vpp name.v


module TestbenchALU8Bit;
    reg [7:0] A;         // 8-bit input A
    reg [7:0] B;         // 8-bit input B
    reg [2:0] Opcode;    // 3-bit Opcode to select operation
    wire [7:0] Result;   // 8-bit result
    wire Zero;           // Zero flag

    // Instantiate the ALU8Bit module
    ALU8Bit alu (
        .A(A),
        .B(B),
        .Opcode(Opcode),
        .Result(Result),
        .Zero(Zero)
    );

    initial begin
        // Test case 1: A + B (ADD)
        A = 8'b00001100;    // 12
        B = 8'b00000101;    // 5
        Opcode = 3'b000;    // ADD operation
        #10;
        $display("Opcode = ADD, A = %b, B = %b, Result = %b, Zero = %b", A, B, Result, Zero);

        // Test case 2: A - B (SUB)
        A = 8'b00001100;    // 12
        B = 8'b00000101;    // 5
        Opcode = 3'b001;    // SUB operation
        #10;
        $display("Opcode = SUB, A = %b, B = %b, Result = %b, Zero = %b", A, B, Result, Zero);

        // Test case 3: A & B (AND)
        A = 8'b11001100;    // 204
        B = 8'b10101010;    // 170
        Opcode = 3'b010;    // AND operation
        #10;
        $display("Opcode = AND, A = %b, B = %b, Result = %b, Zero = %b", A, B, Result, Zero);

        // Test case 4: A | B (OR)
        A = 8'b11001100;    // 204
        B = 8'b10101010;    // 170
        Opcode = 3'b011;    // OR operation
        #10;
        $display("Opcode = OR, A = %b, B = %b, Result = %b, Zero = %b", A, B, Result, Zero);

        // Test case 5: A ^ B (XOR)
        A = 8'b11001100;    // 204
        B = 8'b10101010;    // 170
        Opcode = 3'b100;    // XOR operation
        #10;
        $display("Opcode = XOR, A = %b, B = %b, Result = %b, Zero = %b", A, B, Result, Zero);

        // Test case 6: ~(A | B) (NOR)
        A = 8'b11001100;    // 204
        B = 8'b10101010;    // 170
        Opcode = 3'b101;    // NOR operation
        #10;
        $display("Opcode = NOR, A = %b, B = %b, Result = %b, Zero = %b", A, B, Result, Zero);

        // Test case 7: Zero flag test
        A = 8'b00000000;    // 0
        B = 8'b00000000;    // 0
        Opcode = 3'b000;    // ADD operation (result should be 0)
        #10;
        $display("Opcode = ADD, A = %b, B = %b, Result = %b, Zero = %b", A, B, Result, Zero);

        // Finish the simulation
        $finish;
    end
endmodule