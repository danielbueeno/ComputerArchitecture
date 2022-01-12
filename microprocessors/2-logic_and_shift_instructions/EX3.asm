#Translate to assembly, and test in MARS the following sequence of C code:
#print_string("Enter 2 numbers ");
#a = read_int();
#b = read_int();
#print_string("The sum of the two numbers is: ");
#print_int10(a + b);

	.data 
str1: 	.asciiz "Enter 2 numbers: \n"
str2:   .asciiz "The sum of the two numbers is: "
	
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv read_int, 5
	
	.text
	.globl main
main: 
	#print_string(Enter 2 numbers:) 
	la $a0, str1
	li $v0, print_string
	syscall
	
	#$t0 = read_int()
	li $v0, read_int
	syscall
	move $t0, $v0
	
	#$t1 = read_int()
	li $v0, read_int
	syscall
	move $t1, $v0
	
	#print_string("The sum of the two numbers is: ");
	la $a0, str2
	li $v0, print_string
	syscall
	#a + b 
	add $t2, $t0, $t1
	
	#print_int10(a + b);
	move $a0, $t2
	li   $v0, print_int10
	syscall
	
	
	