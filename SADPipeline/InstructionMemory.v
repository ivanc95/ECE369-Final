`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory  1
// Name: Jonathan Avila Ivan Cordoba 50/50
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction Memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction Memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;             // Input Address 

    output [31:0] Instruction;    // Instruction at memory location Address
    reg [31:0] memory [0:177];
	
initial	

begin

memory[0] = 32'b00100011101111011111111111111100;	//	main:		addi	$sp, $sp, -4
memory[1] = 32'b10101111101111110000000000000000;	//			sw	$ra, 0($sp)
memory[2] = 32'b00110100000001000000000000000000;	//			ori	$a0, $zero, 0
memory[3] = 32'b00110100000001010000000000010000;	//			ori	$a1, $zero, 16
memory[4] = 32'b00110100000001100100000000010000;	//			ori	$a2, $zero, 16400
memory[5] = 32'b00001100000000000000000000001001;	//			jal	vbsme
memory[6] = 32'b10001111101111110000000000000000;	//			lw	$ra, 0($sp)
memory[7] = 32'b00100011101111010000000000000100;	//			addi	$sp, $sp, 4
memory[8] = 32'b00001000000000000000000000001000;	//	endloop:	j	endloop
memory[9] = 32'b00110100000000100000000000000000;	//	vbsme:		ori	$v0, $zero, 0
memory[10] = 32'b00110100000000110000000000000000;	//			ori	$v1, $zero, 0
memory[11] = 32'b00100011101111011111111111111100;	//			addi	$sp, $sp, -4
memory[12] = 32'b10101111101111110000000000000000;	//			sw	$ra, 0($sp)
memory[13] = 32'b10001100100010000000000000000000;	//			lw	$t0, 0($a0)
memory[14] = 32'b10001100100010010000000000000100;	//			lw	$t1, 4($a0)
memory[15] = 32'b10001100100010100000000000001000;	//			lw	$t2, 8($a0)
memory[16] = 32'b10001100100010110000000000001100;	//			lw	$t3, 12($a0)
memory[17] = 32'b00000000000000000110000000100000;	//			add	$t4, $0, $0
memory[18] = 32'b00000000000000000110100000100000;	//			add	$t5, $0, $0
memory[19] = 32'b00000000000000000111000000100000;	//			add	$t6, $0, $0
memory[20] = 32'b00000000000000000111100000100000;	//			add	$t7, $0, $0
memory[21] = 32'b00000000000000001100000000100000;	//			add	$t8, $0, $0
memory[22] = 32'b00000000000000001000000000100000;	//			add	$s0, $0, $0
memory[23] = 32'b00000000000000001000100000100000;	//			add	$s1, $0, $0
memory[24] = 32'b00000000000000001001000000100000;	//			add	$s2, $0, $0
memory[25] = 32'b00000001000010101001100000100010;	//			sub	$s3, $t0, $t2
memory[26] = 32'b00100010011100110000000000000001;	//			addi	$s3, $s3, 1
memory[27] = 32'b00000001001010111010000000100010;	//			sub	$s4, $t1, $t3
memory[28] = 32'b00100010100101000000000000000001;	//			addi	$s4, $s4, 1
memory[29] = 32'b00100000000101010111111111111111;	//			addi	$s5, $0, 32767
memory[30] = 32'b11111100000000000000000000000000;	//			str
memory[31] = 32'b00001100000000000000000010001011;	//			jal	SAD
memory[32] = 32'b11111000000000000000000000000000;	//			ltr
memory[33] = 32'b00000010010101010000100000101010;	//			slt	$at, $s2, $s5
memory[34] = 32'b00010000001000000000000000000100;	//			beq	$at, $zero, moveA
memory[35] = 32'b00000010010000001010100000100000;	//			add	$s5, $s2, $0
memory[36] = 32'b00000010000000001011000000100000;	//			add	$s6, $s0, $0
memory[37] = 32'b00000010001000001011100000100000;	//			add	$s7, $s1, $0
memory[38] = 32'b00010010010000000000000001011111;	//			beq	$s2, $0, exit
memory[39] = 32'b00001000000000000000000000101000;	//	moveA:		j	right
memory[40] = 32'b00100001100011000000000000000001;	//	right:		addi	$t4, $t4, 1
memory[41] = 32'b00100010001100010000000000000001;	//			addi	$s1, $s1, 1
memory[42] = 32'b00000000000000000000000000000000;	//			nop
memory[43] = 32'b00000000000000000000000000000000;	//			nop
memory[44] = 32'b11111100000000000000000000000000;	//			str
memory[45] = 32'b00001100000000000000000010001011;	//			jal	SAD
memory[46] = 32'b11111000000000000000000000000000;	//			ltr
memory[47] = 32'b00000010010101010000100000101010;	//			slt	$at, $s2, $s5
memory[48] = 32'b00010000001000000000000000000100;	//			beq	$at, $zero, rightA
memory[49] = 32'b00000010010000001010100000100000;	//			add	$s5, $s2, $0
memory[50] = 32'b00000010000000001011000000100000;	//			add	$s6, $s0, $0
memory[51] = 32'b00000010001000001011100000100000;	//			add	$s7, $s1, $0
memory[52] = 32'b00010010010000000000000001010001;	//			beq	$s2, $0, exit
memory[53] = 32'b00100010100110001111111111111111;	//	rightA:		addi	$t8, $s4, -1
memory[54] = 32'b00000001100110000000100000101010;	//			slt	$at, $t4, $t8
memory[55] = 32'b00010000001000000000000000000001;	//			beq	$at, $zero, down
memory[56] = 32'b00001000000000000000000000101000;	//			j	right
memory[57] = 32'b00100001101011010000000000000001;	//	down:		addi	$t5, $t5, 1
memory[58] = 32'b00100010000100000000000000000001;	//			addi	$s0, $s0, 1
memory[59] = 32'b00000000000000000000000000000000;	//			nop
memory[60] = 32'b00000000000000000000000000000000;	//			nop
memory[61] = 32'b11111100000000000000000000000000;	//			str
memory[62] = 32'b00001100000000000000000010001011;	//			jal	SAD
memory[63] = 32'b11111000000000000000000000000000;	//			ltr
memory[64] = 32'b00000010010101010000100000101010;	//			slt	$at, $s2, $s5
memory[65] = 32'b00010000001000000000000000000100;	//			beq	$at, $zero, downA
memory[66] = 32'b00000010010000001010100000100000;	//			add	$s5, $s2, $0
memory[67] = 32'b00000010000000001011000000100000;	//			add	$s6, $s0, $0
memory[68] = 32'b00000010001000001011100000100000;	//			add	$s7, $s1, $0
memory[69] = 32'b00010010010000000000000001000000;	//			beq	$s2, $0, exit
memory[70] = 32'b00100010011110001111111111111111;	//	downA:		addi	$t8, $s3, -1
memory[71] = 32'b00000001101110000000100000101010;	//			slt	$at, $t5, $t8
memory[72] = 32'b00010000001000000000000000000001;	//			beq	$at, $zero, left
memory[73] = 32'b00001000000000000000000000111001;	//			j	down
memory[74] = 32'b00100001110011100000000000000001;	//	left:		addi	$t6, $t6, 1
memory[75] = 32'b00100010001100011111111111111111;	//			addi	$s1, $s1, -1
memory[76] = 32'b00000000000000000000000000000000;	//			nop
memory[77] = 32'b00000000000000000000000000000000;	//			nop
memory[78] = 32'b11111100000000000000000000000000;	//			str
memory[79] = 32'b00001100000000000000000010001011;	//			jal	SAD
memory[80] = 32'b11111000000000000000000000000000;	//			ltr
memory[81] = 32'b00000010010101010000100000101010;	//			slt	$at, $s2, $s5
memory[82] = 32'b00010000001000000000000000000100;	//			beq	$at, $zero, leftA
memory[83] = 32'b00000010010000001010100000100000;	//			add	$s5, $s2, $0
memory[84] = 32'b00000010000000001011000000100000;	//			add	$s6, $s0, $0
memory[85] = 32'b00000010001000001011100000100000;	//			add	$s7, $s1, $0
memory[86] = 32'b00010010010000000000000000101111;	//			beq	$s2, $0, exit
memory[87] = 32'b00100010100110001111111111111111;	//	leftA:		addi	$t8, $s4, -1
memory[88] = 32'b00000001110110000000100000101010;	//			slt	$at, $t6, $t8
memory[89] = 32'b00010000001000000000000000000001;	//			beq	$at, $zero, up
memory[90] = 32'b00001000000000000000000001001010;	//			j	left
memory[91] = 32'b00100001111011110000000000000001;	//	up:		addi	$t7, $t7, 1
memory[92] = 32'b00100010000100001111111111111111;	//			addi	$s0, $s0, -1
memory[93] = 32'b00000000000000000000000000000000;	//			nop
memory[94] = 32'b00000000000000000000000000000000;	//			nop
memory[95] = 32'b11111100000000000000000000000000;	//			str
memory[96] = 32'b00001100000000000000000010001011;	//			jal	SAD
memory[97] = 32'b11111000000000000000000000000000;	//			ltr
memory[98] = 32'b00000010010101010000100000101010;	//			slt	$at, $s2, $s5
memory[99] = 32'b00010000001000000000000000000100;	//			beq	$at, $zero, upA
memory[100] = 32'b00000010010000001010100000100000;	//			add	$s5, $s2, $0
memory[101] = 32'b00000010000000001011000000100000;	//			add	$s6, $s0, $0
memory[102] = 32'b00000010001000001011100000100000;	//			add	$s7, $s1, $0
memory[103] = 32'b00010010010000000000000000011110;	//			beq	$s2, $0, exit
memory[104] = 32'b00100010011110001111111111111110;	//	upA:		addi	$t8, $s3, -2
memory[105] = 32'b00000001111110000000100000101010;	//			slt	$at, $t7, $t8
memory[106] = 32'b00010000001000000000000000000001;	//			beq	$at, $zero, next
memory[107] = 32'b00001000000000000000000001011011;	//			j	up
memory[108] = 32'b00101010011011000000000000000011;	//	next:		slti	$t4, $s3, 3
memory[109] = 32'b00010101100000000000000000011000;	//			bne	$t4, $0, exit
memory[110] = 32'b00101010100011000000000000000011;	//			slti	$t4, $s4, 3
memory[111] = 32'b00010101100000000000000000010110;	//			bne	$t4, $0, exit
memory[112] = 32'b00000000000000000110000000100000;	//			add	$t4, $0, $0
memory[113] = 32'b00000000000000000110100000100000;	//			add	$t5, $0, $0
memory[114] = 32'b00000000000000000111000000100000;	//			add	$t6, $0, $0
memory[115] = 32'b00000000000000000111100000100000;	//			add	$t7, $0, $0
memory[116] = 32'b00100010001100010000000000000001;	//			addi	$s1, $s1, 1
memory[117] = 32'b00000000000000000000000000000000;	//			nop
memory[118] = 32'b00000000000000000000000000000000;	//			nop
memory[119] = 32'b11111100000000000000000000000000;	//			str
memory[120] = 32'b00001100000000000000000010001011;	//			jal	SAD
memory[121] = 32'b11111000000000000000000000000000;	//			ltr
memory[122] = 32'b00000010010101010000100000101010;	//			slt	$at, $s2, $s5
memory[123] = 32'b00010000001000000000000000000100;	//			beq	$at, $zero, nextA
memory[124] = 32'b00000010010000001010100000100000;	//			add	$s5, $s2, $0
memory[125] = 32'b00000010000000001011000000100000;	//			add	$s6, $s0, $0
memory[126] = 32'b00000010001000001011100000100000;	//			add	$s7, $s1, $0
memory[127] = 32'b00010010010000000000000000000110;	//			beq	$s2, $0, exit
memory[128] = 32'b00100010011100111111111111111110;	//	nextA:		addi	$s3, $s3, -2
memory[129] = 32'b00100010100101001111111111111110;	//			addi	$s4, $s4, -2
memory[130] = 32'b00100000000110010000000000000001;	//			addi	$t9, $0, 1
memory[131] = 32'b00010010011110010000000000000010;	//			beq	$s3, $t9, exit
memory[132] = 32'b00010010100110010000000000000001;	//			beq	$s4, $t9, exit
memory[133] = 32'b00001000000000000000000000101000;	//			j	right
memory[134] = 32'b00000010110000000001000000100000;	//	exit:		add	$v0, $s6, $0
memory[135] = 32'b00000010111000000001100000100000;	//			add	$v1, $s7, $0
memory[136] = 32'b10001111101111110000000000000000;	//			lw	$ra, 0($sp)
memory[137] = 32'b00100011101111010000000000000100;	//			addi	$sp, $sp, 4
memory[138] = 32'b00001000000000000000000010101101;	//			j	quit
memory[139] = 32'b10001100100010000000000000000100;	//	SAD:		lw	$t0, 4($a0)
memory[140] = 32'b10001100100010010000000000001000;	//			lw	$t1, 8($a0)
memory[141] = 32'b10001100100010100000000000001100;	//			lw	$t2, 12($a0)
memory[142] = 32'b00000000000000001001000000100000;	//			add	$s2, $0, $0
memory[143] = 32'b00000000000000000111000000100000;	//			add	$t6, $0, $0
memory[144] = 32'b01110001001010100111100000000010;	//			mul	$t7, $t1, $t2
memory[145] = 32'b00000000000000000110100000100000;	//			add	$t5, $0, $0
memory[146] = 32'b00000010000000001100000000100000;	//			add	$t8, $s0, $0
memory[147] = 32'b00000010001000001100100000100000;	//			add	$t9, $s1, $0
memory[148] = 32'b01110011000010000101100000000010;	//	L2:		mul	$t3, $t8, $t0
memory[149] = 32'b00000001011110010101100000100000;	//			add	$t3, $t3, $t9
memory[150] = 32'b00000000000010110101100010000000;	//			sll	$t3, $t3, 2
memory[151] = 32'b00000001011001010101100000100000;	//			add	$t3, $t3, $a1
memory[152] = 32'b00000000000011100110000010000000;	//			sll	$t4, $t6, 2
memory[153] = 32'b00000001100001100110000000100000;	//			add	$t4, $t4, $a2
memory[154] = 32'b10001101011010110000000000000000;	//			lw	$t3, 0($t3)
memory[155] = 32'b10001101100011000000000000000000;	//			lw	$t4, 0($t4)
memory[156] = 32'b00000001011011000101100000100010;	//			sub	$t3, $t3, $t4
memory[157] = 32'b00000101011000010000000000000001;	//			bgez	$t3, L2a
memory[158] = 32'b00000000000010110101100000100010;	//			sub	$t3, $0, $t3
memory[159] = 32'b00000010010010111001000000100000;	//	L2a:		add	$s2, $s2, $t3
memory[160] = 32'b00100011001110010000000000000001;	//			addi	$t9, $t9, 1
memory[161] = 32'b00100001110011100000000000000001;	//			addi	$t6, $t6, 1
memory[162] = 32'b00100001101011010000000000000001;	//			addi	$t5, $t5, 1
memory[163] = 32'b00000001110011110000100000101010;	//			slt	$at, $t6, $t7
memory[164] = 32'b00010000001000000000000000000111;	//			beq	$at, $zero, End
memory[165] = 32'b00000001101010100000100000101010;	//			slt	$at, $t5, $t2
memory[166] = 32'b00010000001000000000000000000001;	//			beq	$at, $zero, L3
memory[167] = 32'b00001000000000000000000010010100;	//			j	L2
memory[168] = 32'b00100011000110000000000000000001;	//	L3:		addi	$t8, $t8, 1
memory[169] = 32'b00000000000000000110100000100000;	//			add	$t5, $0, $0
memory[170] = 32'b00000010001000001100100000100000;	//			add	$t9, $s1, $0
memory[171] = 32'b00001000000000000000000010010100;	//			j	L2
memory[172] = 32'b00000011111000000000000000001000;	//	End:		jr	$ra
memory[173] = 32'b00000000000000000000000000000000;	//	quit:		nop
memory[174] = 32'b00000000000000000000000000000000;	//			nop
memory[175] = 32'b00001000000000000000000010101101;	//			j	quit
memory[176] = 32'b00000000000000000000000000000000;	//			nop
memory[177] = 32'b00000000000000000000000000000000;	//			nop





end
		
		
assign Instruction = memory[Address[11:2]];


endmodule
