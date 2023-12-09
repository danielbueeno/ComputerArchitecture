	
#Register map
#i = $t0
#array = $t1
#val[i] = $t2
#val[i+size/2]= t4

	.data 
str1: 	.asciiz "Result is: "
arr: 	.word 8, 4, 15, -1987, 327, -9, 16
	.eqv print_string, 4
	.eqv print_int10,1
	.eqv print_char, 11
	.eqv SIZE, 8
	
	.text
	.globl main
main: 
	li $t0, 0		#int i = 0
do: 
	la   $t1, arr		#$t1 = &val[0]
	sll  $t2, $t0, 2
	addu $t2, $t2, $t1	#$t2 = &val[i]
	
	lw $t3, 0($t2)		#v($t3) = val[i]
	lw $t4, 16($t2)		#val[i+size/2]
	
	sw $t4, 0($t2) 		#val[i] = val[i+size/2]
	sw $t3, 16($t2)		#val[i+size/2] = v
	
while: 	addi $t0,$t0, 1
	blt  $t0, 4, do
	
	la $a0, str1
	li $v0, print_string
	syscall
	
	li $t0, 0
	
do2: 	
	la   $t1, arr		#$t1 = &val[0]
	sll  $t2, $t0, 2
	addu $t2, $t2, $t1	#$t2 = &val[i]
	
	lw $t3, 4($t2)
	
	move $a0, $t3
	li   $v0, print_int10
	syscall
	
	li $a0, ','
	li $v0, print_char 
	syscall
	
while2: blt $t0, SIZE, do2

	jr $ra
	
	
	
	
	
	