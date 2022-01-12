#Code the program in MIPS assembly and test it in MARS.
#define SIZE 4
#int array[4] = {7692, 23, 5, 234}; 
#void main (void){
# int *p;
# int *plast; /
# int sum = 0;
# p = array; 
# plast=array+SIZE-1;
# while( p <= plast){
# 	sum = sum + (*p);
# p++; 
# }
# print_int10(soma);
#}
	.data 
	
arr: 	.word 7692,23,5,234
	.eqv SIZE, 4
	.eqv print_int10, 1
	
	.text
	.globl main
main: 
	li  $t0, 0 			#int sum = 0
	la  $t1, arr			#p = array
	
	#plast = array+SIZE;
	li  $t2, SIZE
	sll $t2, $t2, 4
	addu $t2, $t2, $t1
	
while: 
	bgt $t1, $t2, endw
	
	# sum = sum + (*p);
	lw  $t3, 0($t1)
	add $t0, $t0, $t3
	
	addiu $t1, $t1, 4		#p++; 
	j while

endw:
	# print_int10(soma);
	move $a0, $t0
	li $v0, print_int10
	syscall
	
	jr $ra
	
	 