`timescale 1ns / 1ps

//Control signeals that need to be forwarded to...
//MEM: MemWrite, MemRead, selMemWrite, MemtoReg, StoreP, LoadP, unSigned
//WB: selRegWrite

module EX_MEM(EX_MEM_ALUResultIn, EX_MEM_ReadData2In , EX_MEM_ALUResultOut, EX_MEM_ReadData2Out, Clk, EX_MEM_MemWriteIn, EX_MEM_MemReadIn, EX_MEM_selMemWriteIn, EX_MEM_MemtoRegIn, EX_MEM_StorePIn, EX_MEM_LoadPIn, EX_MEM_unSignedIn, EX_MEM_selRegWriteIn, EX_MEM_MemWriteOut, EX_MEM_MemReadOut, EX_MEM_selMemWriteOut, EX_MEM_MemtoRegOut, EX_MEM_StorePOut, EX_MEM_LoadPOut, EX_MEM_unSignedOut, EX_MEM_selRegWriteOut, EX_MEM_RegDstIn, EX_MEM_RegDstOut, EX_MEM_InstructionIn,EX_MEM_InstructionOut,EX_MEM_RegWriteMemIn,EX_MEM_RegWriteMemOut,EX_MEM_ImmediateIn,EX_MEM_ImmediateOut);

input Clk;
input [31:0] EX_MEM_ReadData2In, EX_MEM_ALUResultIn,EX_MEM_InstructionIn;
input  EX_MEM_MemWriteIn, EX_MEM_MemReadIn, EX_MEM_selMemWriteIn, EX_MEM_MemtoRegIn, EX_MEM_StorePIn, EX_MEM_LoadPIn, EX_MEM_unSignedIn, EX_MEM_selRegWriteIn, EX_MEM_RegDstIn,EX_MEM_RegWriteMemIn,EX_MEM_ImmediateIn;

output reg [31:0] EX_MEM_ReadData2Out, EX_MEM_ALUResultOut, EX_MEM_InstructionOut;
output reg EX_MEM_MemWriteOut, EX_MEM_MemReadOut, EX_MEM_selMemWriteOut, EX_MEM_MemtoRegOut, EX_MEM_StorePOut, EX_MEM_LoadPOut, EX_MEM_unSignedOut, EX_MEM_selRegWriteOut, EX_MEM_RegDstOut,EX_MEM_RegWriteMemOut,EX_MEM_ImmediateOut;

always @(posedge Clk)
begin

    EX_MEM_ALUResultOut <= EX_MEM_ALUResultIn; 
    EX_MEM_ReadData2Out <= EX_MEM_ReadData2In;
    EX_MEM_MemWriteOut <= EX_MEM_MemWriteIn;
    EX_MEM_MemReadOut <= EX_MEM_MemReadIn;
    EX_MEM_selMemWriteOut <= EX_MEM_selMemWriteIn;
    EX_MEM_MemtoRegOut <= EX_MEM_MemtoRegIn;
    EX_MEM_StorePOut <= EX_MEM_StorePIn;
    EX_MEM_LoadPOut <= EX_MEM_LoadPIn;
    EX_MEM_unSignedOut <= EX_MEM_unSignedIn;
    EX_MEM_selRegWriteOut <= EX_MEM_selRegWriteIn;
	 EX_MEM_InstructionOut <= EX_MEM_InstructionIn;
	 EX_MEM_RegDstOut <= EX_MEM_RegDstIn;
	 EX_MEM_RegWriteMemOut <= EX_MEM_RegWriteMemIn;
	 EX_MEM_ImmediateOut <= EX_MEM_ImmediateIn;	
end

endmodule
