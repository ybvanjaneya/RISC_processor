//fpga code

// module top_module(
//     input [15:0]inp,
//     input clk,
//     input s1,s2,s3,s4,s5,
    
//     output [15:0]out_put
// );
//     reg load;
//     reg [31:0]din;
//     reg [3:0]op;
//     reg [3:0]rs1;
//     reg [3:0]rs2;
//     reg [3:0]rd;
//     wire [31:0]out;
//     reg [31:0]wdata;
//     reg r1,r2,wen;
//     wire [31:0]rdata1;
//     wire [31:0]rdata2;
//     wire [31:0] res;
//     reg [31:0] A;
//     reg [31:0] B;
//     wire carryFlag;
//     wire zeroFlag;
//     reg alu_en;

//     RegisterBank inst1(
//         .rad1(rs1), 
//         .rad2(rs2), 
//         .wad(rd),
//         .wdata(wdata),
//         .r1(r1),
//         .r2(r2),
//         .wen(wen),
//         .clk(clk),
//         .rdata1(rdata1), 
//         .rdata2(rdata2),
//         .out(out)
//     );

//     ALU inst2(
//         .operandA(A),  
//         .operandB(B),  
//         .aluOp(op),           
//         .enable(alu_en),
//         .res(res),   
//         .zeroFlag(zeroFlag),    
//         .carryFlag(carryFlag)        
//     );
//     reg s;
//     initial begin
//         s <= 1'b0;
//     end
    
//     always @ (posedge clk) begin
//         if(s1)begin
//             din[15:0] = inp; 
//         end
//         else if (s2) begin
//             din[31:16]= inp;
//         end
//         else if (s3) begin
//             load = inp[0];
//         end
//         else if (s4) begin
//             op <= inp[15:12];
//             rs1<= inp[11:8];
//             rs2<= inp[7:4];
//             rd <= inp[3:0];
//         end
//     end
    
//     always @ (posedge clk) begin
//         if (s5) begin
//             alu_en = ~load;
//             if(load)begin
//                 wdata <= din;
//                 wen <= 1'b1;
//             end
//             else begin
//                 if (s==1'b0) begin
//                     r1 <= 1;
//                     r2 <= 1;
//                     A <= rdata1;
//                     B <= rdata2;
//                     s = 1'b1;
//                 end
//                 else begin
//                     wen <= 1'b1;
//                     wdata <= res;
//                     s = 1'b0;
//                 end
//             end
//         end
//     end

// endmodule



//simulation code

module top_module(
    input [31:0]din,
    input load,
    input clk,
    input [3:0] op,
    input [3:0]rs1,
    input [3:0]rs2,
    input [3:0]rd,
    output [31:0]out
);
    reg [31:0]wdata;
    reg r1,r2,wen;
    wire [31:0]rdata1;
    wire [31:0]rdata2;
    wire [31:0] res;
    reg [31:0] A;
    reg [31:0] B;
    wire carryFlag;
    wire zeroFlag;
    reg alu_en;

    RegisterBank inst1(
        .rad1(rs1), 
        .rad2(rs2), 
        .wad(rd),
        .wdata(wdata),
        .r1(r1),
        .r2(r2),
        .wen(wen),
        .clk(clk),
        .rdata1(rdata1), 
        .rdata2(rdata2),
        .out(out)
    );

    ALU inst2(
        .operandA(A),  
        .operandB(B),  
        .aluOp(op),           
        .enable(alu_en),
        .res(res),   
        .zeroFlag(zeroFlag),    
        .carryFlag(carryFlag)        
    );
    reg s;
    initial begin
        s <= 1'b0;
    end
    always @ (posedge clk) begin
        alu_en = ~load;
        if(load)begin
            wdata <= din;
            wen <= 1'b1;
            s <= 1'b0;
        end
        else begin
            if (s==1'b0) begin
                r1 <= 1;
                r2 <= 1;
                A <= rdata1;
                B <= rdata2;
                s <= 1'b1;
            end
            if (s==1'b1) begin
                wen <= 1'b1;
                wdata <= res;
                s <= 1'b0;
            end
        end
    end

endmodule