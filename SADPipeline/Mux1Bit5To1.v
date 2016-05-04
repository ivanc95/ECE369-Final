`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:37 10/22/2015 
// Design Name: 
// Module Name:    Mux1Bit5To1 
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
module Mux1Bit5To1(A, B, C, D, E, Sel, Out);

input A, B, C, D, E;
input [2:0] Sel;
output reg Out;

always @(A,B,C,D,E,Sel)
begin
		case(Sel)
		3'd0:begin Out = A; end
		3'd1:begin Out = B; end
		3'd2:begin Out = C; end
		3'd3:begin Out = D; end
		3'd4:begin Out = E; end
		3'd5:begin Out = ~C; end
		default:begin Out = 0; end
		endcase
end

endmodule
