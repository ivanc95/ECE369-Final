`timescale 1ns / 1ps
//Control Module
//ALUOP:
//0000 -> ADD for lw and sw
//0001 -> SUB for beq
//0010 -> look at function field (special 1)
//0011 -> ADDI
//0100 -> ADDIU
//0101 -> SLTI
//0110 -> ANDI
//0111 -> ORI
//1000 -> XORI
//1001 -> look at function field (special 2)
//1010 -> look at function field (special 3)

module Control(OPCode, RegDst, Branch, MemRead,MemtoReg, ALUOp,  MemWrite, ALUSrc, RegWrite, StoreP, LoadP, unSigned, selMemWrite, selRegWrite, selFlag, Jump,ra_write,RT_control,tRegistersWrite,TRCWrite);

    input [5:0] OPCode;
    
	 
    output reg RegDst, Branch, MemRead, MemtoReg,  MemWrite, ALUSrc, RegWrite, StoreP, LoadP, unSigned, selMemWrite, selRegWrite, Jump,ra_write,tRegistersWrite,TRCWrite;
    
    output reg [3:0] ALUOp;
	 
	 input [4:0] RT_control;

	 output reg [2:0] selFlag;
	
    always@(OPCode,RT_control) 
    begin
  	 RegDst=0; Branch=0; MemRead=0; MemtoReg=0;  MemWrite=0; ALUSrc=0; RegWrite=0; StoreP=0; LoadP=0; unSigned=0; selMemWrite=0; selRegWrite=0; selFlag=0; Jump = 0; ra_write = 0;tRegistersWrite = 0;TRCWrite = 0;
	 ALUOp=4'd0;
	 selFlag = 3'd6;
        case(OPCode)
    	  
                 6'd0: begin RegDst = 1; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 1; ALUOp = 4'b0010; end
                 6'd8: begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0011; end
                 6'd9: begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0100; end
                 6'd10:begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0101; end
			        6'd11:begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b1011; end
                 6'd12:begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0110; end
                 6'd13:begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0111; end
                 6'd14:begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b1000; end
                 6'd28:begin RegDst = 1; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 1; ALUOp = 4'b1001; end
                 6'd31:begin RegDst = 1; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 1; ALUOp = 4'b1010; end
				 //beq
			    6'b000100:begin RegDst = 0; Branch = 1; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 0; ALUOp = 4'b0001; selFlag = 3'd2; end
             
				 //bgez and bltz
				 6'b000001:begin RegDst = 0; Branch = 1; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 0; ALUOp = 4'b0000; 
				 
					if(RT_control == 5'd0)
					begin
						selFlag = 3'd1;
					end
					else
					begin
						selFlag = 3'd4;
					end

				 end
             
				 //bgtz
				 6'b000111:begin RegDst = 0; Branch = 1; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 0; ALUOp = 4'b0000; selFlag = 3'd4;end
             
				 //blez
				 6'b000110:begin RegDst = 0; Branch = 1; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 0; ALUOp = 4'b0000; selFlag = 3'd3;end
             
				 //bne
				 6'b000101:begin RegDst = 0; Branch = 1; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 0; ALUOp = 4'b0001; selFlag = 3'd5;end
             
				 //j
				 6'b000010:begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 0; ALUOp = 4'b1011; Jump = 1;end
             
				 //jal
				 6'b000011:begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 0; RegWrite = 1; ALUOp = 4'b1100; ra_write = 1; Jump = 1; end
             
				 //lw
				 6'b100011:begin RegDst = 0; Branch = 0; MemRead = 1; MemtoReg = 1;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0000; end
			    
				 //sw
				 6'b101011:begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 1; ALUSrc = 1; RegWrite = 0; ALUOp = 4'b0000; end
             
				 //lb
				 6'b100000:begin RegDst = 0; Branch = 0; MemRead = 1; MemtoReg = 1;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0000; LoadP = 0; unSigned = 0; selRegWrite = 1; end
			    
				 //lbu
				 6'b100100:begin RegDst = 0; Branch = 0; MemRead = 1; MemtoReg = 1;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0000; LoadP = 0; unSigned = 1; selRegWrite = 1; end
             
				 //lh
				 6'b100001:begin RegDst = 0; Branch = 0; MemRead = 1; MemtoReg = 1;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0000; LoadP = 1; unSigned = 0; selRegWrite = 1; end
             
				 //lhu
				 6'b100101:begin RegDst = 0; Branch = 0; MemRead = 1; MemtoReg = 1;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b0000; LoadP = 1; unSigned = 1; selRegWrite = 1; end
             
				 //lui
				 6'b001111:begin RegDst = 0; Branch = 0; MemRead = 0; MemtoReg = 0;  MemWrite = 0; ALUSrc = 1; RegWrite = 1; ALUOp = 4'b1111; end
			    
				 //sb
				 6'b101000:begin RegDst = 0; Branch = 1; MemRead = 0; MemtoReg = 0;  MemWrite = 1; ALUSrc = 1; RegWrite = 0; ALUOp = 4'b0000; StoreP = 0; selMemWrite = 1; end
             
				 //sh
				 6'b101001:begin RegDst = 0; Branch = 1; MemRead = 0; MemtoReg = 0;  MemWrite = 1; ALUSrc = 1; RegWrite = 0; ALUOp = 4'b0000; StoreP = 1; selMemWrite = 1; end
				 
				 //ltr
				 6'b111110:begin TRCWrite = 1;  end
				 //str
				 6'b111111:begin tRegistersWrite = 1;end
				 
				 
        endcase
    end







endmodule