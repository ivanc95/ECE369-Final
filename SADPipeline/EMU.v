`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:15 11/16/2015 
// Design Name: 
// Module Name:    EMU 
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
module EMU(Instruction26b, PCAddResult,mux_branch_out,SHAMT,ReadData1,ReadData2,out4,ALUResult,Jump,Branch,ALUSrc,HIWrite,LOWrite,selFlag,ALUControl,Clk,Reset,out7,EX_MEM_ALUResultOut, ForwardA, ForwardB,EX_ReadData2,EX_BranchJump);

input Jump,Branch,HIWrite,LOWrite,ALUSrc,Clk,Reset;
input [1:0] ForwardA, ForwardB;
input [2:0] selFlag;
input [5:0] ALUControl;
input[31:0] PCAddResult,ReadData1,ReadData2,out4,out7,EX_MEM_ALUResultOut;
input [25:0] Instruction26b;
input [4:0] SHAMT;
output [31:0] mux_branch_out,ALUResult,EX_ReadData2;
wire [27:0] out_SL2B;
wire [31:0] Add_Out,SL2_Out,out5,ALUResult2,HI,LO,out2,ForwardRSOut,ForwardRTOut;
wire GTFlag,LTFlag,EQFlag,flagOut;
output reg EX_BranchJump;

Mux1Bit5To1 mux_flag(.A(GTFlag), .B(LTFlag), .C(EQFlag), .D(~GTFlag), .E(~LTFlag), .Sel(selFlag), .Out(flagOut));

ALU_Add add(.A(PCAddResult),.B(SL2_Out),.Out(Add_Out));

Mux32Bit2To1 mux5(.out(out5),.inA(Add_Out),.inB(PCAddResult),.sel(Branch & flagOut)); 

Mux32Bit2To1 mux_branch(.out(mux_branch_out),.inA({PCAddResult[31:28],out_SL2B}),.inB(out5),.sel(Jump)); 

SL2Bits26to28 SL2_BRANCH(.in(Instruction26b),.out(out_SL2B));

HILOReg hilo(.inHigh(ALUResult2),.inLow(ALUResult),.HI(HI),.LO(LO),.HIWrite(HIWrite),.LOWrite(LOWrite),.Rst(Reset),.Clk(Clk)); //ALUResult may need to be declared as "wire" because it is an output.

//Mux32Bit2To1 mux2(.out(out2),.inA(out4),.inB(ReadData2), .sel(ALUSrc)); // 

Mux32Bit_3to1 ForwardRS(ReadData1,out7,EX_MEM_ALUResultOut,ForwardA,ForwardRSOut);

Mux32Bit_3to1 ForwardRT(ReadData2,out7,EX_MEM_ALUResultOut,ForwardB,ForwardRTOut);

Mux32Bit2To1 mux2(.out(out2),.inA(out4),.inB(ForwardRTOut), .sel(ALUSrc)); // 

ALU32Bit alu(.ALUControl(ALUControl), .A(ForwardRSOut), .B(out2), .HI(HI), .LO(LO), .ALUResult(ALUResult), .ALUResult2(ALUResult2), .GTFlag(GTFlag), .LTFlag(LTFlag),.EQFlag(EQFlag), .SHAMT(SHAMT)); 

SL2 sl2sl2(.in(out4),.out(SL2_Out));

assign EX_ReadData2 = ForwardRTOut;

always @(*)
begin
	EX_BranchJump <= ((Branch & flagOut) | Jump);
end





endmodule
