#Translate to Assembly the following code.

#int strlen(char *s);
#int main(void){
# static char str[]="Computer Architecture I";
# print_int10(strlen(str));
# return 0;
#}
#
#int strlen(char *s){
# int len=0;
# while(*s++ != '\0')
# len++;
# return len;
#}

	.data
str:    .asciiz "Computer Architecture I"
	.eqv print_int10, 1
	
	.text
	.globl main
main: 
	#Store the end program
	addiu $sp, $sp, -4
	sw    $ra, 0($sp)
	
	#call the function
	la $a0, str
	jal strlen
	
	#get the end program
	lw $ra, 0($sp)
	
	#print_int10(strlen)
	move $a0, $v0
	li $v0, print_int10
	syscall 
	
	jr $ra
	
	
strlen: 
	li $t0, 0		#int len = 0
while: 
	lb $t1, 0($a0)
	addiu $a0, $a0, 1
	beq   $t1, '\0', endw
	addi $t0, $t0, 1
	j while
endw: 
	move $v0, $t0
	jr $ra