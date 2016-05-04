`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:48 11/23/2015 
// Design Name: 
// Module Name:    forward 
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
module forward(EX_MEM_RegisterRd, ID_EX_RegisterRs, ID_EX_RegisterRt, MEM_WB_RegisterRd, EX_MEM_RegWrite, MEM_WB_RegWrite, ForwardA, ForwardB, MEM_WB_MemReadOut,MEM_WB_RegisterRt,EX_MEM_immediate,EX_MEM_RegisterRt,MEM_WB_immediate,ID_EX_immediate);

	 input [4:0] EX_MEM_RegisterRd, ID_EX_RegisterRs, ID_EX_RegisterRt, MEM_WB_RegisterRd, MEM_WB_RegisterRt,EX_MEM_RegisterRt;
	 input EX_MEM_RegWrite, MEM_WB_RegWrite,MEM_WB_MemReadOut,EX_MEM_immediate,MEM_WB_immediate,ID_EX_immediate;
    
    output reg [1:0] ForwardA, ForwardB;

    always @(*)
    begin
		  ForwardA = 2'd0;
		  ForwardB = 2'd0;
        if (EX_MEM_RegWrite && (EX_MEM_RegisterRd != 0)
            && (EX_MEM_RegisterRd == ID_EX_RegisterRs))
        begin
            ForwardA = 2'b10;
        end
		  
		  else if((EX_MEM_RegisterRt == ID_EX_RegisterRs) && (EX_MEM_immediate == 1)&& (EX_MEM_RegisterRd != 0))
		  begin
				ForwardA = 2'b10;
		  end
		  
		  else if ((EX_MEM_RegisterRt == ID_EX_RegisterRs)&&(EX_MEM_immediate)&&(EX_MEM_RegWrite)&& (EX_MEM_RegisterRt != 0))
		  begin
				ForwardA = 2'b10;
		  end
        
        else if (MEM_WB_RegWrite && (MEM_WB_RegisterRd != 0)
            && !(EX_MEM_RegWrite && (EX_MEM_RegisterRd != 0)
            && (EX_MEM_RegisterRd == ID_EX_RegisterRs))
            && (MEM_WB_RegisterRd == ID_EX_RegisterRs))
        begin
            ForwardA = 2'b01;
        end
		  //Load followed by Use
		  else if (MEM_WB_MemReadOut && (MEM_WB_RegisterRt == ID_EX_RegisterRs)&& (MEM_WB_RegisterRt != 0))
		  begin
				ForwardA = 2'b01;
		  end
		  
		  else if ((MEM_WB_RegisterRt == ID_EX_RegisterRs) && (MEM_WB_immediate)&& (MEM_WB_RegisterRt != 0))
		  begin
				ForwardA = 2'b01;

		  end
		  
        
        if (EX_MEM_RegWrite && (EX_MEM_RegisterRd != 0)
            && (EX_MEM_RegisterRd == ID_EX_RegisterRt))
        begin
            ForwardB = 2'b10;
        end
        
		  else if((EX_MEM_RegisterRt == ID_EX_RegisterRt) && (EX_MEM_immediate == 1)&& (EX_MEM_RegisterRd != 0))
		  begin
				ForwardB = 2'b10;
		  end
		  
		  else if ((EX_MEM_RegisterRt == ID_EX_RegisterRt)&&(EX_MEM_immediate)&&(EX_MEM_RegWrite) && !(ID_EX_immediate) && (EX_MEM_RegisterRt != 0))
		  begin
				ForwardB = 2'b10;
		  end
		  
        else if (MEM_WB_RegWrite && (MEM_WB_RegisterRd != 0)
            && !(EX_MEM_RegWrite && (EX_MEM_RegisterRd != 0)
            && (EX_MEM_RegisterRd == ID_EX_RegisterRt))
            && (MEM_WB_RegisterRd == ID_EX_RegisterRt))
        begin
            ForwardB = 2'b01;
        end
		  //Load followed by Use
		  else if (MEM_WB_MemReadOut && (MEM_WB_RegisterRt == ID_EX_RegisterRt)&& (MEM_WB_RegisterRt != 0))
		  begin
				ForwardB = 2'b01;
		  end
		  
		  else if ((MEM_WB_RegisterRt == ID_EX_RegisterRt) && (MEM_WB_immediate == 1)&& (MEM_WB_RegisterRt != 0))
		  begin
				ForwardB = 2'b01;

		  end
    
    end

endmodule
