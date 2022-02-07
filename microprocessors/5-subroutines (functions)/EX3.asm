


	.data 
	.eqv STR_MAX_SIZE, 30
	.eqv print_string, 4
	.eqv print_int10, 1
	
str1:	.asciiz "I serodatupmoC ed arutetiuqrA"
str2:   .space STR_MAX_SIZE
str3: 	.asciiz "\n"
str4:   .asciiz "String too long: "
	
	.text
	.globl main
main: 
	#Store the end program 
	addiu $sp, $sp, -4
	sw    $ra, 0($sp)
	
	la $a0, str1
	jal strlen
	
if: 	bgt $v0, STR_MAX_SIZE, else

	#strcpy(str2, str1); 
	la $a0, str2
	la $a1, str1
	jal strcpy
	
	#print_string(strcpy(str2, str1));
	move $a0,$v0
	li   $v0, print_string
	syscall
	 
	#print_string("\n");
	la $a0, str3
	li $v0, print_string
	syscall 
	
	#print_string(strrev(str2));
	la    $a0, str2
	jal   strrev
	move  $a0, $v0
	li    $v0, print_string 
	syscall
	
	li $s0, 0		#exit_value = 0;
	
	j endif
	
else:	#print_string("String too long: "); 
	la $a0, str4
	li $v0, print_string
	syscall
	#print_int10(strlen(str1)); 
	la $a0, str1
	jal strlen
	move $a0, $v0
	li   $v0, print_int10
	syscall
	
	li $s0, -1		#exit_value = -1;

endif: 
	move $v0, $s0
	lw   $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra 

###################FUNCTIONS####################
strlen: 
	li $t0, 0		#int len = 0
while: 
	lb    $t1, 0($a0)
	addiu $a0, $a0, 1
	beq   $t1, '\0', endw
	addi  $t0, $t0, 1
	j while
endw: 
	move $v0, $t0
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


strcpy: 
	li $t0, 0			#int i = 0
do: 
	#dst[i]
	move $t1, $a0
	addu $t1, $t1, $t0
	
	#src[i]
	move $t2, $a1
	addu $t2, $t2, $t0
	lb   $t3, 0($t2)
	
	#dst[i] = src[i];
	sb $t3, 0($t1)
	
	addi $t0, $t0, 1
	
whilestrcpy:
	move $t2, $a1
	addu $t2, $t2, $t0
	lb $t3, 0($t2)
	
	bne $t3, '\0', do
	
	move $v0, $a0
	jr $ra
	
		
