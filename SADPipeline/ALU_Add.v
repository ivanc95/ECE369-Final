`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:14 10/20/2015 
// Design Name: 
// Module Name:    ALU_Add 
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
module ALU_Add(A,B,Out);
input [31:0] A,B;
output reg[31:0] Out;

always@(A,B)
begin
Out = A + B;
end


endmodule
