#Code the program into MIPS assembly.
#define SIZE 10
#void main(void){
# static int list[]={8, -4, 3, 5, 124, -15, 87, 9, 27, 15};
# int *p; // Declare a pointer to an integer (reserve
# print_string("\nContent of array:\n");
# for(p = list; p < list + SIZE; p++){
# 	print_int10( *p );
# 	print_string("; ");
# }
#}

	.data
	
str:	.asciiz "\nContent of array:\n"
str2: 	.asciiz ";"
arr: 	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
	.eqv SIZE, 40
	.eqv print_string, 4
	.eqv print_int10,1
	
	.text
	.globl main
main: 
	# print_string("\nContent of array:\n");
	la $a0, str
	li $v0, print_string
	syscall
	
	la $t0, arr 			#p = list
	addiu $t1, $t0, SIZE		#$t1 = list + SIZE

for: 	bgeu $t0, $t1, endfor 

	lw $t2, 0($t0)			#$t2 =  *p
	
	#print_int10( *p );
	move $a0, $t2
	li   $v0, print_int10
	syscall
	
	#print_string("; ");
	la $a0, str2
	li $v0, print_string
	syscall 
	
	addiu $t0, $t0, 4			#p++
	j for 
	
endfor:
	jr $ra 
	