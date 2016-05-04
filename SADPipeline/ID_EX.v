`timescale 1ns / 1ps

//Control signeals that need to be forwarded to...
//EX: Jump, Branch, ALUSrc, selFlag(3-bit), ALUOp, HIWrite, LOWrite, ALUControl
//MEM: MemWrite, MemRead, selMemWrite, MemtoReg, StoreP, LoadP, unSigned
//WB: selRegWrite

module ID_EX(ID_EX_ReadData1In, ID_EX_ReadData2In, ID_EX_out4In, ID_EX_Instruction25to0In, ID_EX_Instruction10to6In, ID_EX_PCAddResultIn, ID_EX_ReadData1Out, ID_EX_ReadData2Out, ID_EX_out4Out, ID_EX_Instruction25to0Out, ID_EX_Instruction10to6Out, ID_EX_PCAddResultOut, Clk, ID_EX_JumpIn, ID_EX_BranchIn, ID_EX_ALUSrcIn, ID_EX_selFlagIn, ID_EX_MemWriteIn, ID_EX_MemReadIn, ID_EX_selMemWriteIn, ID_EX_MemtoRegIn, ID_EX_StorePIn, ID_EX_LoadPIn, ID_EX_unSignedIn, ID_EX_selRegWriteIn, ID_EX_JumpOut, ID_EX_BranchOut, ID_EX_ALUSrcOut, ID_EX_selFlagOut, ID_EX_MemWriteOut, ID_EX_MemReadOut, ID_EX_selMemWriteOut, ID_EX_MemtoRegOut, ID_EX_StorePOut, ID_EX_LoadPOut, ID_EX_unSignedOut, ID_EX_selRegWriteOut, ID_EX_ALUControlIn, ID_EX_ALUControlOut, ID_EX_HIWriteIn, ID_EX_HIWriteOut, ID_EX_LOWriteIn, ID_EX_LOWriteOut, ID_EX_RegDstIn, ID_EX_RegDstOut, ID_EX_InstructionIn,ID_EX_InstructionOut,ID_EX_RegWriteMemIn,ID_EX_RegWriteMemOut,ID_EX_ControlFlushIn,ID_EX_ImmediateIn,ID_EX_ImmediateOut);

input Clk,ID_EX_ControlFlushIn;
input  [31:0] ID_EX_ReadData1In, ID_EX_ReadData2In, ID_EX_out4In, ID_EX_PCAddResultIn,ID_EX_InstructionIn;
input  [5:0] ID_EX_ALUControlIn;
input  [4:0] ID_EX_Instruction10to6In;
input [25:0]ID_EX_Instruction25to0In;
input  [2:0] ID_EX_selFlagIn;
input ID_EX_JumpIn, ID_EX_BranchIn, ID_EX_ALUSrcIn, ID_EX_MemWriteIn, ID_EX_MemReadIn, ID_EX_selMemWriteIn, ID_EX_MemtoRegIn, ID_EX_StorePIn, ID_EX_LoadPIn, ID_EX_unSignedIn,ID_EX_selRegWriteIn, ID_EX_HIWriteIn, ID_EX_LOWriteIn,ID_EX_RegDstIn,ID_EX_RegWriteMemIn,ID_EX_ImmediateIn;

output reg [31:0] ID_EX_ReadData1Out, ID_EX_ReadData2Out, ID_EX_out4Out, ID_EX_PCAddResultOut, ID_EX_InstructionOut;
output reg [5:0] ID_EX_ALUControlOut;
output reg [4:0] ID_EX_Instruction10to6Out;
output reg [25:0]ID_EX_Instruction25to0Out; 
output reg [2:0] ID_EX_selFlagOut;
output reg ID_EX_JumpOut, ID_EX_BranchOut, ID_EX_ALUSrcOut, ID_EX_MemReadOut, ID_EX_MemtoRegOut, ID_EX_StorePOut, ID_EX_LoadPOut, ID_EX_unSignedOut, ID_EX_selRegWriteOut,ID_EX_selMemWriteOut,ID_EX_MemWriteOut,ID_EX_HIWriteOut,ID_EX_LOWriteOut,ID_EX_RegDstOut,ID_EX_RegWriteMemOut,ID_EX_ImmediateOut;

always @(posedge Clk)
begin
	if (ID_EX_ControlFlushIn)
	begin
    ID_EX_ReadData1Out = 0;
    ID_EX_ReadData2Out = 0;
    ID_EX_out4Out = 0;
    ID_EX_Instruction25to0Out = 0;
    ID_EX_Instruction10to6Out = 0;
    ID_EX_PCAddResultOut = 0;
    ID_EX_JumpOut = 0; 
    ID_EX_BranchOut = 0; 
    ID_EX_ALUSrcOut = 0; 
    ID_EX_selFlagOut = 0;
    ID_EX_MemWriteOut = 0;
    ID_EX_MemReadOut = 0;
    ID_EX_MemtoRegOut = 0;
    ID_EX_StorePOut = 0;
    ID_EX_LoadPOut = 0;
    ID_EX_unSignedOut = 0;
    ID_EX_selRegWriteOut = 0;
    ID_EX_ALUControlOut = 0;
	 ID_EX_selMemWriteOut = 0;
	 ID_EX_HIWriteOut = 0;
	 ID_EX_LOWriteOut = 0;
	 ID_EX_RegDstOut = 0;
	 ID_EX_InstructionOut = 0;
	 ID_EX_RegWriteMemOut = 0;
	 ID_EX_ImmediateOut = 0;
    end
	 else
	 begin
	 ID_EX_ReadData1Out = ID_EX_ReadData1In;
    ID_EX_ReadData2Out = ID_EX_ReadData2In;
    ID_EX_out4Out = ID_EX_out4In;
    ID_EX_Instruction25to0Out = ID_EX_Instruction25to0In;
    ID_EX_Instruction10to6Out = ID_EX_Instruction10to6In;
    ID_EX_PCAddResultOut = ID_EX_PCAddResultIn;
    ID_EX_JumpOut = ID_EX_JumpIn; 
    ID_EX_BranchOut = ID_EX_BranchIn; 
    ID_EX_ALUSrcOut = ID_EX_ALUSrcIn; 
    ID_EX_selFlagOut = ID_EX_selFlagIn;
    ID_EX_MemWriteOut = ID_EX_MemWriteIn;
    ID_EX_MemReadOut = ID_EX_MemReadIn;
    ID_EX_MemtoRegOut = ID_EX_MemtoRegIn;
    ID_EX_StorePOut = ID_EX_StorePIn;
    ID_EX_LoadPOut = ID_EX_LoadPIn;
    ID_EX_unSignedOut = ID_EX_unSignedIn;
    ID_EX_selRegWriteOut = ID_EX_selRegWriteIn;
    ID_EX_ALUControlOut = ID_EX_ALUControlIn;
	 ID_EX_selMemWriteOut = ID_EX_selMemWriteIn;
	 ID_EX_HIWriteOut = ID_EX_HIWriteIn;
	 ID_EX_LOWriteOut = ID_EX_LOWriteIn;
	 ID_EX_RegDstOut = ID_EX_RegDstIn;
	 ID_EX_InstructionOut = ID_EX_InstructionIn;
	 ID_EX_RegWriteMemOut = ID_EX_RegWriteMemIn;
	 ID_EX_ImmediateOut = ID_EX_ImmediateIn;
	 end
end

endmodule
