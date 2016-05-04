`timescale 1ns / 1ps

//Control signeals that need to be forwarded to...
//WB: selRegWrite

module MEM_WB(MEM_WB_lpOutIn, MEM_WB_out3In,MEM_WB_lpOutOut, MEM_WB_out3Out,Clk, MEM_WB_selRegWriteIn, MEM_WB_selRegWriteOut, MEM_WB_RegDstIn, MEM_WB_RegDstOut, MEM_WB_InstructionIn,MEM_WB_InstructionOut,MEM_WB_RegWriteMemIn,MEM_WB_RegWriteMemOut,MEM_WB_MemReadIn,MEM_WB_MemReadOut,MEM_WB_ImmediateIn,MEM_WB_ImmediateOut);

input  Clk, MEM_WB_selRegWriteIn, MEM_WB_RegDstIn,MEM_WB_RegWriteMemIn,MEM_WB_MemReadIn,MEM_WB_ImmediateIn;

input  [31:0] MEM_WB_lpOutIn, MEM_WB_out3In, MEM_WB_InstructionIn;

output reg MEM_WB_selRegWriteOut, MEM_WB_RegDstOut,MEM_WB_RegWriteMemOut,MEM_WB_MemReadOut,MEM_WB_ImmediateOut;

output reg [31:0] MEM_WB_lpOutOut, MEM_WB_out3Out, MEM_WB_InstructionOut;



always @(posedge Clk)
begin

    MEM_WB_lpOutOut <= MEM_WB_lpOutIn; 
    MEM_WB_out3Out <= MEM_WB_out3In;
    MEM_WB_selRegWriteOut <= MEM_WB_selRegWriteIn;
	 MEM_WB_RegDstOut <= MEM_WB_RegDstIn;
	 MEM_WB_InstructionOut <= MEM_WB_InstructionIn;
	 MEM_WB_RegWriteMemOut <= MEM_WB_RegWriteMemIn;
	 MEM_WB_MemReadOut <= MEM_WB_MemReadIn;
	 MEM_WB_ImmediateOut <= MEM_WB_ImmediateIn;
	 
end

endmodule
