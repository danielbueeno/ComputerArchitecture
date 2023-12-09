#Code a program that reads from the user 5 values and store them in an array

#Register Map
# i: $t0
# lista: $t1
# lista + i: $t2 

	.data
	
arr:	.space 20
str: 	.asciiz "\nInsert a number: "
	.eqv SIZE, 5
	.eqv print_string, 4
	.eqv read_int, 5
	
	.text
	.globl main
main: 
	li $t0, 0		#int i = 0
for: 
	bge $t0, SIZE, endFor
	
	la $a0, str
	li $v0, print_string
	syscall
	
	li $v0, read_int
	syscall			#read_int()
	
	la   $t1, arr		#$t1= &arr
	sll  $t2, $t0, 2 	
	addu $t2, $t1, $t2	#$t2 = arr[i]
	
	
	sw $v0, 0($t2)		#arr[i] = read_int()
	
	addi $t0, $t0, 1	#i++
	j    for
endFor:
	jr $ra