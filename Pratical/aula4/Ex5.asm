#Code a program that reads a string (max 20 char) and converts the lowercase letter into uppercase and prints the solution

#Registers Map
#p = $t0
#*p = $t1

	.data 
str1:	.asciiz "Insert a string: "
str2: 	.space 21
	.eqv SIZE, 20
	.eqv print_string, 4
	.eqv read_string, 8
	
	.text
	.globl main
main:
	la $a0, str1
	li $v0, print_string
	syscall					#print_string("Insert a string: ")
	
	la $a0, str2
	li $a1, SIZE
	li $v0, read_string
	syscall					#read_string()
	
	la $t0, str2				#p = str; 
	
while:  lb  $t1, 0($t0)				#$t1 = *p
	beq $t1,'\0', endWhile			#while(*p != '\0'){
	
if:	blt	$t1, 0x61, endif		#	if(*p > 0x61 ||
	bgt	$t1, 0x7a, endif		#	   *p < 0x7a )
	
	addi	$t1, $t1, -0x20			#		*p = *p - 0x20
	
	sb	$t1, 0($t0)			# 	Renova o registo com os novos caracteres
	
endif:	addi	$t0, $t0, 1			#	p++;
	j	while				# }
			

endWhile: 
	la $a0, str2
	li $v0, print_string
	syscall
	
	jr $ra
	
	
	
	
	
	