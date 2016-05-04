`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:18 11/23/2015 
// Design Name: 
// Module Name:    Mux32Bit_3to1 
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
module Mux32Bit_3to1(A,B,C,sel,out);
input [31:0] A,B,C;
output reg [31:0] out;
input[1:0] sel;

always@(*)
begin

if (sel == 0)
	begin
		out<=A;
	end
else if(sel == 1)
	begin
		out<=B;
	end
else if(sel == 2)
	begin
		out <= C;
	end
else
	begin
		out <= 32'd0;
	end

end


endmodule
