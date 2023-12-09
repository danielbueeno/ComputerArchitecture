#Code a program that prints the content of an array of integers prev initialized

#Registers Map
#p = $t0
#*p = $t3
#SIZE = $t1
#arr + SIZE = $t2

	.data 
	
arr: 	.word 8,-4,3,5,124,-15,87,9,27,15
str1: 	.asciiz "Array content: "
str2: 	.asciiz "; "

	.eqv SIZE, 10
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.text
	.globl main
main: 	
	la $a0, str1 
	li $v0, print_string
	syscall
	
	la  $t0, arr	
	li  $t1, SIZE
	sll $t1, $t1, 2
		
	addu $t2, $t0, $t1
	
for: 
	bgeu  $t0, $t2, endFor
	
	lw $t3, 0($t0)
	move $a0, $t3
	li   $v0, print_int10
	syscall
	
	la $a0, str2
	li $v0, print_string
	syscall
	
	addiu $t0, $t0, 4
	j for

endFor:
	jr $ra
	
	