#Translate to assembly the following code:
#	print_string("Insert 2 numbers:");
#	a = read_int();
#	b = read_int();
#	print_string("The sum of the two numbers is: ");
#	print_int10(a + b); 

	.data 
str1:	.asciiz "Insert 2 numbers:\n"
str2:	.asciiz "The sum of the two numbers is:" 
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	
	.text
	.globl main
main: 
	la $a0, str1
	li $v0, print_string
	syscall				#print_string("Insert 2 numbers:")
	
	
	li $v0, read_int
	syscall
	move $t0, $v0			#$t0 = read_int()
	
	li $v0, read_int
	syscall
	move $t1, $v0			#$t1 = read_int()
	
	add $t2, $t0, $t1
	
	la $a0, str2
	li $v0, print_string
	syscall				#print_string("The sum of the two numbers is:")
	
	move $a0, $t2
	li   $v0, print_int10
	syscall				#print_int10(a + b)
	
	
	jr $ra
