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

@c
M = 0

(Loop)
@c
M = 0
@SetColor
0;JMP

(GoonLoop)
@24576
D = M

@Input
D;JGT

@Loop
0;JMP


(Input)
@c
M = -1

@SetColor
0;JMP

(SetColor)
@16384
D = A
@sc
M = D
@i
M = 0
@8192
D = A
@l
M = D

(LoopScreen)
@l
D = M
@i
D = D - M

@CheckColor
D;JLE

(GoOnSetColor)
@c
D = M
@sc
A = M
M = D

@i
M = M + 1
@1
D = A
@sc
M = D + M

@LoopScreen
0;JMP



(Loop2)
@24576
D = M

@Loop
D;JEQ

@Loop2
0;JMP

(CheckColor)
@c
D = M
@GoonLoop
D;JEQ
@Loop2
D;JLT

@GoOnSetColor
0;JMP