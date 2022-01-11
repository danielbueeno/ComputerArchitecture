#Make the changes to the program you wrote in exercise 2 so that the keyboard reads the x value and printing the 
#result of the y calculation on the screen. Add the necessary instructions to the program to print the result of 
#the expression also using the print_int16() system call.Finally, add the print_intu 10() system call.

	.data 
	
	.eqv read_int, 5
	.eqv print_int16, 34
	.eqv print_intu10, 36
	
	.text
	.globl main
main:
	#$t0 = x 
	li $v0, read_int
	syscall
	move $t0, $v0
	
	add $t0, $t0, $t0 	#$t0 = $t0x2
	sub $t1, $t0, 8		#$t1 = 2x - 8
	
	#print_int16($t1)
	move $a0, $t1
	li   $v0, print_int16
	syscall
	
	#print_intu10($t1)
	#move $a0, $t1
	#li   $v0, print_intu10
	#syscall
	
	jr $ra
	
	
	
	
	
	
	