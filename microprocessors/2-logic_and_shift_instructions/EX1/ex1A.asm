#Code a MIPS assembly program that determines the result of operations bitwise logics (bitwise) AND1, OR, NOR and XOR, 
#considering as operands the values ??stored in registers $t0 and $t1; The results must be stored in the registers $t2, 
#$t3, $t4 and $t5, respectively.

	.data 
	.text
	.globl main
main: 
	#defining variables at $t0 and $t1
	li $t0, 3
	li $t1, 2
	
	#bitwise operations
	and $t2, $t0, $t1
	or  $t3, $t0, $t1
	nor $t4, $t0, $t1
	xor $t5, $t0, $t1
	
	jr $ra
	