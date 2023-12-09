# Code a program that calculates and prints the sum of the elements of an array with 4 positions - using array with index.

#Registers Map
# sum: $t0
# i: $t1
# arr: $t2
# arr+i: $t3
# arr[i]: $t4  

	.data 
arr: 	.word 4, 5, 5, 5
	.eqv SIZE, 4
	.eqv print_int10, 1
	
	.text
	.globl main
main: 
	li $t0, 0  			#int sum = 0
	li $t1, 0			#int i = 0
	la $t2, arr			#$t2 = arr
	
	li   $t5, SIZE
	addi $t5, $t5, -1		#SIZE-1

while:  bgt $t1, $t5, endWhile
	
	sll  $t3, $t1, 2
	addu $t3, $t2, $t3		#$t3= arr+i
	lw   $t4, 0($t3)		#$t4 = arr[i]
	
	add $t0, $t0, $t4		#sum = sum + arr[i]
	addi $t1, $t1, 1		#i++
	j while

endWhile: 
	move $a0, $t0
	li   $v0,print_int10
	syscall
		
	