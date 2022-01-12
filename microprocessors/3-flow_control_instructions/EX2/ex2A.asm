#Code the following program in MIPS assembly.
#void main(void){
# unsigned int value, bit, i;
# print_string("Enter a number: ");
# value = read_int();
# print_string("\nThe binary value is: ");
# for(i=0; i < 32; i++){
#	if((i % 4) == 0) // resto da divisão inteira
#		print_char(' ');
# 	bit = value & 0x80000000; // isolate bit 31
# 	if(bit != 0)
# 		print_char('1');
# 	else
# 		print_char('0');
# value = value << 1; // 1-bit shift left
# }
#}

	.data 
	
str1: 	.asciiz "Enter a number: "
str2:	.asciiz "\nThe binary value is: "

	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	
	.text
	.globl main
main: 
	#print_string("Enter a number: ");
	la $a0, str1
	li $v0, print_string 
	syscall 
	
	#value = read_int();
	li $v0, read_int 
	syscall
	move $t0, $v0
	
	#print_string("\nThe binary value is: ");
	la $a0, str2
	li $v0, print_string
	syscall
	
	li $t1, 0 				#int i = 0
	
for: 	bge  $t1, 32, endfor 

	rem  $t3, $t1, 4			#(i % 4)
if1:    bnez $t3,endif1				#if((i % 4) == 0)

	#print_char(' ');
	li $a0, ' '
	li $v0, print_char
	syscall
	
endif1:	andi $t2, $t0, 0x80000000		#bit = value & 0x80000000; // isolate bit 31
	
if2:	beqz $t2, else

	# print_char('1');
	li $a0, '1'
	li $v0, print_char 
	syscall 
	
	j endif2
else: 
	# print_char('0');
	li $a0, '0'
	li $v0, print_char
	syscall 
endif2:
	sll  $t0, $t0, 1				# value = value << 1; // 1-bit shift left
	addi $t1, $t1, 1				#i++
	j for
endfor:
	jr $ra
