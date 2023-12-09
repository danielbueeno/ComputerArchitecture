#Code a program that do a multiplication between two integers 

#Registers map
#mdor = $t0
#mdo = $t1
#i = $t2
#res= $t3

	.data 
str1: 	.asciiz "Insert two numbers: \n"
str2: 	.asciiz "Result: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	
	.text
	.globl main
main: 
	la $a0, str1 
	li $v0, print_string
	syscall				#print_string("Insert two numbers: ")
	
	li $v0, read_int
	syscall
	andi $t0, $v0, 0x0F		#mdor = read_int() & 0x0F; 
	
	li $v0, read_int
	syscall
	andi $t1, $v0, 0x0F		#mdo = read_int() & 0x0F; 
	
	li $t2, 0			#int i = 0;
	li $t3, 0			#int res = 0;
	
while:	beq $t0, 0, endWhile	
	bge $t2, 4, endWhile
	
	li   $t4, 0x00000001
	and  $t5, $t0, $t4
if: 	beq  $t5, 0, endIf		#if( (mdor & 0x00000001) != 0 ) 

	add $t3, $t3, $t1		#res = res + mdo;
endIf:
	sll $t1, $t1, 1			#mdo = mdo << 1; 
	srl $t0, $t0, 1 		#mdor = mdor >> 1; 
	
	addi $t2, $t2, 1		#i++
	j while

endWhile:
	la $a0, str2 
	li $v0, print_string
	syscall				#print_string("Result: ")
	
	move $a0, $t3
	li   $v0, print_int10
	syscall				#print_int10(res); 
	
	jr $ra
	