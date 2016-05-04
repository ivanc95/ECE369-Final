`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module ALUControl(ALUOp,instruction,alucontrol,HIWrite,LOWrite,SHAMT,RS,RT,ZE,sel_JR,immediate);

output reg HIWrite,LOWrite,ZE,sel_JR,immediate;
input [5:0] instruction;
output reg[5:0] alucontrol;
input [3:0] ALUOp;
input [4:0] SHAMT,RS,RT;


		always @(instruction,ALUOp,SHAMT,RS,RT)
		begin
			ZE = 0;
			HIWrite = 0;
			LOWrite = 0;
			alucontrol = 0;
			sel_JR = 0;
			immediate = 0;
        case(ALUOp)
		  
		  
		       4'b0010:begin
				 HIWrite = 0;
				 LOWrite = 0;

				 if (instruction == 6'b100100)      // AND (0)
				 begin alucontrol = 6'd0; end

				 else if (instruction == 6'b100000) // ADD (1)
				 begin alucontrol = 6'd1; end

				 else if (instruction == 6'b100001) // ADDU (3)
				 begin alucontrol = 6'd3; end

				 else if (instruction == 6'b100010) // SUB  (4)
				 begin alucontrol = 6'd4; end

				 else if (instruction == 6'b100111) // NOR  (5)
				 begin alucontrol = 6'd5; end

 				 else if (instruction == 6'b100101) // OR   (6)
				 begin alucontrol = 6'd6; end

				 else if (instruction == 6'b000000) // SLL  (7)
				 begin alucontrol = 6'd7; immediate = 1; end

				 else if (instruction == 6'b000100) // SLLV (8)
				 begin alucontrol = 6'd8; end

				 else if (instruction == 6'b101010) // SLT  (9)
				 begin alucontrol = 6'd9; end

				 else if (instruction == 6'b101011) // SLTU (10)
				 begin alucontrol = 6'd10; end

				 else if (instruction == 6'b000011) // SRA  (11)
				 begin alucontrol = 6'd11; immediate = 1; end

				 else if (instruction == 6'b000111) // SRAV (12)
				 begin alucontrol = 6'd12; end

				 else if (instruction == 6'b000010) // SRL(13)
				 begin
				 if (RS ==5'b00001) begin alucontrol = 6'd15; end
				 else begin alucontrol = 6'd13; immediate = 1; end
			    end
 				 else if (instruction == 6'b000110)	// SRLV (14)
				 begin
				 if (SHAMT == 5'b00001)
				 begin alucontrol = 6'd16; end
				 else begin alucontrol = 6'd14; end
				end
				 else if (instruction == 6'b000010) // ROTR (14)
				 begin alucontrol = 6'd15; immediate = 1; end

				 else if (instruction == 6'b000110) // ROTRV (15)
				 begin alucontrol = 6'd16; end

				 else if (instruction == 6'b100110) // XOR (17)
				 begin alucontrol = 6'd17; end

				 else if (instruction == 6'b011000) // MULT (21)
				 begin alucontrol = 6'd21; HIWrite = 1; LOWrite =1;end

				 else if (instruction == 6'b011001) // MULTU (22)
				 begin alucontrol = 6'd22; HIWrite = 1; LOWrite =1;end

				 else if (instruction == 6'b001010) // MOVZ (31)
				 begin alucontrol = 6'd31; end

				 else if (instruction == 6'b001011) // MOVN (32)
				 begin alucontrol = 6'd32; end

				 else if (instruction == 6'b010001) // MTHI (33)
				 begin alucontrol = 6'd33; HIWrite = 1;end

				 else if (instruction == 6'b010011) // MTLO (34)
				 begin alucontrol = 6'd34; LOWrite = 1; end

				 else if (instruction == 6'b010000) // MFHI (35)
				 begin alucontrol = 6'd35; end

				 else if (instruction == 6'b010010) // MFLO (36)
				 begin alucontrol = 6'd36; end

				 else if (instruction == 6'b001000) // JR (47)
				 begin alucontrol = 6'd47; sel_JR = 1; end
				 
				 end
				 
				 4'b0011:begin alucontrol = 6'd25; immediate = 1; end // ADDI (25)

				 4'b0100:begin alucontrol = 6'd2;  immediate = 1; end // ADDIU (2)

				 4'b0101:begin alucontrol = 6'd28; immediate = 1; end // SLTI (28)

				 4'b0110:begin alucontrol = 6'd26; ZE = 1; immediate = 1; end // ANDI (26)

				 4'b0111:begin alucontrol = 6'd27; ZE = 1; immediate = 1; end // ORI (27)

				 4'b1000:begin alucontrol = 6'd30; immediate = 1; end // XORI (30)
				 
				 4'b0001:begin alucontrol = 6'd4; end // BEQ & BNE

			    4'b0000:begin alucontrol = 6'd1; end // ALL 0 ALUOPCODES
				 


				 4'b1001:
				 begin

				 if(instruction == 6'b000000)          // MADD (19)
				 begin alucontrol = 6'd19; HIWrite = 1; LOWrite =1; end

				 else if (instruction == 6'b000100)	   // MSUB (21)
				 begin alucontrol = 6'd20; HIWrite = 1; LOWrite =1; end

				 else if (instruction == 6'b100001)    // CLO (37)
				 begin alucontrol = 6'd37;end

				 else if (instruction == 6'b100000)    // CLZ (38)
				 begin alucontrol = 6'd38;end

				 else if (instruction == 6'b000010) // MUL (18)
				 begin alucontrol = 6'd18;  end

				 end

         4'b1010:
				 begin
				 if(instruction == 6'b100000) // SEB (23) SEH (24)
				 begin if (SHAMT == 6'b10000)
				 begin alucontrol = 6'd23; end
				 else begin alucontrol = 6'd24; end
				 end

				 end

			4'b1011:begin alucontrol = 6'd29; immediate = 1; end // SLTIU (29)
			4'b1101:begin alucontrol = 6'd46; end // JAL (46)
			4'b1111:begin alucontrol = 6'd54; end	 

        endcase
		
		
		end

endmodule
