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

  (KEYCHECK)
    @24576      //ram block holds the keyboard input
    D=M
    @BLACK
    D;JNE       //jump to the black routine if there is any keyboard input
    @WHITE
    D;JEQ       //jump to the white routine if there isn't any keyboard input 
     
     
  (WHITE)
    @0
    D=A
    @bw
    M=D
    @FLIP
    0;JMP
     
  (BLACK)
    @0
    D=!A        
    @bw
    M=D
    @FLIP
    0;JMP
     
  (FLIP)      
    @8191
    D=A
    @i          
    M=D
     
  (FLIPLOOP)  // Inner flip loop
    @i
    D=M
    @SCREEN
    D=A+D
    @pixel
    M=D
    @bw         // should be 0 (white) or -1 (black)
    D=M
    @pixel
    A=M
    M=D
    @i
    MD=M-1
     
  @FLIPLOOP
    D;JGE       //jump back to the top of the inner loop 
     
  @KEYCHECK 
    0;JMP