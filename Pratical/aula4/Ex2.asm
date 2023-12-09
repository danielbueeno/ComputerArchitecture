#Code a program that reads a string from the keyboard and counts how many numeric chars it have. (Use pointers)

# Mapa de registos
# num: $t0
# p: $t1
# *p: $t2 

	.data 
str:	.space 20
	.eqv SIZE, 20
	.eqv read_string, 8
	.eqv print_int10, 1
	
	
	.text
	.globl main
main: 
	la $a0, str
	li $a1, SIZE
	li $v0, read_string
	syscall 			#read_string(str, SIZE)
	
	li $t0, 0 			#num = 0
	la $t1, str			#$t1 = str
	
while: 
	lb  $t2, 0($t1)			#$t2 = *str
	beq $t2, '\0', endWhile		#while(*p != '\0'){

if: 	blt $t2, '0', endIf		
	bgt $t2, '9', endIf		#if( (*p >= '0') && (*p <= '9') )
	
	addi $t0, $t0, 1		#num++
	
endIf:	addiu $t1, $t1, 1		#p++
	j while

endWhile: 
	move $a0, $t0
	li   $v0, print_int10
	syscall
	
	jr $ra


