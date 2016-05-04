 .data
 
 # test 0 For the 16X16 frame size and 4X4 window size
 # The result should be 0, 2
 
 asize0:  .word    4,  4,  2, 2    #i, j, k, l
 frame0:  .word    0,  0,  1,  2,
          .word    0,  0,  3,  4
          .word    0,  0,  0,  0
          .word    0,  0,  0,  0,
 window0: .word    1,  2,
          .word    3,  4,
 
 .text
 
 .globl main
 
 main:
     addi    $sp, $sp, -4    # Make space on stack
     sw      $ra, 0($sp)     # Save return address
 
     # Start test 1
     ############################################################
     la      $a0, asize0     # 1st parameter: address of asize1[0]
     la      $a1, frame0     # 2nd parameter: address of frame1[0]
     la      $a2, window0    # 3rd parameter: address ofwindow1[0]
 
     jal     vbsme           # call function
 
     lw      $ra, 0($sp)         # Restore return address
     addi    $sp, $sp, 4         # Restore stack pointer
 
 
 endloop:
 	j endloop
 
 
 .text
 .globl vbsme
 
 
 
 vbsme:
     li      $v0, 0              # reset $v0 and $V1
     li      $v1, 0
     addi    $sp, $sp, -4
     sw      $ra, 0($sp)
     # insert your code here
     lw      $t0, 0($a0)
     lw      $t1, 4($a0)
     lw      $t2, 8($a0)
     lw      $t3, 12($a0)
     add     $t4, $0, $0
     add     $t5, $0, $0
     add     $t6, $0, $0
     add     $t7, $0, $0
     add     $t8, $0, $0
     add     $s0, $0, $0
     add     $s1, $0, $0
     add     $s2, $0, $0
     sub     $s3, $t0, $t2
     addi    $s3, $s3, 1
     sub     $s4, $t1, $t3
     addi    $s4, $s4, 1
     addi    $s5, $0, 32767
     str    
     jal     SAD
     ltr
     bge     $s2, $s5, moveA
     add     $s5, $s2, $0
     add     $s6, $s0, $0
     add     $s7, $s1, $0
     beq     $s2, $0, exit
 moveA:
     j       right
 
 right:
     addi    $t4, $t4, 1
     addi    $s1, $s1, 1
     str
     jal     SAD
     ltr
     addi $sp, $sp, 32
     bge $s2, $s5, rightA
     add     $s5, $s2, $0
     add $s6, $s0, $0
     add $s7, $s1, $0
     beq     $s2, $0, exit
 rightA:
     addi $t8, $s4, -1
     bge $t4, $t8, down
     j right
 
 down:
     addi $t5, $t5, 1
     addi $s0, $s0, 1
     addi $sp, $sp, -32
     str
     jal SAD
     ltr
     bge $s2, $s5, downA
     add     $s5, $s2, $0
     add $s6, $s0, $0
     add $s7, $s1, $0
     beq     $s2, $0, exit
 downA:
     addi $t8, $s3, -1
     bge $t5, $t8, left
     j down
 
 left:
     addi $t6, $t6, 1
     addi $s1, $s1, -1
     str
     jal SAD
     ltr
     bge $s2, $s5, leftA
     add     $s5, $s2, $0
     add $s6, $s0, $0
     add $s7, $s1, $0
     beq     $s2, $0, exit
 leftA:
     addi $t8, $s4, -1
     bge $t6, $t8, up
     j left
 
 up:
     addi $t7, $t7, 1
     addi $s0, $s0, -1
     str
     jal SAD
     ltr
     bge $s2, $s5, upA
     add     $s5, $s2, $0
     add $s6, $s0, $0
     add $s7, $s1, $0
     beq     $s2, $0, exit
 upA:
     addi $t8, $s3, -2
     bge $t7, $t8, next
     j up
 
 next:
     slti $t4, $s3, 3
     bne $t4, $0, exit
     slti $t4, $s4, 3
     bne $t4, $0, exit
     add     $t4, $0, $0
     add     $t5, $0, $0
     add     $t6, $0, $0
     add     $t7, $0, $0
     addi $s1, $s1, 1
     str
     jal SAD
     ltr
     bge $s2, $s5, nextA
     add     $s5, $s2, $0
     add $s6, $s0, $0
     add $s7, $s1, $0
     beq     $s2, $0, exit
 nextA:
     addi $s3, $s3, -2
     addi $s4, $s4, -2
     addi $t9, $0, 1
     beq  $s3, $t9, exit
     beq  $s4, $t9, exit
     j right
 
 exit:
     add $v0, $s6, $0
     add $v1, $s7, $0
     lw $ra, 0($sp)
     addi $sp, $sp, 4
     jr $ra
 
 #initialization of variables that need to be initialized
 SAD:
     lw      $t0, 4($a0)             #t0 equals the number of columns of frame
     lw      $t1, 8($a0)             #t1 equals the number of rows of window
     lw      $t2, 12($a0)            #t2 equals the number of columns of window
     add     $s2, $0, $0             #initialize SAD Value
     add     $t6, $0, $0             #initialize loop counter for window
     mul     $t7, $t1, $t2           #loop counter limit for window
     add     $t5, $0, $0             #initialize loop counter for frame column
     add     $t8, $s0, $0            #sets row of O.B. into variable
     add     $t9, $s1, $0            #sets column of O.B. into variable
 
 #main loop that finds address of points and calculates SAD value
 L2:
     mul     $t3, $t8, $t0           #address offset of frame point
     add     $t3, $t3, $t9
     sll     $t3, $t3, 2
     add     $t3, $t3, $a1           #address of frame point
     sll     $t4, $t6, 2             #address offset of window point
     add     $t4, $t4, $a2           #address of winow point
     lw      $t3, 0($t3)             #load frame point at address
     lw      $t4, 0($t4)             #load window point at address
     sub     $t3, $t3, $t4           #calculate difference
     
     bgez  $t3, L2a
     sub $t3, $0, $t3
 
 
 L2a:    
     add     $s2, $s2, $t3           #add difference to running SAD
     addi    $t9, $t9, 1             #increment column number of frame
     addi    $t6, $t6, 1             #increment loop counter for window
     addi    $t5, $t5, 1             #increment loop counter for frame column
     bge     $t6, $t7, End           #if last element in window is reached jump to End
     bge     $t5, $t2, L3            #when loop reaches end of column jump to L3
     j       L2
 
 #increment row number; increment row counter; reset column number
 L3:
     addi    $t8, $t8, 1             #increment row of frame
     add     $t5, $0, $0             #reset loop counter for frame column
     add     $t9, $s1, $0            #reset column number for frame
     j       L2                      #jump to L2
 
 #exits the function
 End:
     jr      $ra                     #return value of SAD
 
