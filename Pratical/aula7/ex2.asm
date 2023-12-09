#Code a program that calls a reverse string function 

	.data 
str:	.asciiz "ITED - orievA ed edadisrevinU"
	.eqv print_string, 4
	
	.text
	.globl main 
main: 
	addi $sp, $sp, -4
	sw   $ra, 0($sp)
	
	la $a0, str
	jal strrev			#strrev(str
	
	#print_strint(strrev(str))
	move $a0, $v0
	li $v0, print_string
	syscall 
	
	li    $v0, 0
	lw    $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra
	
strrev:
	#open space in the stack and stores the values of s0, s1, s2
	addiu 	$sp, $sp, -16 		
 	sw 	$ra, 0($sp) 		
	sw 	$s0, 4($sp) 		
	sw 	$s1, 8($sp)
	sw 	$s2, 12($sp) 
	
	move $s0, $a0			# callee-saved
	
	move $s1, $a0			# char *p1 = str;
	move $s2, $a0			# char *p2 = str; 
	
while1: lb  $t1, 0($s2)
	beq $t1, '\0', endWhile1	# while(*p2 != '\0') 
	
	addiu $s2, $s2, 1		# p2++; 
	j while1
	
endWhile1: addiu $s2, $s2, -1		# p2--; 

while2: bge $s1, $s2, endWhile2		# while( p1 < p2 )
	move $a0, $s1
	move $a1, $s2
	jal  exchange
	
	addiu $s1, $s1, 1		# p1++; 
	addiu $s2, $s2, -1 		# p2--; 
	
	j while2

endWhile2: 
	move    $v0, $s0			#return str;
	
	lw 	$ra, 0($sp) 		
	lw 	$s0, 4($sp) 		
	lw 	$s1, 8($sp)
	lw 	$s2, 12($sp) 
	addiu 	$sp, $sp, 16 
	
	jr $ra
	
	
exchange:
	lb $t0, 0($a0)
	lb $t1, 0($a1)
	
	sb $t0, 0($a1)	
	sb $t1, 0($a0)
	
	jr $ra
		
 	
	
	
	
	
	
	
	
	
	