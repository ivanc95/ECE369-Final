`timescale 1ns / 1ps
module tRegisterCache(tRegistersIn, tRegistersOut, tRegistersWrite, Clk);

	 input [255:0] tRegistersIn;
    input tRegistersWrite, Clk;
    output reg [255:0] tRegistersOut; 
	 
	 
    always @(posedge Clk)
    begin
    
        if(tRegistersWrite == 1)
        begin
            tRegistersOut <= tRegistersIn;
        end
    end
	 
endmodule
//////////////////////////////////////////////////////////////////////////////////////
//Instructions:                                                                     //
//ltr    11111100000000000000000000000000   //Load t-Registers                      //
//str    11111000000000000000000000000000   //Store t-Registers                     //
//Registers t0-t7                                                                   //
//////////////////////////////////////////////////////////////////////////////////////
//How to implement:                                                                 //
//  -Create a wire with similar format as "tRegistersIn" in the Decode module       //
//   going from tRegisterCache(output/"tRegistersOut") to Registers(input).         //
//                                                                                  //
//  -Create a case in Control to detect the OPCode for lsr and ssr                  //
//   Instructions. Create signal "ltr" in Control to go                             //
//   high whenever ltr Instruction is detected. Create signal "str" in Control      // 
//   to go high whenever str Instruction is detected.                               //
//                                                                                  //
//  -Create a 1-bit wire "ltr" from Control(output/"ltr")                           //
//   to Registers(input). When high, will write to t-Registers.                     //
//                                                                                  //
//  -Create logic within Registers that will write the values of t from the         //
//   new input wire into corresponding t-registers in the register file             //
//                                                                                  //
//        if(ltr){                                                                  //
//          RegisterFile[8:15] <= tRegistersOut;                                    //
//      }                                                                           //
//                                                                                  //
//  add this into posedge Clk part of Registers module.                             //
//                                                                                  //
//  -Create a 1-bit wire "str" from Control(output/"str")                           //
//   to tRegisterCache(input/"tRegistersWrite"). When high, will write into cache.  //
//                                                                                  //
//  -Logic is already contained in here to deal with changing on Clock edge.        //
//////////////////////////////////////////////////////////////////////////////////////
