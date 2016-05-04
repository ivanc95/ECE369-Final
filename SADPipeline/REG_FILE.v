`timescale 1ns / 1ps
module REG_FILE(Clk, ReadRegister1,ReadRegister2,WriteRegister, WriteData, RegWrite, ReadData1, ReadData2,o1,o2,o3,o4,ra_write,RA,tRegistersOut,tRegistersIn,TRCWrite);

input [31:0] WriteData,RA;
input [255:0] tRegistersOut;
input [4:0] ReadRegister1 ,ReadRegister2 ,WriteRegister;
input RegWrite,ra_write;
input Clk,TRCWrite;

output reg [31:0] ReadData1, ReadData2;
output [255:0] tRegistersIn;
output [31:0] o1,o2,o3,o4;
reg [31:0] RegisterFile [0:31];

initial
begin
RegisterFile[0] = 32'd0;
RegisterFile[1] = 32'd0;
RegisterFile[2] = 32'd0;
RegisterFile[3] = 32'd0;
RegisterFile[4] = 32'd0;
RegisterFile[5] = 32'd0;
RegisterFile[6] = 32'd0;
RegisterFile[7] = 32'd0;
RegisterFile[8] = 32'd0;
RegisterFile[9] = 32'd0;
RegisterFile[10] = 32'd0;
RegisterFile[11] = 32'd0;
RegisterFile[12] = 32'd0;
RegisterFile[13] = 32'd0;
RegisterFile[14] = 32'd0;
RegisterFile[15] = 32'd0;
RegisterFile[16] = 32'd0;
RegisterFile[17] = 32'd0;
RegisterFile[18] = 32'd0;
RegisterFile[19] = 32'd0;
RegisterFile[20] = 32'd0;
RegisterFile[21] = 32'd0;
RegisterFile[22] = 32'd0;
RegisterFile[23] = 32'd0;
RegisterFile[24] = 32'd0;
RegisterFile[25] = 32'd0;
RegisterFile[26] = 32'd0;
RegisterFile[27] = 32'd0;
RegisterFile[28] = 32'd0;
RegisterFile[29] = 32'd16540;
RegisterFile[30] = 32'd0;
RegisterFile[31] = 32'd0;
end

always @(posedge Clk)
begin

	if (RegWrite)
	begin
			RegisterFile[WriteRegister] <= WriteData;
	end
	
	if (ra_write == 1)
	begin
			RegisterFile[31] <= RA;
	end
	if (TRCWrite == 1)
	begin
	RegisterFile[8]<=tRegistersOut[255:224];
	RegisterFile[9]<=tRegistersOut[223:192];
	RegisterFile[10]<=tRegistersOut[191:160];
	RegisterFile[11]<=tRegistersOut[159:128];
	RegisterFile[12]<=tRegistersOut[127:96];
	RegisterFile[13]<=tRegistersOut[95:64];
	RegisterFile[14]<=tRegistersOut[63:32];
	RegisterFile[15]<=tRegistersOut[31:0];
	end
end

always @(negedge Clk)
begin
	ReadData1 <= RegisterFile[ReadRegister1];
	ReadData2 <= RegisterFile[ReadRegister2];

end



assign	o1 = RegisterFile[16]; // S1
assign 	o2 = RegisterFile[17]; // S2
assign	o3 = RegisterFile[2];  // s3
assign	o4 = RegisterFile[3];  // s4
assign 	tRegistersIn[255:224] = RegisterFile[8];
assign	tRegistersIn[223:192] = RegisterFile[9];
assign	tRegistersIn[191:160] = RegisterFile[10];
assign	tRegistersIn[159:128] = RegisterFile[11];
assign	tRegistersIn[127:96] = RegisterFile[12];
assign	tRegistersIn[95:64] = RegisterFile[13];
assign	tRegistersIn[63:32] = RegisterFile[14];
assign	tRegistersIn[31:0] = RegisterFile[15];


endmodule
