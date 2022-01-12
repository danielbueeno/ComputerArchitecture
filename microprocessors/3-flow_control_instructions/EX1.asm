#Code the following program in MIPS assembly.
#void main(void){
# int sum, value, i;
# for(i=0, sum=0; i < 5; i++){
# 	print_string("Enter a number: ");
# 	value = read_int();
# 	if(value > 0)
# 		sum = sum + value;
# 	else
# 		print_string("Ignored value\n");
# }
# print_string("The sum of the positives is: ");
# print_int10(sum);
#}

	.data 
	
str1:	.asciiz "Enter a number: "
str2:   .asciiz "Ignored value\n"
str3:   .asciiz "The sum of the positives is: "

	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv read_int, 5
	
	.text
	.globl main 
main: 
	li $t0, 0			#int i = 0 
	li $t2, 0			#int sum = 0

for:	bge $t0, 5, endfor 
	
	#print_string("Enter a number: ");
	la $a0, str1
	li $v0, print_string
	syscall
	
	#value = read_int()
	li $v0, read_int 
	syscall
	move $t1, $v0 
	
if: 	blez $t1, else
	add $t2, $t2, $t1		#sum = sum + value 
	j endif
	
else:  
	#print_string("Ignored value\n")
	la $a0, str2
	li $v0, print_string
	syscall 
endif:
	addi $t0, $t0, 1		# i++
	j for 
	
endfor:
	# print_string("The sum of the positives is: ");
	la $a0, str3
	li $v0, print_string
	syscall
	
	#print_int10(sum);
	move $a0, $t2
	li $v0, print_int10
	syscall
	
	jr $ra
	
	 
	
	
