#Do a program that reverses strings.


	.data 
	
str: 	.asciiz "ITED - orievA ed edadisrevinU"
	.eqv print_string, 4
	
	.text
	.globl main
main: 
	#Store the "end program"
	addiu $sp, $sp, -4
	sw    $ra, 0($sp)
	
	#call the function
	la $a0, str
	jal strrev
	
	#get the end program
	lw  $ra, 0($sp)
	
	#print_tring(strrev(str))
	move $a0, $v0
	li   $v0, print_string
	syscall
	
	jr $ra
	
	
strrev: 
	addiu $sp, $sp, -16
	sw    $ra, 0($sp)
	sw    $s0, 4($sp)
	sw    $s1, 8($sp)
	sw    $s2, 12($sp)
	
	move $s0, $a0		#register callee-saved
	move $s1, $a0		#p1 = str
	move $s2, $a0		#p2 = str
	
while1: lb    $t1, 0($s2)	#$t1 = *p2
	beq   $t1, '\0', endw1
	addiu $s2, $s2, 1
	j     while1
endw1:  addiu $s2, $s2, -1

while2: bge   $s1, $s2, endw2

	move  $a0, $s1
	move  $a1, $s2
	jal   exchange
	
	addiu $s1, $s1, 1
	addiu $s2, $s2, -1
	
	j while2
	
endw2:	move $v0, $s0
	lw   $ra, 0($sp)
	lw   $s0, 4($sp)
	lw   $s1, 8($sp)
	lw   $s2, 12($sp)
	addiu $sp, $sp, 16
	jr $ra
	
exchange:
	lb $t0, 0($a0)
	lb $t1, 0($a1)
	
	sb $t0, 0($a1)
	sb $t1, 0($a0)
	
	jr $ra
       
	