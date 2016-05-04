`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////
// CLOCK DEPENDENT, IF ENABLE IS HIGH OUTPUT THE INSTRUCTION OTHERWISE SAVE IT. //
//////////////////////////////////////////////////////////////////////////////////////

// Enable comes from "IF/ID.Write" output in Hazard module
module IF_ID(IF_ID_InstructionIn,IF_ID_PCAddResultIn,IF_ID_InstructionOut,IF_ID_PCAddResultOut,Clk,IF_ID_Write,IF_Flush);

input [31:0] IF_ID_InstructionIn, IF_ID_PCAddResultIn;
output reg [31:0] IF_ID_InstructionOut, IF_ID_PCAddResultOut;
input Clk,IF_ID_Write,IF_Flush;

always @(posedge Clk)
begin

		if (IF_Flush == 1)
		begin
			IF_ID_InstructionOut <= 32'd0; //Output goes to all "Instruction" inputs in Datapath
			IF_ID_PCAddResultOut <= 32'd0;
		end


		else if (IF_ID_Write == 1)
		begin
        IF_ID_InstructionOut <= IF_ID_InstructionIn; //Output goes to all "Instruction" inputs in Datapath
        IF_ID_PCAddResultOut <= IF_ID_PCAddResultIn;
      end  
		else if (IF_ID_Write == 0)
		begin
		  IF_ID_InstructionOut <= IF_ID_InstructionOut;
		  IF_ID_PCAddResultOut <= IF_ID_PCAddResultOut;
		end
		else
		begin
			IF_ID_InstructionOut <= 32'd0; //Output goes to all "Instruction" inputs in Datapath
			IF_ID_PCAddResultOut <= 32'd0;
		end
		  
end

endmodule
