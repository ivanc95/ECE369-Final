`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//								  INSTRUCTION FETCH UNIT
//////////////////////////////////////////////////////////////////////////////////
module IFU(PCAddResult,mux_branch_out,Reset,Clk,ReadData1,sel_JR,Instruction,Branch_signal,PCWrite);


input [31:0] mux_branch_out,ReadData1;

output [31:0] PCAddResult,Instruction;
input Reset,Clk,sel_JR,PCWrite,Branch_signal;
wire [31:0] out;

PCAdder PCAddr(.PCResult(out),.PCAddResult(PCAddResult));

ProgramCounter ProgCntr(.Address(mux_branch_out),.PCResult(out),.Reset(Reset),.Clk(Clk), .inRA(ReadData1), .sel(sel_JR),.Address2(PCAddResult), .Branch_signal(Branch_signal),.PCWrite(PCWrite));

InstructionMemory InstrMem(out,Instruction);



endmodule
