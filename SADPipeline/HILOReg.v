`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    10:43:18 10/13/2015
// Design Name:
// Module Name:    HILOReg
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module HILOReg( inHigh,inLow,HI,LO,HIWrite,LOWrite,Rst,Clk);

input  [31:0] inHigh,inLow;
input Clk,Rst,HIWrite,LOWrite;
output reg [31:0] HI,LO;

always@(posedge Clk)
begin
if (HIWrite == 1)
begin
	HI = inHigh;
end

if (LOWrite == 1)
begin
LO = inLow;
end

if (Rst == 1)
begin
	HI = 32'd0;
	LO = 32'd0;
end

end

endmodule
