`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:03 10/13/2015 
// Design Name: 
// Module Name:    Datapath_TB 
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
module Datapath_TB();

	reg Reset, Clk;
	wire [31:0] o1,o2,o3,o4;
    Datapath u0(
		  .Clk(Clk),
        .Reset(Reset),
		  .o1(o1),
		  .o2(o2),
		  .o3(o3),
		  .o4(o4)
    );

	initial 
	begin
		Clk <= 1'b0;
		forever #100 Clk <= ~Clk;
	end

	initial
	
	begin
	Reset <= 1;
	#200;
	Reset <= 0;

	end
	

endmodule
