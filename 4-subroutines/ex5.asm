#Code a function that determines the representation of the integer "n" in base "b",placing the result in the character array "s",in ASCII.


	.data 
s: 	.space 33
	.eqv read_int, 5
	.eqv print_string, 4
	
	.text
	.globl main
main: 	
	addiu $sp, $sp, -4
	sw    $ra, 0($sp)
	
do: 	li $v0, read_int
	syscall 
	move $s0, $v0				#val = read_int()
	
	move $a0, $s0
	li   $a1, 2
	la   $a2, s
	jal  itoa				#itoa(val, 2, str)
	la $a0, s
	li $v0, print_string
	syscall 				#print_string( itoa(val, 2, str) ); 
	
	move $a0, $s0
	li   $a1, 8
	la   $a2, s
	jal  itoa				#itoa(val, 8, str)
	la $a0, s
	li $v0, print_string
	syscall 				#print_string( itoa(val, 8, str) ); 
	
	move $a0, $s0
	li   $a1, 16
	la   $a2, s
	jal  itoa				#itoa(val, 16, str)
	la $a0, s
	li $v0, print_string
	syscall 				#print_string( itoa(val, 16, str) ); 
	
while:  bne $s0, $0, do				#while(val != 0); 

	lw    $ra, 0($sp)
	addiu $sp, $sp, 4
	
	move $v0, $0				# return 0
	jr   $ra				#end program
	

itoa:
	addiu $sp, $sp, -20
	sw    $ra, 0($sp)
	sw    $s0, 4($sp)
	sw    $s1, 8($sp)
	sw    $s2, 12($sp)
	sw    $s3, 16($sp)
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	
	move $s3, $a2			#char *p = s; 
	
doItoa: 
	rem  $t0, $s0, $s1		#digit = n % b
	div  $s0, $s1		        #n / b; 
	mflo $s0			#n= n / b; 	
	
	move $a0, $t0			
	jal toascii			#toascii( digit ); 
	
	sb $v0, 0($s3)			#*p++ = toascii( digit ); 
	addiu	$s3, $s3, 1
	
whileItoa:
	bgtz $s0, doItoa		#while( n > 0 ); 

	sb   $0, 0($s3)			#*p = '\0'; 
	
	move $a0, $s2
	jal strrev			#strrev( s ); 
	
	move $v0, $s2			#return s; 
	

	lw    $ra, 0($sp)
	lw    $s0, 4($sp)
	lw    $s1, 8($sp)
	lw    $s2, 12($sp)
	lw    $s3, 16($sp)
	addiu $sp, $sp, 20
	
	jr $ra
	

toascii: 
	addiu $t0, $t0, '0'		#v += '0';
if: 	ble   $t0, '9', endif		#if( v > '9' )
	addiu $t0, $t0, 7		#'A' - '9' - 1 
endif: 	move  $v0, $t0			# return v; 
	jr    $ra
	

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
		
	
	

	
	
	
	
	
	
