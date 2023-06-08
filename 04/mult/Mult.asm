// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

    
@2	//Goto final answer box
M=0	//zero answer box

@0
D=M
@END
D;JEQ	//if a product is 0

@1
D=M
@END
D;JEQ	//if a product is 0


D=M	
@3	
M=D	


(LOOP)
@1	//second number
D=M	//d has second number

@2	//goto final answer box
M=D+M	//adss second number to ram2 along with previous number

@3	//gets first number
M=M-1	//first number m,inus 1

D=M	  
@LOOP	//jump location
D;JGT	//jump	    


(END)
@END
0;JMP	//loop