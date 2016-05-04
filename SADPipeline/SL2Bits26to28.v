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
module SL2Bits26to28(in,out);

input [25:0] in;
output reg [27:0] out;
always@(in)
begin
out = in << 2;
end




endmodule
