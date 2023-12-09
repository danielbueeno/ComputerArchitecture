#Code a progam that copies a string from a memory place to another one. 

 
	.data 
str1:	.asciiz "I serodatupmoC ed arutetiuqrA T"
str2: 	.space 31
str3:	.asciiz "\n"
str4:	.asciiz "String too long: "

	.eqv MAX_SIZE, 30
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.text 
	.globl main
main: 
	addiu $sp, $sp, -4			#open space in the stack 
	sw    $ra, 0($sp)			#stores $ra 
	 
	la $a0, str1
	jal strlen				#strlen(str1)

if:	bgt $v0, MAX_SIZE, else			#if(strlen(str1)<=MAX_SIZE){
	
	la $a0, str2
	la $a1, str1
	jal strcpy				#strcpy(str2, str1)
	
	move $a0, $v0
	li   $v0, print_string
	syscall					#print_string(str2); 
	
	la $a0, str3
	li $v0, print_string
	syscall					#print_string("\n");
	
	la $a0, str2
	jal strrev				#strrev(str2); 
	move $a0, $v0
	li   $v0, print_string
	syscall 				#print_string(strrev(str2)); 
	
	li $v0, 0				#exit = 0
	j end

else: 
	la $a0, str4
	li $v0, print_string
	syscall 
	
	la $a0, str1
	jal strlen
	move $a0, $v0
	li   $v0, print_int10
	syscall			#print_int10(strlen(str1)); 
	
	li $v0, -1

end: 
	lw	$ra, 0($sp)			
	addiu	$sp, $sp, 4			
	jr	$ra		
	
	
	



strlen:						
	li	$t1, 0				
while:	lb	$t0, 0($a0)			
	addiu	$a0, $a0, 1			
	beq	$t0, '\0', endw
	addi	$t1, $t1, 1			
	j	while				
endw:	move	$v0, $t1			
	jr 	$ra	
	


strcpy: 
	li $t0, 0			#int i = 0
do: 	
	addu  $t1, $t0, $a1
	lb    $t2, 0($t1)		#src[i]
	
	addu $t3, $t0, $a0		#dst[i]
	sb    $t2, 0($t3)		#dst[i] = src[i]
	
	
	addi $t0, $t0, 1
	
while2: bne $t2, '\0', do		#while(src[i++] != '\0');
	
	move $v0, $a0			#return dst
	
	jr $ra
	


strrev: 					
	addiu 	$sp, $sp, -16 			
 	sw 	$ra, 0($sp) 			
	sw 	$s0, 4($sp) 			
	sw 	$s1, 8($sp) 			
	sw 	$s2, 12($sp) 			
	move 	$s0, $a0 			
	move 	$s1, $a0
	move 	$s2, $a0 	
while3: lb	$t1, 0($s2)			
	beq	$t1, '\0', endw3		
	addiu	$s2, $s2, 1 			
	j 	while3
endw3:	addiu	$s2, $s2, -1 	
while4: bge	$s1, $s2, endw4	
	move 	$a0, $s1 			
	move 	$a1, $s2			
 	jal 	exchange 			
 	addiu	$s1, $s1, 1			
 	addiu	$s2, $s2, -1			
	j 	while4			
endw4:	move 	$v0, $s0 		
	lw 	$ra, 0($sp) 		
 	lw 	$s0, 4($sp) 			
	lw 	$s1, 8($sp)			
	lw 	$s2, 12($sp) 			
	addiu 	$sp, $sp, 16				
	jr 	$ra 				
	
	
exchange:					
	lb	$t0, 0($a0)			
	lb	$t1, 0($a1)
	sb	$t0, 0($a1)
	sb	$t1, 0($a0)
	jr	$ra	
	
		
				
	 
	 