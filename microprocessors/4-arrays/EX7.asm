#Translate the program into MIPS assembly
#define SIZE 3
#void main(void){
# static char *array[SIZE]={"Array", "of", "pointers"};
# int i;
# for(i=0; i < SIZE; i++){
# 	print_string(array[i]);
# 	print_char('\n');
# }
#} 
	.data
	
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv SIZE, 3
arr: 	.word str1, str2, str3
str1: 	.asciiz "Array"
str2: 	.asciiz "of"
str3: 	.asciiz "pointers"


	.text
	.globl main
main: 	
	li $t0, 0 		#int i = 0
	
for: 	bge $t0, SIZE, endfor
	
	la   $t1, arr
	sll  $t2, $t0, 2
	addu $t2, $t1, $t2
	
	lw $a0, 0($t2)
	li $v0, print_string
	syscall
	
	li $a0, '\n'
	li $v0, print_char
	syscall 
	
	addi $t0, $t0, 1
	j for 
endfor:
	jr $ra
	
