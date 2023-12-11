# Code a program that calculates and prints the sum of the elements of an array with 4 positions - using pointers.

#Registers Map
# p: $t0
# pLast:$t1
# *p $t2
# sum: $t3

	.data 
arr: 	.word 5, 5, 5, 5
	.eqv SIZE, 4
	.eqv print_int10, 1
	
	.text
	.globl main
main: 
	li $t3, 0			#sum = 0;
	la $t0, arr			#p = array; 
	
	li    $t4, SIZE
	addi  $t4, $t4, -1
	sll   $t4, $t4, 2
	addu  $t1, $t0, $t4		#pLast = array+SIZE-1;
	
while:  bgt  $t0, $t1, endWhile 	#while( p <= pLast ) {

	lw   $t2, 0($t0)
	add  $t3, $t3, $t2		#sum = sum + (*p); 
	
	addiu $t0, $t0, 4		#p++
	j while

endWhile: 
	move $a0, $t3
	li   $v0, print_int10
	syscall
	
	jr $ra
	
	
	
	