# Code a function that converts to a 32 bits integer the quantity represented by a numeric string that each char is a ASCII 
#code of a decimal digit. The conversion ends when a non numeric char is found.


	.data 
str: 	.asciiz "2023 is the year"
	
	.text
	.globl main
	
main: 
	addiu $sp, $sp, -4			# space on stack 
	sw    $ra, 0($sp)			# stores $ra
	
	la $a0, str
	jal atoi				#atoi(str)
	
	move $a0, $v0
	li   $v0, 1
	syscall 				#print_string(atoi(str))
	
	lw    $ra, 0($sp)			#set $ra with the previous stored value
	addiu $sp, $sp, 4
	
	li $v0, 0				# return 0
	jr $ra
	
	
atoi:
	li $t0, 0				#int digit = 0
	li $t1, 0				#int res = 0
	
	#while( (*s >= '0') && (*s <= '9') ) 
while:	lb  $t2, 0($a0)				
	blt $t2, '0', endW
	bgt $t2, '9', endW
	
	addi  $t0, $t2, -0x30			#digit = *s++ - '0'; 
	
	mulu  $t1, $t1, 10
	addu  $t1, $t1, $t0			#res = 10 * res + digit; 
	
	addiu $a0, $a0, 1			#s++
	j     while

endW:
	move $v0, $t1
	jr   $ra
	
	