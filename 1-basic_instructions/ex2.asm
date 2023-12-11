#Create a program that implements the expression y = 2x + 8. The x variable must be an user input, and y must be printed.


	.data
	.text
	.globl main

main: 	
	li $v0, 5
	syscall
	move $t0,$v0			# x = $t0 = user input;
	
        ori $t2,$0, 8			# $t1 = 8;
        
	add  $t1, $t0, $t0		# $t1 = 2x;
	add  $t1, $t1, $t2		# $t1 = 2x + 8; (if it was a subtraction:sub  $t1, $t1, $t2 )
	
	move $a0, $t1
	li   $v0, 1
	syscall  			#print_int10(y)
	
	jr $ra				# end progam 