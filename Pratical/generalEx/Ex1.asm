	
	
#Register Map
#t1 = min
#t2 = max 
#t0 = n




	.data 
str: 	.asciiz "Digit until 20 integer numbers(zero to finish): "
str2:  	.asciiz "The max and min are: "
str3: 	.asciiz ";"
	.eqv read_int, 5
	.eqv print_int, 1
	.eqv print_string, 4
	
	.text
	.globl main
	
main: 
	la $a0, str
	li $v0, print_string
	syscall 				#print_string(Digit until 20 integer numbers(zero to finish):)
	
	li $t0, 0 				#int n = 0
	li $t1, 0x7FFFFFFF			#min = 0x7FFFFFFF
	li $t2, 0x80000000			#max = 0x80000000
	
do:	li $v0, read_int
	syscall
	move $t3, $v0
	
if:	beq $t3, 0, endIf
	
maxIf:	ble  $t3, $t2, minIf
	move $t2, $t3
	
minIf: 	bge  $t3, $t1, endIf
	move $t1, $t3

endIf: 	addi $t0, $t0, 1

	 
while: 	bge $t0, 20, endWhile
	bne $t3, 0, do
	
endWhile:
	la $a0, str2
	li $v0, print_string
	syscall
	
	move $a0, $t2
	li   $v0, print_int
	syscall
	
	la $a0, str3
	li $v0, print_string
	syscall
	
	move $a0, $t1
	li   $v0, print_int
	syscall
	
	





