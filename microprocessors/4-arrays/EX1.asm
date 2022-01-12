#Code the program in MIPS assembly and test it in MARS.$t4)
#define SIZE 20
#void main (void){
# static char str[SIZE+1];
# int num, i;
# read_string(str, SIZE);
# num = 0;
# i = 0;
# while( str[i] != '\0' ){
# 	if( (str[i] >= '0') && (str[i] <= '9') )
# 		num++;
# 	i++;
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
	#read_string(str, SIZE);
	la $a0, str 
	li $a1, SIZE
	li $v0, read_string
	syscall
	
	li $t0, 0			#int num = 0
	li $t1, 0			#int i = 0
	
while:
	la   $t2, str 			#$t2 = &str[0]
	addu $t3, $t2, $t1		#$t3 = &str[0+i]
	lb   $t4, 0($t3)		#$t4 = *str[0+i]
	beq  $t4, '\0', endwhile
	
if: 
	blt $t4, '0', endif
	bgt $t4, '9', endif
	
	addi $t0, $t0, 1
endif:
	addi $t1, $t1, 1
	j while
endwhile:
	#print_int10(num);
	move $a0, $t0
	li   $v0, print_int10
	syscall
	
	jr $ra
	
	
	