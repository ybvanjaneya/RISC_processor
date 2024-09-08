`timescale 1ns/1ns

module tb_top();
    reg [31:0]din;
    reg load;
    reg clk;
    reg [3:0]op;
    reg [3:0]rs1;
    reg [3:0]rs2;
    reg [3:0]rd;
    wire [31:0]out;
    wire [31:0] x;
    top_module dut(
        .din(din),
        .load(load),
        .clk(clk),
        .op(op),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .out(out)
    );

    initial begin
        clk <= 0;
        load <= 1'b0;
    end
    // initial begin
    //     $dumpfile("dump.vcd");
    //     $dumpvars();
    // end

    always begin
        #5 clk = ~clk;
    end

    initial begin

        $monitor("LOAD = %d, Rs1 = %d, Rs2 = %d, Rd = %d, out = %d, Op = %d",load, rs1,rs2,rd,out,op);

        #100
        load = 1'b1;
        din = 32'd20;
        rs1 = 4'dz;
        rs2 = 4'dz;
        rd = 4'd1;
        #100
        load = 1'b1;
        din = 32'd10;
        rs1 = 4'dz;
        rs2 = 4'dz;
        rd = 4'd2;
        #100
        load = 1'b1;
        din = 32'd50;
        rs1 = 4'dz;
        rs2 = 4'dz;
        rd = 4'd3;
        #100
        load = 1'b0;
        rs1 = 4'd1;
        rs2 = 4'd2;
        op = 4'b0001;
        rd = 4'd5;
        #100
        load = 1'b0;
        rs1 = 4'd3;
        rs2 = 4'd2;
        op = 4'b0010;
        rd = 4'd6;
        #100
        load = 1'b0;
        rs1 = 4'd1;
        rs2 = 4'd2;
        op = 4'b0011;
        rd = 4'd7;
        #100
        load = 1'b1;
        din = 32'd13;
        rs1 = 4'dz;
        rs2 = 4'dz;
        rd = 4'd2;
        op = 4'bz;
        #100
        load = 1'b0;
        rs1 = 4'd3;
        rs2 = 4'd2;
        op = 4'b1000;
        rd = 4'd9;
    #100
    $finish;  
    end
    

endmodule