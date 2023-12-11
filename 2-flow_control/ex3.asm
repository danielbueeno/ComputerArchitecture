#Code a program that transate a gray code value (inserted by the user) to its equivalent binary code

# Registers map:
# gray: $t0
# bin: $t1
# mask: $t2 

	.data 
str1:   .asciiz "Insert a number: "
str2:   .asciiz "\nGray code value: "
str3:   .asciiz "\nBinary Value: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int16, 34

	.text
	.globl main
main:
	la $a0, str1
	li $v0, print_string
	syscall 			#print_string("Insert a number: ")
	
	li   $v0, read_int
	syscall
	move $t0, $v0			#gray = read_int()
	
	srl  $t2,  $t0, 1		#mask = gray >> 1; 
	move $t1, $t0			#bin = gray; 
	
while:  beq $t2, 0, endWhile		#while(mask!=0){

	xor $t1, $t1, $t2		#bin = bin ^ mask;
	srl $t2, $t2, 1			#mask = mask >> 1;
	
	j while
	
endWhile:
	la $a0, str2
	li $v0, print_string
	syscall 			#print_string("\nGray code value: ")
	
	move $a0, $t0
	li   $v0, print_int16
	syscall				#print_int16(gray)
	
	
	la $a0, str3
	li $v0, print_string
	syscall 			#print_string("\nBinary Value: ")
	
	move $a0, $t1
	li   $v0, print_int16
	syscall				#print_int16(gray)
	
	jr $ra
	
	
	
	
	
