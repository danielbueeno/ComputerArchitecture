#Translate the program into MIPS assembly.
#define SIZE 5
#void main(void){
# static int list[SIZE]; 
# int i;
# for(i = 0; i < SIZE; i++){
# 	print_string("\nEnter a number: ");
# 	list[i] = read_int();
# }

	.data 
	
arr:	.space 20
str:	.asciiz "\nEnter a number: "
	.eqv read_int, 5
	.eqv print_string,  4
	.eqv SIZE, 5
	
	.text
	.globl main
main: 
	li $t0, 0 		#int i = 0
	
for:    bge $t0, SIZE, endfor 

	#print_string("\nEnter a number: ");
	la $a0, str
	li $v0, print_string
	syscall 
	
	#read_int();
	li $v0, read_int
	syscall
	
	#list[i]
	la   $t1, arr			#$t1 = &arr[0]
	sll  $t2, $t0, 2
	addu $t2, $t2, $t1
	
	#list[i] = read_int();
	sw  $v0, 0($t2)
	
	addi $t0, $t0, 1
	j for
endfor:
	jr $ra
	
	
	
	
	