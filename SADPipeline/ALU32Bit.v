`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Name: Jonathan Avila & Ivan Cordoba
// Effort: 50/50
// Laboratory 10
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, HI, LO, ALUResult, ALUResult2, GTFlag, LTFlag,EQFlag, SHAMT);
input [5:0] ALUControl; // control bits for ALU operation
input [31:0] A, B;			// inputs
input [31:0] HI,LO;
input [4:0] SHAMT;
reg [63:0] temp1;
reg [63:0] temp2;
output reg [31:0] ALUResult;	//	(LO)
output reg [31:0] ALUResult2;	// (HI)
output reg GTFlag, LTFlag,EQFlag;			// Zero=1 if ALUResult == 0
////////////////////////////////////////////////////////////////////////////////

always @(ALUControl,A,B,HI,LO,SHAMT)
begin
temp1 = 64'd0;
temp2 = 64'd0;
ALUResult = 0;
ALUResult2 = 0;


if (A == B)
begin
	EQFlag = 1;
end

else
begin
	EQFlag = 0;
end

if($signed(A) < 0)
begin
LTFlag = 1;
end
else
begin
LTFlag = 0;
end




if($signed(A) > 0)
begin
GTFlag = 1;
end
else
begin
GTFlag = 0;
end





////////////////////////////////////////////////////////////////////////////////

if (ALUControl == 6'd0)		// AND (0)
begin
ALUResult = A & B;
end

else if (ALUControl == 6'd1) //ADD (1)
begin
ALUResult = $signed(A) + $signed(B);
end

else if (ALUControl == 6'd2) // ADDIU (2)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd3) // ADDU (3)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd4) // SUB (4)
begin
ALUResult = A - B;
end

else if (ALUControl == 6'd5) // NOR (5)
begin
ALUResult = ~(A|B);
end

else if (ALUControl == 6'd6) // OR (6)
begin
ALUResult = (A|B);
end

else if (ALUControl == 6'd7) // SLL (7)
begin
ALUResult = B << SHAMT;
end

else if (ALUControl == 6'd8) // SLLV (8)
begin
ALUResult = B << A;
end

else if (ALUControl == 6'd9)	// SLT (9)
begin
if ($signed(A) < $signed(B))
begin
ALUResult = 32'd1;
end
else
begin
ALUResult = 32'd0;
end
end

else if (ALUControl == 6'd10)	// SLTU (10)
begin
if (A < B)
begin
ALUResult = 32'd1;
end
else
ALUResult = 32'd0;
end

else if (ALUControl == 6'd11) // SRA (11)
begin
ALUResult = B >>> SHAMT;
end

else if (ALUControl == 6'd12) // SRAV (12)
begin
ALUResult = B >>> A;
end

else if (ALUControl == 6'd13) // SRL (13)
begin
ALUResult = B >> SHAMT;
end

else if ( ALUControl == 6'd14) // SRLV (14)
begin
ALUResult = B >> A;
end

else if (ALUControl == 6'd15)	// ROTR (15)
begin
ALUResult = (B >> SHAMT) | (B << (32-SHAMT));
end

else if (ALUControl == 6'd16) // (16)
begin
ALUResult = (B >> A[4:0]) | (B << (32- A[4:0])); // ROTRV
end

else if (ALUControl == 6'd17) // XOR (17)
begin
ALUResult = A ^ B;
end

else if (ALUControl == 6'd18) // MUL (18)
begin
ALUResult = A * B;
end

else if (ALUControl == 6'd19) // MADD (19)
begin
temp1 = {HI, LO};
temp2 = $signed(A) * $signed(B);
temp1 = temp1 + temp2;
ALUResult2 = temp1[63:32];
ALUResult = temp1[31:0];
end

else if (ALUControl == 6'd20) // MSUB (20)
begin
temp1 = {HI, LO};
temp2 = $signed(A) * $signed(B);
temp1 = temp1 - temp2;
ALUResult2 = temp1[63:32];
ALUResult = temp1[31:0];
end

else if (ALUControl == 6'd21) // MULT (21)
begin
temp1 = $signed(A) * $signed(B);
ALUResult2 = temp1[63:32];
ALUResult = temp1[31:0];
end

else if (ALUControl == 6'd22) // MULTU (22)
begin
temp1 = {32'b0, A} * {32'b0,B};
ALUResult2 = temp1[63:32];
ALUResult = temp1[31:0];
end

else if (ALUControl == 6'd23) // SEB (23)
begin
if(B[7] == 1)
begin
ALUResult = {24'b111111111111111111111111, B[7:0]};
end
else
begin
ALUResult = {24'b000000000000000000000000, B[7:0]};
end
end

else if (ALUControl == 6'd24) // SEH (24)
begin
if(B[15] == 1)
begin
ALUResult = {16'b1111111111111111, B[15:0]};
end
else
begin
ALUResult = {16'b0000000000000000, B[15:0]};
end
end

else if (ALUControl == 6'd25) // ADDI (25)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd26)		// ANDI (26)
begin
ALUResult = A & B;
end

else if (ALUControl == 6'd27)		// ORI (27)
begin
ALUResult = (A|B);
end

else if (ALUControl == 6'd28)		// SLTI (28)
begin
if ($signed(A) < $signed(B))
begin
ALUResult = 32'd1;
end
else
begin
ALUResult = 32'd0;
end
end

else if (ALUControl == 6'd29)  // SLTIU (29)
begin
if (A < B)
begin
ALUResult = 32'd1;
end
else
begin
ALUResult = 32'd0;
end
end

else if (ALUControl == 6'd30) // XORI (30)
begin
ALUResult = A ^ B;
end

else if (ALUControl == 6'd31) // MOVZ (31)
begin
if(B == 32'd0)
begin
ALUResult = A;
EQFlag = 1;
end
else
begin
EQFlag = 0;
end
end

else if (ALUControl == 6'd32) // MOVN (32)
begin
if (B != 32'd0)
begin
ALUResult = A;
EQFlag = 0;
end
else
begin
EQFlag = 1;
end
end

else if (ALUControl == 6'd33) // MTHI (33)
begin
ALUResult2 = A;
end

else if (ALUControl == 6'd34) // MTLO (34)
begin
ALUResult = A;
end

else if (ALUControl == 6'd35) // MFHI (35)
begin
ALUResult = HI;
end

else if (ALUControl == 6'd36) // MFLO (36)
begin
ALUResult = LO;
end

else if (ALUControl == 6'd37) // CLO (37)
begin
if($signed(A) > 0)
begin
ALUResult = 32'd0;
end
else if(A[31:0] == 32'b11111111111111111111111111111111)
begin
ALUResult = 32'd32;
end
else if(A[31:1] == 31'b1111111111111111111111111111111)
begin
ALUResult = 32'd31;
end
else if(A[31:2] == 30'b111111111111111111111111111111)
begin
ALUResult = 32'd30;
end
else if(A[31:3] == 29'b11111111111111111111111111111)
begin
ALUResult = 32'd29;
end
else if(A[31:4] == 28'b1111111111111111111111111111)
begin
ALUResult = 32'd28;
end
else if(A[31:5] == 27'b111111111111111111111111111)
begin
ALUResult = 32'd27;
end
else if(A[31:6] == 26'b11111111111111111111111111)
begin
ALUResult = 32'd26;
end
else if(A[31:7] == 25'b1111111111111111111111111)
begin
ALUResult = 32'd25;
end
else if(A[31:8] == 24'b111111111111111111111111)
begin
ALUResult = 32'd24;
end
else if(A[31:9] == 23'b11111111111111111111111)
begin
ALUResult = 32'd23;
end
else if(A[31:10] == 22'b1111111111111111111111)
begin
ALUResult = 32'd22;
end
else if(A[31:11] == 21'b111111111111111111111)
begin
ALUResult = 32'd21;
end
else if(A[31:12] == 20'b11111111111111111111)
begin
ALUResult = 32'd20;
end
else if(A[31:13] == 19'b1111111111111111111)
begin
ALUResult = 32'd19;
end
else if(A[31:14] == 18'b111111111111111111)
begin
ALUResult = 32'd18;
end
else if(A[31:15] == 17'b11111111111111111)
begin
ALUResult = 32'd17;
end
else if(A[31:16] == 16'b1111111111111111)
begin
ALUResult = 32'd16;
end
else if(A[31:17] == 15'b111111111111111)
begin
ALUResult = 32'd15;
end
else if(A[31:18] == 14'b11111111111111)
begin
ALUResult = 32'd14;
end
else if(A[31:19] == 13'b1111111111111)
begin
ALUResult = 32'd13;
end
else if(A[31:20] == 12'b111111111111)
begin
ALUResult = 32'd12;
end
else if(A[31:21] == 11'b11111111111)
begin
ALUResult = 32'd11;
end
else if(A[31:22] == 10'b1111111111)
begin
ALUResult = 32'd10;
end
else if(A[31:23] == 9'b111111111)
begin
ALUResult = 32'd9;
end
else if(A[31:24] == 8'b11111111)
begin
ALUResult = 32'd8;
end
else if(A[31:25] == 7'b1111111)
begin
ALUResult = 32'd7;
end
else if(A[31:26] == 6'b111111)
begin
ALUResult = 32'd6;
end
else if(A[31:27] == 5'b11111)
begin
ALUResult = 32'd5;
end
else if(A[31:28] == 4'b1111)
begin
ALUResult = 32'd4;
end
else if(A[31:29] == 3'b111)
begin
ALUResult = 32'd3;
end
else if(A[31:30] == 2'b11)
begin
ALUResult = 32'd2;
end
else if(A[31] == 1'b1)
begin
ALUResult = 32'd1;
end
else if(A == 32'd0)
begin
ALUResult = 32'd0;
end
end

else if (ALUControl == 6'd38) // CLZ (38)
begin
if(A[31:0] == 32'b0)
begin
ALUResult = 32'h20;
end
else if(A[31:1] == 31'b0)
begin
ALUResult = 32'h1F;
end
else if(A[31:2] == 30'b0)
begin
ALUResult = 32'h1E;
end
else if(A[31:3] == 29'b0)
begin
ALUResult = 32'h1D;
end
else if(A[31:4] == 28'b0)
begin
ALUResult = 32'h1C;
end
else if(A[31:5] == 27'b0)
begin
ALUResult = 32'h1B;
end
else if(A[31:6] == 26'b0)
begin
ALUResult = 32'h1A;
end
else if(A[31:7] == 25'b0)
begin
ALUResult = 32'h19;
end
else if(A[31:8] == 24'b0)
begin
ALUResult = 32'h18;
end
else if(A[31:9] == 23'b0)
begin
ALUResult = 32'h17;
end
else if(A[31:10] == 22'b0)
begin
ALUResult = 32'h16;
end
else if(A[31:11] == 21'b0)
begin
ALUResult = 32'h15;
end
else if(A[31:12] == 20'b0)
begin
ALUResult = 32'h14;
end
else if(A[31:13] == 19'b0)
begin
ALUResult = 32'h13;
end
else if(A[31:14] == 18'b0)
begin
ALUResult = 32'h12;
end
else if(A[31:15] == 17'b0)
begin
ALUResult = 32'h11;
end
else if(A[31:16] == 16'b0)
begin
ALUResult = 32'h10;
end
else if(A[31:17] == 15'b0)
begin
ALUResult = 32'h0F;
end
else if(A[31:18] == 14'b0)
begin
ALUResult = 32'h0E;
end
else if(A[31:19] == 13'b0)
begin
ALUResult = 32'h0D;
end
else if(A[31:20] == 12'b0)
begin
ALUResult = 32'h0C;
end
else if(A[31:21] == 11'b0)
begin
ALUResult = 32'h0B;
end
else if(A[31:22] == 10'b0)
begin
ALUResult = 32'h0A;
end
else if(A[31:23] == 9'b0)
begin
ALUResult = 32'h09;
end
else if(A[31:24] == 8'b0)
begin
ALUResult = 32'h08;
end
else if(A[31:25] == 7'b0)
begin
ALUResult = 32'h07;
end
else if(A[31:26] == 6'b0)
begin
ALUResult = 32'h06;
end
else if(A[31:27] == 5'b0)
begin
ALUResult = 32'h05;
end
else if(A[31:28] == 4'b0)
begin
ALUResult = 32'h04;
end
else if(A[31:29] == 3'b0)
begin
ALUResult = 32'h03;
end
else if(A[31:30] == 2'b0)
begin
ALUResult = 32'h02;
end
else if(A[31] == 1'b0)
begin
ALUResult = 32'h01;
end
else if(A[31:0] == 32'hFFFF)
begin
ALUResult = 32'h0;
end
end


else if (ALUControl == 6'd45) // J (45)
begin
ALUResult = A;
end

else if (ALUControl == 6'd46) // JAL (46)
begin
ALUResult = A;
end

else if (ALUControl == 6'd47) // JR (47)
begin

end

else if (ALUControl == 6'd48) // LW (48)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd49) // SW (49)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd50) // LB (50)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd51) // LBU (51)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd52) // LH (52)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd53) // LHU (53)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd54) // LUI (54)
begin
ALUResult = {B[15:0],(16'h0000)};
end

else if (ALUControl == 6'd55) // SB (55)
begin
ALUResult = A + B;
end

else if (ALUControl == 6'd56) // SH (56)
begin
ALUResult = A + B;
end




end
endmodule
