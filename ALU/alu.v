module ALU8Bit (
    input [7:0] A,          // 8-bit input A
    input [7:0] B,          // 8-bit input B
    input [2:0] Opcode,     // Operation selector (3 bits for 6 operations)
    output reg [7:0] Result, // 8-bit result of the ALU operation
    output reg Zero         // Zero flag, set if Result is zero
);

    always @(*) begin
        case (Opcode)
            3'b000: Result = A + B;      // ADD operation
            3'b001: Result = A - B;      // SUB operation
            3'b010: Result = A & B;      // AND operation
            3'b011: Result = A | B;      // OR operation
            3'b100: Result = A ^ B;      // XOR operation
            3'b101: Result = ~(A | B);   // NOR operation
            default: Result = 8'b00000000; // Default to 0
        endcase

        // Set the Zero flag if Result is zero
        Zero = (Result == 8'b00000000) ? 1'b1 : 1'b0;
    end

endmodule