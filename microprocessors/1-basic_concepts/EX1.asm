#It is intended to write a program, in assembly language, that implements the expression arithmetic y = 2x + 8. 
#Assuming the value of x is passed through register $t0 ($8) of the CPU and that the result is deposited in register $t1($9).

	.data
	.text
	.globl main
main:
	ori  $t0, $0, 2			#$t0 = 0 + x
	add  $t0, $t0, $t0		#$t0 = $t0 + $t0  ($t0 = 2x)
	addi $t1, $t0, 8		#$t1 = $t0 + 8 (y = 2x + 8)
	jr   $ra