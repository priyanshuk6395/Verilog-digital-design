`timescale 1ns/1ns
`include "../ALU/alu.v"
//iverilog -o name.vpp name.v
module InOrderProcessor (
    input clk,                  // Clock signal
    input reset,                // Reset signal
    input [15:0] instruction,   // 16-bit instruction input
    output [7:0] result         // 8-bit ALU result output
);

    // Register File (8 registers, 8 bits each)
    reg [7:0] registers [0:7];
    reg [7:0] A, B;             // ALU inputs
    wire [7:0] ALUResult;       // ALU output
    wire ZeroFlag;              // Zero flag from ALU
    reg [2:0] Opcode;           // Operation selector for ALU
    reg [2:0] DestReg;          // Destination register index for result
    reg writeBack;              // Control for write-back stage

    // Instantiate the ALU
    ALU8Bit alu (
        .A(A),
        .B(B),
        .Opcode(Opcode),
        .Result(ALUResult),
        .Zero(ZeroFlag)
    );

    // Fetch and Decode Stage
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset registers
            A <= 8'b0;
            B <= 8'b0;
            Opcode <= 3'b000;
            DestReg <= 3'b000;
            writeBack <= 0;
        end else begin
            // Decode Stage
            Opcode <= instruction[15:13];  // Use top 3 bits for opcode
                // Decode register indices and operands for ALU operations
                A <= instruction[12:10];  // Register A
                B <= instruction[9:7];    // Register B
                DestReg <= instruction[6:4];         // Destination register for ALU result

                // Perform ALU operation
                writeBack <= 1'b1; // Write-back enabled after ALU operations
            
        end
    end

    // Write-Back Stage: Writes ALU result to destination register
    always @(posedge clk) begin
        if (writeBack) begin
            registers[DestReg] <= ALUResult; // Write ALU result to destination register
        end
    end

    // Output the ALU result
    assign result = ALUResult; 

endmodule