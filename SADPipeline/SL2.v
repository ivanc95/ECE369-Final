`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:48:25 10/20/2015 
// Design Name: 
// Module Name:    SL2 
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
module SL2(in,out);

input [31:0] in;
output reg [31:0] out;
always@(in)
begin
out = in << 2;
end




endmodule
