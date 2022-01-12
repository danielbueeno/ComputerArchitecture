#The MIPS ISA does not provide a bitwise deny instruction. Using the instructions available logics, suggest a way to do 
#bitwise negation of the contents of a register and implement it (input $t0, output $t1)

	.data
	.text
	.globl main
main: 
	
	li $t0, 5
	
	nor $t1, $0, $t0    # $t1 = 0 nor $t0 = not (0 or $t0) = not $t0
	
	#print_int10($t1)
	move $a0, $t1
	li   $v0, print_int10
	syscall
	
	jr $ra
	
