
module ALU_Testbench;

    reg [31:0] operandA;
    reg [31:0] operandB;
    reg [3:0] aluOp;
    reg shiftAmount;
    reg enable;
    wire [31:0] result;
    wire zeroFlag;
    wire carryFlag;

    // Instantiate the ALU module
    ALU UUT (
        .operandA(operandA),
        .operandB(operandB),
        .aluOp(aluOp),
        .enable(enable),
        .shiftAmount(shiftAmount),
        .res(result),
        .zeroFlag(zeroFlag),
        .carryFlag(carryFlag)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
    end
    // Stimulus generation
    initial begin

        $monitor("%d  -   Result = %d  %b", $time, result, result);

        // Test case 0: ADD operation  with enable off
        enable=0;
        operandA = 32'd30;
        operandB = 32'd10;
        aluOp = 4'b0000; // ADD_OP
        shiftAmount = 0;
        #10; // Wait for a few simulation cycles

        // Test case 1: ADD operation
        enable=1;
        operandA = 32'd30;
        operandB = 32'd10;
        aluOp = 4'b0000; // ADD_OP
        shiftAmount = 0;
        #10; // Wait for a few simulation cycles
        

        // Test case 2: SUB operation
        operandA = 32'd30;
        operandB = 32'd10;
        aluOp = 4'b0001; // SUB_OP
        shiftAmount = 0;
        #10; // Wait for a few simulation cycles
        

        // Test case 3: AND operation
        operandA = 32'd14;
        operandB = 32'd3;
        aluOp = 4'b0010; // AND_OP
        shiftAmount = 0;
        #10; // Wait for a few simulation cycles
      
        // Test case 4: OR operation
        operandA = 32'd14;
        operandB = 32'd3;
        aluOp = 4'b0011; // OR_OP
        shiftAmount = 0;
        #10; // Wait for a few simulation cycles
        
        // Test case 5: XOR operation
        operandA = 32'd14;
        operandB = 32'd3;
        aluOp = 4'b0100; // XOR_OP
        shiftAmount = 0;
        #10; 

        // Test case 6: NOT operation
        operandA = 32'b11111111111111111111111111110000;
        operandB = 32'd3;
        aluOp = 4'b0101; 
        shiftAmount = 0;
        #10; 

        // Test case 7: SLA operation
        operandA = 32'd7;
        operandB = 32'd3;
        aluOp = 4'b0110; 
        shiftAmount = 1;
        #10; 

        // Test case 8: SRA operation
        operandA = {8'd255, 8'd255, 8'd255, 8'b11111110};
        operandB = 32'd3;
        aluOp = 4'b0111; 
        shiftAmount = 1;
        #10;
        
        // Test case 9: SRL operation
        operandA = 32'd14;
        operandB = 32'd3;
        aluOp = 4'b1000; 
        shiftAmount = 1;
        #10; // Wait for a few simulation cycles

        // Test case 10: ADD operation
        enable=1;
        operandA = 32'd30;
        operandB = 32'd70;
        aluOp = 4'b0000; // ADD_OP
        shiftAmount = 0;
        
        #100;
        
        
    end

endmodule
