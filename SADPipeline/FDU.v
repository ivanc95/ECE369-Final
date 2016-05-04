`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//											FETCH DECODE UNIT
//////////////////////////////////////////////////////////////////////////////////
module FDU(Instruction,RSOut,RTOut,out4,out7,Clk,PCAddResult,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,StoreP,LoadP,unSigned,selMemWrite,selRegWrite,Jump,sel_JR,HIWrite,LOWrite,ALUControl,o1,o2,o3,o4,selFlag,Instruction26b,SHAMT,RegDst,RegDstMem,InstructionMem, RegWriteMem, RegWrite, MemReadMem,immediate);

input [31:0] Instruction,out7,PCAddResult,InstructionMem;
output [31:0] RSOut,RTOut,out4,o1,o2,o3,o4;
wire [4:0] out1;
wire [31:0] outSE,outZE,RSOut,RTOut,ReadData1,ReadData2;
input Clk, RegDstMem, RegWriteMem,MemReadMem;


wire [3:0] ALUOp;
wire ZE,ra_write,RSControl,RTControl;
wire tRegistersWrite,TRCWrite;
wire [255:0] tRegistersOut,tRegistersIn;


output Branch,MemtoReg,MemWrite,ALUSrc,StoreP,LoadP,unSigned,selMemWrite,selRegWrite,Jump,sel_JR,HIWrite,LOWrite, RegDst, RegWrite,MemRead,immediate;
output [5:0] ALUControl;
output [2:0] selFlag;
output [25:0] Instruction26b;
output [4:0] SHAMT;

Control control(.OPCode(Instruction[31:26]),.RegDst(RegDst), .Branch(Branch), .MemRead(MemRead),.MemtoReg(MemtoReg), .ALUOp(ALUOp),  .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite), .StoreP(StoreP), .LoadP(LoadP), .unSigned(unSigned), .selMemWrite(selMemWrite), .selRegWrite(selRegWrite), .selFlag(selFlag), .Jump(Jump),.ra_write(ra_write),.RT_control(Instruction[20:16]),.tRegistersWrite(tRegistersWrite),.TRCWrite(TRCWrite)); 

ALUControl alucontrol(.ALUOp(ALUOp),.instruction(Instruction[5:0]),.alucontrol(ALUControl),.HIWrite(HIWrite),.LOWrite(LOWrite),.SHAMT(Instruction[10:6]),.RS(Instruction[25:21]), .RT(Instruction[20:16]),.ZE(ZE), .sel_JR(sel_JR),.immediate(immediate)); 

Mux5Bits2to1 mux1(.out(out1), .inA(InstructionMem[20:16]), .inB(InstructionMem[15:11]), .sel(RegDstMem));

REG_FILE registers(.Clk(Clk),.ReadRegister1(Instruction[25:21]), .ReadRegister2(Instruction[20:16]), .WriteRegister(out1), .WriteData(out7), .RegWrite(RegWriteMem),.ReadData1(ReadData1), .ReadData2(ReadData2), .o1(o1),.o2(o2),.o3(o3),.o4(o4),.ra_write(ra_write),.RA(PCAddResult),.tRegistersOut(tRegistersOut),.tRegistersIn(tRegistersIn),.TRCWrite(TRCWrite));

SignExtension signextend(.in(Instruction[15:0]), .out(outSE));

zeroextend zeroExt(.in(Instruction[15:0]), .out(outZE));

Mux32Bit2To1 mux4(.out(out4), .inA(outZE),.inB(outSE), .sel(ZE));

tRegisterCache TRC(.tRegistersIn(tRegistersIn), .tRegistersOut(tRegistersOut), .tRegistersWrite(tRegistersWrite), .Clk(Clk));

//out1 is destination register
decodeLogic decodeForward(.out1(out1), .MEM_WB_MemReadOut(MemReadMem), .MEM_WB_RegWriteMemOut(RegWriteMem), .IF_ID_RS(Instruction[25:21]), .IF_ID_RT(Instruction[20:16]), .RSControl(RSControl), .RTControl(RTControl));

Mux32Bit2To1 muxRS(.out(RSOut),.inA(out7),.inB(ReadData1),.sel(RSControl));

Mux32Bit2To1 muxRT(.out(RTOut),.inA(out7),.inB(ReadData2),.sel(RTControl));

assign Instruction26b = Instruction[25:0];
assign SHAMT = Instruction[10:6];
endmodule
