`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 1 
// Name: Jonathan Avila Ivan Cordoba 50/50
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  
// Create a 1K memory, for which we need 10 bits.  In order to  implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address
	 input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 		// Control signal for memory read 

    output reg[31:0] ReadData; // Contents of memory location at Address
	 reg [31:0] memory[0:4135];
	 reg [31:0] temp;
initial 
begin
$readmemh("outputweds_data.txt",memory);
end
	
	always @(posedge Clk)
	begin
	
		if (MemWrite == 1)
			begin
				memory[Address[31:2]] = WriteData;
			end
	end
	
	always @(negedge Clk)
	begin
			if (MemRead == 1)
			begin
				ReadData = memory[Address[31:2]];
			end
		
	end


endmodule
