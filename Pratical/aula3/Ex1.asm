#Code a program that receives 5 integer values and show the sum of the positives.

# Register Map:
# sum: $t0
# value: $t1
# i: $t2 

	.data
str1:   .asciiz  "Insert a number:\n"
str2: 	.asciiz  "Ignored value\n"
str3: 	.asciiz  "The positives sum: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int, 1
	.text
	.globl main
	
main:
	li $t0, 0		#int sum = 0
	li $t1, 0		#int value = 0
	li $t2, 0		#int i = 0
	
for:	bge $t2, 5, endfor
	
	la $a0, str1	
	li $v0, print_string
	syscall			#print(Insert a number:\n")
	
	li $v0, read_int
	syscall			#read_int()
	move $t1, $v0		#value = read_int()
	
if:	bltz $t1, else		#if(value>0){
	add  $t0, $t0, $t1	# sum = sum + value}
	j endIf
	
else:	la $a0, str2
	li $v0, print_string
	syscall			#print(Ignored value\n")
	
endIf:	addi $t2, $t2, 1		#i++
	j   for			# }
	
endfor:	la $a0, str3
	li $v0, print_string
	syscall			#print(The positives sum: )
	
	move $a0, $t0
	li   $v0, print_int
	syscall 		#print_int(sum)
	
	jr $ra
	
	
	
	
	
	
	
	