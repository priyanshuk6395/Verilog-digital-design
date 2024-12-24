`timescale 1ns/1ns
`include "processor.v"
//iverilog -o name.vpp name.v


module Testbench;

    // Testbench Signals
    reg clk;
    reg reset;
    reg [15:0] instruction;
    wire [7:0] result;

    // Instantiate the InOrderProcessor module
    InOrderProcessor processor (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .result(result)
    );

    // Clock Generator
    always #5 clk = ~clk;  // Toggle clock every 5ns (100MHz clock)

    // Test Sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        instruction = 16'b0;

        // Apply reset
        #10 reset = 0;

        // Test Case 1: Addition (Opcode = 3'b000)
        // Registers A = 5, B = 3, Result written to R2
        instruction = 16'b000_001_010_010_0000;  // Opcode = 000, A=R1, B=R2, Dest=R2
        #10;

        // Test Case 2: Subtraction (Opcode = 3'b001)
        // Registers A = 7, B = 2, Result written to R3
        instruction = 16'b001_011_100_100_0000;  // Opcode = 001, A=R3, B=R4, Dest=R4
        #10;

        // Test Case 3: Logical AND (Opcode = 3'b010)
        // Registers A = 6, B = 3, Result written to R1
        instruction = 16'b010_101_110_001_0000;  // Opcode = 010, A=R5, B=R6, Dest=R1
        #10;

        // Test Case 4: Logical OR (Opcode = 3'b011)
        // Registers A = 4, B = 1, Result written to R0
        instruction = 16'b011_111_000_000_0000;  // Opcode = 011, A=R7, B=R0, Dest=R0
        #10;

        // Finish Simulation
        #50 $finish;
    end

    // Monitor Outputs
    initial begin
        $monitor("Time: %0dns, Reset: %b, Instruction: %b, Result: %d", 
                  $time, reset, instruction, result);
    end

endmodule