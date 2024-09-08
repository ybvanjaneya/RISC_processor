`timescale 1ns/1ns

module tb_regbank();
    reg [3:0] rad1;
    reg [3:0] rad2; 
    reg [3:0] wad;
    reg [31:0] wdata;
    reg r1;
    reg r2;
    reg wen;
    reg clk;
    wire [31:0] rdata1; 
    wire [31:0] rdata2;

    RegisterBank reg_bank(
        .rad1(rad1),
        .rad2(rad2),
        .wad(wad),
        .wdata(wdata),
        .r1(r1),
        .r2(r2),
        .clk(clk),
        .wen(wen),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );

    initial begin
        clk <= 0;
    end

    always begin
        clk = ~clk;
    end

    initial begin
        $monitor("Rs1 = %d, Rs2 = %d, Rd = %d, Op = %d",);
    end



endmodule