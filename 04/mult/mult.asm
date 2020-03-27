// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// if ram[1] or ram[0] is 0 return 0
// else normal
// total = 0
// i = 0
// n = ram[1]
// m = ram[0]
// Loop:
//  total = total + m
// infinte loop to end program

    //n = RAM[1]
    @R1
    D=M
    
    //if D (RAM[1]) == 0:
    @EDGE_CASE
    D;JEQ
    
    //else n = D (RAM[1])
    @n
    M=D
    
    //d = RAM[0]
    @R0
    D=M
    
    //if D (RAM[0]) == 0:
    @EDGE_CASE
    D;JEQ

    @m
    M=D

    //total, i = 0, 0
    @total
    M=0
    @i
    M=0

(LOOP)
    //break condition
    @n
    D=M
    @i
    D=D-M
    @END_LOOP
    D;JLE

    //operation
    @m
    D=M
    @total
    M=M+D

    //increment
    @i
    M=M+1
    @LOOP
    0;JMP
    
(END_LOOP)
    @total
    D=M
    @R2
    M=D
    @END
    0;JMP

(EDGE_CASE)
    @R2
    M=0

(END)
    @END
    0;JMP
    
    
