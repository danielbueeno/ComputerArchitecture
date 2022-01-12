#An alternative way of writing the code in question 1 is to use a pointer to 
#access each of the array elements.
#define SIZE 20
#void main (void){
# static char str[SIZE+1]; // Reserve space for an array of 
# int num = 0;
# char *p; // Declare a pointer to character
# read_string(str, SIZE);
# p = str; 
# while( *p != '\0' ) // Access the byte pointed to by{
# if( (*p >= '0') && (*p <= '9') )<
# 	num++;
# p++;
# }
# print_int10(num);
#}

	.data 
	.eqv SIZE, 20
	.eqv read_string, 8
	.eqv print_int10, 1

str:	.space SIZE
	
	.text
	.globl main
main: 
	#read_string()
	la $a0, str
	li $a1, SIZE
	li $v0, read_string
	syscall
	
	li $t0, 0			#int num = 0
	la $t1, str			#p = &str[]
while:
	lb  $t2 0($t1)			#$t2 = *$t1
	beq $t2, '\0',endw

if: 	blt $t2, '0', endif
	bgt $t2, '9', endif 
	
	addi $t0, $t0, 1		#num ++
	
endif:
	addiu $t1, $t1, 1
	j while

endw:
	#print_int10(num);
	move $a0, $t0
	li $v0, print_int10
	syscall
	jr $ra