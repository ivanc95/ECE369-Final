`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
//Engineers: Ivan Cordoba & Jonathan Avila
//Effort: 50/50
 //////////////////////////// FOR R TYPE INSTRUCTIONS//////////////////////////////
// wire [5:0] op;      InstructionOut[31:26]
// wire [4:0] rs;      InstructionOut[25:21]
// wire [4:0] rt;      InstructionOut[20:16]
// wire [15:11] rd;    InstructionOut[15:11]
// wire [10:6] shamt;  InstructionOut[10:6]
// wire [5:0] funct;   InstructionOut[5:0]
//////////////////////////////////////////////////////////////////////////////////
module Datapath(Clk,Reset, o1,o2,o3,o4);
input Clk,Reset;
output [31:0]  o1,o2,o3,o4;


//IF_ID_Buffer Wires
wire [31:0] IF_ID_PCAddResultIn;
wire [31:0] PCAdd4Out,mux_branch_out;
wire [25:0] Instruction26b;
wire [4:0] SHAMT;

//ID_EX_Buffer wires
wire [31:0] ID_EX_out4In, InstructionIn;
wire [5:0] ID_EX_ALUControlIn;
wire [2:0] ID_EX_selFlagIn;
wire ID_EX_JumpIn, ID_EX_BranchIn, ID_EX_ALUSrcIn, ID_EX_MemWriteIn, ID_EX_MemReadIn, ID_EX_selMemWriteIn, ID_EX_MemtoRegIn, ID_EX_StorePIn, ID_EX_LoadPIn, ID_EX_unSignedIn, ID_EX_HIWriteIn,ID_EX_LOWriteIn;

wire [31:0] ID_EX_ReadData1Out, ID_EX_ReadData2Out, ID_EX_out4Out, ID_EX_PCAddResultOut, InstructionOut,ID_EX_InstructionOut;
wire [5:0] ID_EX_ALUControlOut;
wire [4:0] ID_EX_Instruction10to6Out;
wire [25:0] ID_EX_Instruction25to0Out;
wire [2:0] ID_EX_selFlagOut;
wire ID_EX_JumpOut, ID_EX_BranchOut, ID_EX_ALUSrcOut, ID_EX_MemReadOut, ID_EX_MemtoRegOut, ID_EX_StorePOut, ID_EX_LoadPOut, ID_EX_unSignedOut, ID_EX_selRegWriteOut, ID_EX_HIWriteOut,ID_EX_LOWriteOut,ID_EX_RegDstOut,ID_EX_RegWriteMemOut;


//EX_MEM_Buffer wires
wire [31:0] EX_MEM_ReadData2Out, EX_MEM_ALUResultOut,EX_MEM_InstructionOut;
wire EX_MEM_MemWriteOut, EX_MEM_MemReadOut, EX_MEM_selMemWriteOut, EX_MEM_MemtoRegOut, EX_MEM_StorePOut, EX_MEM_LoadPOut, EX_MEM_unSignedOut, EX_MEM_selRegWriteOut,EX_MEM_RegDstOut,EX_MEM_RegWriteMemOut;

//MEM_WB_Buffer Wires
wire  Clk,immediate,MEM_WB_ImmediateOut,ID_EX_ImmediateOut,EX_MEM_ImmediateOut,EX_BranchJump,HZ_BranchJump;

wire  [31:0] MEM_WB_lpOutIn, MEM_WB_out3In,EX_ReadData2;

wire MEM_WB_selRegWriteOut, MEM_WB_RegDstOut, RegWriteMem, MEM_WB_RegWriteMemOut;

wire [31:0] MEM_WB_lpOutOut, MEM_WB_out3Out, MEM_WB_InstructionOut;

wire [31:0] ReadData1,ReadData2, out7,ALUResult;

wire ControlFlush,IF_ID_Write;

wire sel_JR,IF_Flush;

// Forwarding Signals for E & M units
wire [1:0] ForwardA,ForwardB;


//////////////////////////
//			Fetch				//
//////////////////////////

IFU RED(.PCAddResult(IF_ID_PCAddResultIn),
.mux_branch_out(mux_branch_out),
.Reset(Reset),
.Clk(Clk),
.ReadData1(ReadData1),
.sel_JR(sel_JR),
.Instruction(InstructionIn),
.Branch_signal(HZ_BranchJump),
.PCWrite(PCWrite)
);




/////////////////////////////
//			FORWARDING			//
/////////////////////////////

forward forwarding(
.EX_MEM_RegisterRd(EX_MEM_InstructionOut[15:11]), 
.ID_EX_RegisterRs(ID_EX_InstructionOut[25:21]), 
.ID_EX_RegisterRt(ID_EX_InstructionOut[20:16]),
 .MEM_WB_RegisterRd(MEM_WB_InstructionOut[15:11]), 
 .EX_MEM_RegWrite(EX_MEM_RegWriteMemOut),
 .MEM_WB_RegWrite(MEM_WB_RegWriteMemOut),
 .ForwardA(ForwardA),
 .ForwardB(ForwardB),
 .MEM_WB_MemReadOut(MEM_WB_MemReadOut),
 .MEM_WB_RegisterRt(MEM_WB_InstructionOut[20:16]),
 .EX_MEM_immediate(EX_MEM_ImmediateOut),
 .EX_MEM_RegisterRt(EX_MEM_InstructionOut[20:16]),
 .MEM_WB_immediate(MEM_WB_ImmediateOut),
 .ID_EX_immediate(ID_EX_ImmediateOut)
 );
 
 

///////////////////////////////////
// 		HAZARD DETECTION 			//
///////////////////////////////////

hazard hazarding(.IF_ID_RegisterRs(InstructionOut[25:21]), 
.IF_ID_RegisterRt(InstructionOut[20:16]), 
.ID_EX_MemRead(ID_EX_MemReadOut), 
.ControlFlush(ControlFlush), 
.IF_ID_Write(IF_ID_Write),
 .PCWrite(PCWrite),
 .ID_EX_RegisterRt(ID_EX_InstructionOut[20:16]),
 .ID_immediate(immediate),
 .ID_EX_immediate(ID_EX_ImmediateOut),
 .EX_BranchJump(EX_BranchJump),
 .HZ_BranchJump(HZ_BranchJump),
 .IF_Flush(IF_Flush)
 );


///////////////////////
//			IF_ID			//
///////////////////////

IF_ID IFBUFFER(.IF_ID_InstructionIn(InstructionIn),
.IF_ID_PCAddResultIn(IF_ID_PCAddResultIn),
.IF_ID_InstructionOut(InstructionOut),
.IF_ID_PCAddResultOut(PCAdd4Out),
.Clk(Clk),
.IF_ID_Write(IF_ID_Write),
.IF_Flush(IF_Flush)
);


//////////////////////////
//			Decode			//
//////////////////////////

FDU BLUE(.Instruction(InstructionOut),
.RSOut(ReadData1),
.RTOut(ReadData2),
.out4(ID_EX_out4In),
.out7(out7),
.Clk(Clk),
.PCAddResult(PCAdd4Out),
.Branch(ID_EX_BranchIn),
.MemRead(ID_EX_MemReadIn),
.MemtoReg(ID_EX_MemtoRegIn),
.MemWrite(ID_EX_MemWriteIn),
.ALUSrc(ID_EX_ALUSrcIn),
.StoreP(ID_EX_StorePIn),
.LoadP(ID_EX_LoadPIn),
.unSigned(ID_EX_unSignedIn),
.selMemWrite(ID_EX_selMemWriteIn),
.selRegWrite(ID_EX_selRegWriteIn),
.Jump(ID_EX_JumpIn),
.sel_JR(sel_JR),
.HIWrite(ID_EX_HIWriteIn),
.LOWrite(ID_EX_LOWriteIn),
.ALUControl(ID_EX_ALUControlIn),
.o1(o1),
.o2(o2),
.o3(o3),
.o4(o4),
.selFlag(ID_EX_selFlagIn),
.Instruction26b(Instruction26b),
.SHAMT(SHAMT),
.RegDst(RegDst),
.RegDstMem(MEM_WB_RegDstOut),
.InstructionMem(MEM_WB_InstructionOut),
.RegWriteMem(MEM_WB_RegWriteMemOut),
.RegWrite(RegWriteMem),
.MemReadMem(MEM_WB_MemReadOut),
.immediate(immediate)
);


///////////////////////
//			ID_EX			//
///////////////////////


ID_EX IDBUFFER(.ID_EX_ReadData1In(ReadData1), 
.ID_EX_ReadData2In(ReadData2), 
.ID_EX_out4In(ID_EX_out4In), 
.ID_EX_Instruction25to0In(Instruction26b),
 .ID_EX_Instruction10to6In(SHAMT), 
 .ID_EX_PCAddResultIn(PCAdd4Out), 
 .ID_EX_ReadData1Out(ID_EX_ReadData1Out), 
 .ID_EX_ReadData2Out(ID_EX_ReadData2Out), 
 .ID_EX_out4Out(ID_EX_out4Out), 
 .ID_EX_Instruction25to0Out(ID_EX_Instruction25to0Out), 
 .ID_EX_Instruction10to6Out(ID_EX_Instruction10to6Out), 
 .ID_EX_PCAddResultOut(ID_EX_PCAddResultOut), 
 .Clk(Clk), 
 .ID_EX_JumpIn(ID_EX_JumpIn), 
 .ID_EX_BranchIn(ID_EX_BranchIn), 
 .ID_EX_ALUSrcIn(ID_EX_ALUSrcIn), 
 .ID_EX_selFlagIn(ID_EX_selFlagIn), 
 .ID_EX_MemWriteIn(ID_EX_MemWriteIn), 
 .ID_EX_MemReadIn(ID_EX_MemReadIn), 
 .ID_EX_selMemWriteIn(ID_EX_selMemWriteIn), 
 .ID_EX_MemtoRegIn(ID_EX_MemtoRegIn), 
 .ID_EX_StorePIn(ID_EX_StorePIn), 
 .ID_EX_LoadPIn(ID_EX_LoadPIn), 
 .ID_EX_unSignedIn(ID_EX_unSignedIn), 
 .ID_EX_selRegWriteIn(ID_EX_selRegWriteIn),
 .ID_EX_JumpOut(ID_EX_JumpOut), 
 .ID_EX_BranchOut(ID_EX_BranchOut), 
 .ID_EX_ALUSrcOut(ID_EX_ALUSrcOut), 
 .ID_EX_selFlagOut(ID_EX_selFlagOut), 
 .ID_EX_MemWriteOut(ID_EX_MemWriteOut), 
 .ID_EX_MemReadOut(ID_EX_MemReadOut), 
 .ID_EX_selMemWriteOut(ID_EX_selMemWriteOut),
 .ID_EX_MemtoRegOut(ID_EX_MemtoRegOut),
 .ID_EX_StorePOut(ID_EX_StorePOut),
 .ID_EX_LoadPOut(ID_EX_LoadPOut),
 .ID_EX_unSignedOut(ID_EX_unSignedOut),
 .ID_EX_selRegWriteOut(ID_EX_selRegWriteOut),
 .ID_EX_ALUControlIn(ID_EX_ALUControlIn),
 .ID_EX_ALUControlOut(ID_EX_ALUControlOut),
 .ID_EX_HIWriteIn(ID_EX_HIWriteIn),
 .ID_EX_HIWriteOut(ID_EX_HIWriteOut), 
 .ID_EX_LOWriteIn(ID_EX_LOWriteIn),
 .ID_EX_LOWriteOut(ID_EX_LOWriteOut),
 .ID_EX_RegDstIn(RegDst),
 .ID_EX_RegDstOut(ID_EX_RegDstOut),
 .ID_EX_InstructionIn(InstructionOut),
 .ID_EX_InstructionOut(ID_EX_InstructionOut),
 .ID_EX_RegWriteMemIn(RegWriteMem),
 .ID_EX_RegWriteMemOut(ID_EX_RegWriteMemOut),
 .ID_EX_ControlFlushIn(ControlFlush),
 .ID_EX_ImmediateIn(immediate),
 .ID_EX_ImmediateOut(ID_EX_ImmediateOut)
 );
 

//////////////////////////
//			Execute			//
//////////////////////////

 
EMU GREEN(.Instruction26b(ID_EX_Instruction25to0Out),
 .PCAddResult(ID_EX_PCAddResultOut),
 .mux_branch_out(mux_branch_out),
 .SHAMT(ID_EX_Instruction10to6Out),
 .ReadData1(ID_EX_ReadData1Out),
 .ReadData2(ID_EX_ReadData2Out),
 .out4(ID_EX_out4Out),
 .ALUResult(ALUResult),
 .Jump(ID_EX_JumpOut),
 .Branch(ID_EX_BranchOut),
 .ALUSrc(ID_EX_ALUSrcOut),
 .HIWrite(ID_EX_HIWriteOut),
 .LOWrite(ID_EX_LOWriteOut),
 .selFlag(ID_EX_selFlagOut),
 .ALUControl(ID_EX_ALUControlOut),
 .Clk(Clk),
 .Reset(Reset),
 .out7(out7),
 .EX_MEM_ALUResultOut(EX_MEM_ALUResultOut),
 .ForwardA(ForwardA),
 .ForwardB(ForwardB),
 .EX_ReadData2(EX_ReadData2),
 .EX_BranchJump(EX_BranchJump)
 ); 
 
 
 
//////////////////////////
//			EX_MEM			//
//////////////////////////
 
EX_MEM EXBUFFER(.EX_MEM_ALUResultIn(ALUResult),
 .EX_MEM_ReadData2In(EX_ReadData2) , 
 .EX_MEM_ALUResultOut(EX_MEM_ALUResultOut), 
 .EX_MEM_ReadData2Out(EX_MEM_ReadData2Out), 
 .Clk(Clk), 
 .EX_MEM_MemWriteIn(ID_EX_MemWriteOut),
 .EX_MEM_MemReadIn(ID_EX_MemReadOut), 
 .EX_MEM_selMemWriteIn(ID_EX_selMemWriteOut), 
 .EX_MEM_MemtoRegIn(ID_EX_MemtoRegOut), 
 .EX_MEM_StorePIn(ID_EX_StorePOut), 
 .EX_MEM_LoadPIn(ID_EX_LoadPOut), 
 .EX_MEM_unSignedIn(ID_EX_unSignedOut), 
 .EX_MEM_selRegWriteIn(ID_EX_selRegWriteOut), 
 .EX_MEM_MemWriteOut(EX_MEM_MemWriteOut), 
 .EX_MEM_MemReadOut(EX_MEM_MemReadOut),
 .EX_MEM_selMemWriteOut(EX_MEM_selMemWriteOut), 
 .EX_MEM_MemtoRegOut(EX_MEM_MemtoRegOut), 
 .EX_MEM_StorePOut(EX_MEM_StorePOut), 
 .EX_MEM_LoadPOut(EX_MEM_LoadPOut), 
 .EX_MEM_unSignedOut(EX_MEM_unSignedOut),
 .EX_MEM_selRegWriteOut(EX_MEM_selRegWriteOut),
 .EX_MEM_RegDstIn(ID_EX_RegDstOut),
 .EX_MEM_RegDstOut(EX_MEM_RegDstOut),
 .EX_MEM_InstructionIn(ID_EX_InstructionOut),
 .EX_MEM_InstructionOut(EX_MEM_InstructionOut),
 .EX_MEM_RegWriteMemIn(ID_EX_RegWriteMemOut),
 .EX_MEM_RegWriteMemOut(EX_MEM_RegWriteMemOut),
 .EX_MEM_ImmediateIn(ID_EX_ImmediateOut),
 .EX_MEM_ImmediateOut(EX_MEM_ImmediateOut)
 );



//////////////////////////
//			Memory			//
//////////////////////////
 
 
MWU ORANGE(.ReadData2(EX_MEM_ReadData2Out),
.ALUResult(EX_MEM_ALUResultOut),
.lpOut(MEM_WB_lpOutIn),
.out3(MEM_WB_out3In),
.Clk(Clk),
.MemWrite(EX_MEM_MemWriteOut),
.MemRead(EX_MEM_MemReadOut),
.selMemWrite(EX_MEM_selMemWriteOut),
.MemtoReg(EX_MEM_MemtoRegOut),
.StoreP(EX_MEM_StorePOut),
.LoadP(EX_MEM_LoadPOut),
.unSigned(EX_MEM_unSignedOut)
);


//////////////////////////
//			MEM_WB			//
//////////////////////////



MEM_WB MEMBUFFER(.MEM_WB_lpOutIn(MEM_WB_lpOutIn), 
 .MEM_WB_out3In(MEM_WB_out3In), 
 .MEM_WB_lpOutOut(MEM_WB_lpOutOut), 
 .MEM_WB_out3Out(MEM_WB_out3Out),
 .Clk(Clk), 
 .MEM_WB_selRegWriteIn(EX_MEM_selRegWriteOut), 
 .MEM_WB_selRegWriteOut(MEM_WB_selRegWriteOut),
 .MEM_WB_RegDstIn(EX_MEM_RegDstOut),
 .MEM_WB_RegDstOut(MEM_WB_RegDstOut),
 .MEM_WB_InstructionIn(EX_MEM_InstructionOut),
 .MEM_WB_InstructionOut(MEM_WB_InstructionOut),
 .MEM_WB_RegWriteMemIn(EX_MEM_RegWriteMemOut),
 .MEM_WB_RegWriteMemOut(MEM_WB_RegWriteMemOut),
 .MEM_WB_MemReadIn(EX_MEM_MemReadOut),
 .MEM_WB_MemReadOut(MEM_WB_MemReadOut),
 .MEM_WB_ImmediateIn(EX_MEM_ImmediateOut),
 .MEM_WB_ImmediateOut(MEM_WB_ImmediateOut)
);


/////////////////////////////
//			Write Back			//
/////////////////////////////


Mux32Bit2To1 mux7(.out(out7), 
.inA(MEM_WB_lpOutOut),
.inB(MEM_WB_out3Out), 
.sel(MEM_WB_selRegWriteOut)
);



endmodule
