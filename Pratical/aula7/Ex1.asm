#Code a program that calls a function that returns the number o chars of a string

	.data 
str:	.asciiz "Computer Architecture"
	.eqv print_int10, 1
	
	.text
	.globl main
main:
	addiu	$sp, $sp, -4		# space on stack
	sw	$ra, 0($sp)		# store $ra
	
	la $a0, str			# strlen arg1 = str
	jal strlen			# strlen(str)
	
	move $a0, $v0
	li   $v0, print_int10
	syscall 			#print_int10(strlen(str));
	
	li	$v0, 0			# return 0;
	lw	$ra, 0($sp)		# 
	addiu	$sp, $sp, 4		# recover stack
	jr	$ra	
	

strlen: 
	li $t0, 0			#len = 0
while: 	lb $t1, 0($a0)			
	beq $t1, '\0', endWhile		# while(*s != '\0') 
	
	addi $t0, $t0, 1		# len ++
	addiu $a0, $a0, 1		#s++
	
	j while
	
endWhile: 
	move $v0, $t0
	jr $ra
	