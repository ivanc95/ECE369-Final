module hazard(IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_MemRead, ControlFlush, IF_ID_Write, PCWrite,ID_EX_RegisterRt,ID_immediate,ID_EX_immediate,EX_BranchJump,HZ_BranchJump,IF_Flush);

    input ID_EX_MemRead,ID_immediate,ID_EX_immediate,EX_BranchJump;
    input [4:0] IF_ID_RegisterRs, IF_ID_RegisterRt,ID_EX_RegisterRt;
    output reg ControlFlush, IF_ID_Write, PCWrite,HZ_BranchJump,IF_Flush;
    
    always @(*)
    begin
		  		ControlFlush = 0;
				PCWrite = 0;
				IF_ID_Write = 0;
				HZ_BranchJump = 0;
				IF_Flush = 0;
				
        if (ID_EX_MemRead && 
            ((ID_EX_RegisterRt == IF_ID_RegisterRs) ||
            (ID_EX_RegisterRt == IF_ID_RegisterRt)))
        begin
            ControlFlush = 1; //Makes all control signals 0
            PCWrite = 0; // We are subtracting in program counter when 0
            IF_ID_Write = 0; // we are stalling fetch when 0
				HZ_BranchJump = 0;
				IF_Flush = 0;
        end
		  else if((ID_EX_RegisterRt == IF_ID_RegisterRt)&&(ID_immediate)&&(ID_EX_immediate)&&(ID_EX_MemRead))
		  begin
		      ControlFlush = 1; //Makes all control signals 0
            PCWrite = 0; // We are subtracting in program counter when 0
            IF_ID_Write = 0; // we are stalling fetch when 0
				HZ_BranchJump = 0;
				IF_Flush = 0;
		  end
		  else if((EX_BranchJump))
		  begin
				ControlFlush = 1;
				PCWrite = 1;
				IF_ID_Write = 1;
				HZ_BranchJump = 1;
				IF_Flush = 1;
		  end
		  else
		  begin
				ControlFlush = 0;
				PCWrite = 1;
				IF_ID_Write = 1;
				HZ_BranchJump = 0;
				IF_Flush = 0;
		  end
        
    end
    
endmodule

//////////////////////////////////////////////////
//      NOTE: DOES NOT HANDLE BRANCH YET        // 
//////////////////////////////////////////////////
// If we detect a branch THEN we flush
// STALL AFTER JR ALWAYS
