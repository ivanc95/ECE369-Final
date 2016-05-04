`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 1
// Module - SignExtension.v
// Description - Sign extension module.
//Ivan Cordoba
//
////////////////////////////////////////////////////////////////////////////////
module zeroextend(in, out);

    /* A 16-Bit input word */
    input [15:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;
    
    /* Fill in the implementation here ... */
	 always @ (*)
	 begin
	 
	 out = {16'b0000000000000000, in};
	 
	 end
	 

endmodule