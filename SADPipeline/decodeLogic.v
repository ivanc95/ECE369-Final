`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:44:13 11/24/2015 
// Design Name: 
// Module Name:    decodeLogic 
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
module decodeLogic(out1, MEM_WB_MemReadOut, MEM_WB_RegWriteMemOut, IF_ID_RS, IF_ID_RT, RSControl, RTControl);

input [4:0] out1, IF_ID_RS, IF_ID_RT;
input MEM_WB_MemReadOut, MEM_WB_RegWriteMemOut;

output reg RSControl, RTControl;

initial
begin
RSControl <= 0;
RTControl <= 0;
end

always @(*)
begin
	
	if((out1 == IF_ID_RS) && MEM_WB_RegWriteMemOut)
	begin
		RSControl = 1;
	end
	else
	begin
		RSControl = 0;
	end
	
	if((out1 == IF_ID_RT) && MEM_WB_RegWriteMemOut)
	begin
		RTControl = 1;
	end
	else
	begin
		RTControl = 0;
	end

end

endmodule
