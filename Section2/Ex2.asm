#Code a program that reads a number, inserted by the user, and shows the binary representation of it.

# Register map:
# value: $t0
# bit: $t1
# i: $t2 

	.data 
str1: 	.asciiz "Insert a number: "
str2:   .asciiz "\nThe binary value is: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char, 11
	
	.text
	.globl main
main:
	la $a0, str1
	li $v0, print_string
	syscall				#print_string(Insert a number: )
	
	li $v0, read_int
	syscall
	move $t0, $v0			#value = read_int()
	
	la $a0, str2
	li $v0, print_string
	syscall				#print_string(\nThe binary value is: )
	
	li $t2, 0			#int i = 0
	li $t4, 0 			#int flag = 0
	
for:    bge  $t2, 32, endfor
	srl  $t1, $t0, 31 		#bit = value >> 31; 
	
if:  	beq  $t4, 1, ifContent
	beq  $t1, 0, endIf
ifContent:
	li $t4, 1			#flag = 1
	
	rem $t3, $t2, 4			#$t3= (i % 4)
ifAux:	
	bne  $t3, 0, endIfAux		#if($t3==0){
	li   $a0, ' '
	li   $v0, print_char 	
	syscall 			#print_char(' ')}

endIfAux:	
	addi $t3, $t1, 0x30
	move   $a0, $t3
	li   $v0, print_char 	
	syscall 			#print_char(0x30 + bit);
	
endIf:
	sll  $t0, $t0, 1		#value = value << 1;
	addi $t2, $t2, 1		#i++
	
	j for

endfor: jr $ra	
	
							
													
																			
																									
																																					
	