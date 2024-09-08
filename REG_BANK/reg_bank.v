module RegisterBank(
    input [3:0] rad1, 
    input [3:0] rad2, 
    input [3:0] wad,
    input [31:0] wdata,
    input r1,
    input r2,
    input wen,
    input clk,
    output [31:0] rdata1, 
    output [31:0] rdata2,
    output [31:0] out
);

reg [31:0] registers [15:0]; 
initial begin
    registers[4'b0000] <= 0;
end
always @ (posedge clk) begin
    if (wen) begin
        if (wad != 4'b0000) begin
            registers[wad] <= wdata; 
        end
    end
end
assign rdata1 = r1? registers[rad1]: 32'bz; 
assign rdata2 = r2? registers[rad2]: 32'bz;
assign out = registers[wad];
endmodule
