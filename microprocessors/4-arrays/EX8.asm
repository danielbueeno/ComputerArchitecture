#The same as EX7 but using pointers to acess the array

	.data
	
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv SIZE, 3
arr: 	.word str1, str2, str3
str1: 	.asciiz "Array"
str2: 	.asciiz "of"
str3: 	.asciiz "pointers"

	.text
	.globl main
main: 
	la $t0, arr
	
	li  $t1, SIZE
	sll $t1, $t1, 2
	addu $t2, $t0, $t1
	
for: 	bge $t0, $t2, endfor
	
	lw  $a0, 0($t0)
	li  $v0, print_string
	syscall
	
	li $a0, '\n'
	li $v0, print_char
	syscall 
	
	addi $t0, $t0, 4
	j for 

endfor:
	jr $ra
	
	