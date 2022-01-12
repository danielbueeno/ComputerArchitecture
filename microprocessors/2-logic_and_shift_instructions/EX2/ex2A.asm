#Write a program that performs the 3 shift operations, considering how operands the registers $t0 and the constant
#Imm (value and number of bits to shift, respectively) and placing the results in registers $t2, $t3 and $t4

	.data
	.text
	.globl main
main:
	
	li $t0, 2
	
	sll $t2, $t0, 1
	srl $t3, $t0, 2
	sra $t4, $t0, 2
	
	jr $ra
	
	