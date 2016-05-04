`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:26 11/16/2015 
// Design Name: 
// Module Name:    MWU 
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
module MWU(ReadData2,ALUResult,lpOut,out3,Clk,MemWrite,MemRead,selMemWrite,MemtoReg,StoreP,LoadP,unSigned);

input [31:0] ReadData2,ALUResult;
input Clk,MemWrite,MemRead,selMemWrite,MemtoReg,StoreP,LoadP,unSigned;
output [31:0] lpOut,out3;
wire [31:0] ReadData,out6,toMEM;

DataMemory datamemory(.Address(ALUResult), .WriteData(out6), .Clk(Clk), .MemWrite(MemWrite), .MemRead(MemRead), .ReadData(ReadData)); // Resolve MemWrite, MemRead,

StorePartial SP(.rt(ReadData2), .frmMEM(ReadData), .toMEM(toMEM), .Ctrl(StoreP), .Address(ALUResult));// Resolve StoreP

LoadPartial LP(.frmMEM(ReadData), .out(lpOut), .Ctrl(LoadP), .unSigned(unSigned)); // Resolve LoadP, unSigned

Mux32Bit2To1 mux6(.out(out6), .inA(toMEM),.inB(ReadData2), .sel(selMemWrite)); // Resolve selMemWrite

Mux32Bit2To1 mux3(.out(out3), .inA(ReadData),.inB(ALUResult), .sel(MemtoReg)); // Resolve MemtoReg

endmodule
