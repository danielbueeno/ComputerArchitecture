#Create a program that implements the expression y = 2x + 8

	.data
	.text
	.globl main

main: 	ori $t0,$0, 5                     # x = $t0 = 5;
        ori $t2,$0, 8			  # $t1 = 8;
        
	add  $t1, $t0, $t0		  # $t1 = 2x;
	add  $t1, $t1, $t2		  # $t1 = 2x + 8; (if it was a subtraction:sub  $t1, $t1, $t2 )
	
	jr $ra				  # end progam 