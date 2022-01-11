#Change the program you wrote in point 1 to implement the arithmetic expression y = 2x - 8.

	.data
	.text
	.globl main
main: 
	ori $t0, $0, 2
	add $t0, $t0, $t0
	sub $t1, $t0, 8			#$t1 = $t0 - 8 (y = 2x - 8)
	jr  $ra