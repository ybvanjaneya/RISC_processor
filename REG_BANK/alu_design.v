module ALU (
    input wire [31:0] operandA,  // First operand
    input wire [31:0] operandB,  // Second operand
    input wire [3:0] aluOp,      // 4-bit opcode for operation selection
    input wire enable,
    output wire [31:0] res,   // ALU result
    output wire zeroFlag,        // Zero flag
    output wire carryFlag        // Carry flag
);

// ALU operation code definitions
parameter ADD_OP = 4'b0001;
parameter SUB_OP = 4'b0010;
parameter AND_OP = 4'b0011;
parameter OR_OP  = 4'b0100;
parameter XOR_OP = 4'b0101;
parameter NOT_OP = 4'b0110;
parameter SLA_OP = 4'b0111;
parameter SRA_OP = 4'b1000;
parameter SRL_OP = 4'b1001;

reg [31:0] result;
// ALU control logic
always @(*)
begin
    case (aluOp)
        ADD_OP: result = operandA + operandB;
        SUB_OP: result = operandA - operandB;
        AND_OP: result = operandA & operandB;
        OR_OP:  result = operandA | operandB;
        XOR_OP: result = operandA ^ operandB;
        NOT_OP: result = ~operandA;
        SLA_OP: result = operandA << operandB[0]; // Arithmetic shift left
        SRA_OP: result = operandB[0]?{operandA[31], operandA[31:1]}: operandA; // Arithmetic shift right
        SRL_OP: result = operandA >> operandB[0]; // Logical shift right
        default: result = 32'b0; // Default behavior for undefined opcode
    endcase
    
end

    assign zeroFlag = (result == 32'b0) ? 1'b1 : 1'b0;
    
    // Carry flag: Set if there's a carry-out in arithmetic operations
    assign carryFlag = (aluOp == ADD_OP && (result < operandA || result < operandB)) ? 1'b1 : 1'b0;
    assign res = enable? result:32'bz;

endmodule
