// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

    //n = 8192
    @8192
    D=A
    @n
    M=D

(LOOP_START)
    @i
    M=0

    //check keyboard value
    @KBD
    D=M
    @FILL_WHITE
    D;JEQ

(FILL_BLACK)
    //if i == n -> goto LOOP_START
    @i
    D=M
    @n
    D=D-M
    @LOOP_START
    D;JGE

    //RAM[SCREEN+i] = -1
    @SCREEN
    D=A
    @i
    A=D+M
    M=-1

    //i++
    @i
    M=M+1

    @FILL_BLACK
    0;JMP

(FILL_WHITE)
    //if i == n -> goto LOOP_START
    @i
    D=M
    @n
    D=D-M
    @LOOP_START
    D;JGE

    //RAM[SCREEN+i] = 0
    @SCREEN
    D=A
    @i
    A=D+M
    M=0

    //i++
    @i
    M=M+1

    @FILL_WHITE
    0;JMP
