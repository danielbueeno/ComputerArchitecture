#Code a program that reads a string from the keyboard and counts how many numeric chars it have. (Use array index)

# Mapa de registos
# num: $t0
# i: $t1
# str: $t2
# str+i: $t3
# str[i]: $t4  

	.data 
str:	.space 20
	.eqv SIZE, 20
	.eqv read_string, 8
	.eqv print_int10, 1
		
	.text
	.globl main
main: 
	la $a0, str
	li $a1, SIZE
	li $v0, read_string
	syscall				#read_string(str, SIZE); 
	
	li $t0, 0			#int num = 0
	li $t1, 0 			#int i = 0
	
while: 	
	la   $t2, str			#$t2 = &str[0]
	addu $t3, $t2, $t1		#$t3 = &str[i]  
	lb   $t4, 0($t3)		#$t4 = str[i] 
	
	beq  $t4, '\0', endWhile	#while(str[i]!='\n'){
	
if: 	blt  $t4, '0', endIf
	bgt  $t4, '9', endIf		#(str[i] >= '0') && (str[i] <= '9')
	addi $t0, $t0, 1
endIf:
	addi $t1, $t1, 1		#int i++
	j while
					#}
endWhile: 

	move $a0, $t0
	li   $v0, print_int10
	syscall
	
	jr $ra
	
	
	
	
	
	