#Bubble sort not optmized

	.data 
str1:	.asciiz "\nEnter a number: "
str2:	.asciiz "Array content: "
str3:   .asciiz "; "

	.align 2

arr: 	.space 40
	.eqv FALSE, 0
	.eqv TRUE, 1
	.eqv SIZE, 10
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.text
	.globl main
main:
	li $t0, 0		#int i = 0
	
while: 	bge $t0, SIZE, endw
	
	#print_string("Enter a number: ")
	la $a0, str1
	li $v0, print_string
	syscall
	
	#$v0 =read_int()
	li $v0, read_int
	syscall
	
	#arr[i] = $v0
	la   $t2, arr
	sll  $t1, $t0, 2
	addu $t2, $t2, $t1
	sw   $v0, 0($t2)
	
	addi $t0, $t0, 1		#i++
	j while
	
endw:
do:
	li $t1, FALSE
	li $t0, 0			# int i = 0
	
while0:	bge $t0, 9, endw0
	
	#$t3 = arr[i]
	la   $t2, arr 
	sll  $t3, $t0, 2
	addu $t3, $t2, $t3
	
	lw $t4, 0($t3)			#$t4 = arr[i]
	lw $t5, 4($t3)			#$t5 = arr[i+1]
	
if: 	ble $t4, $t5, endif
	sw  $t4, 4($t3)
	sw  $t5, 0($t3)
	li  $t1, TRUE
endif:
	addi $t0, $t0, 1
	j while0
endw0:

while1: beq $t1, TRUE, do

	#print_string("Array content")
	la $a0, str2
	li $v0, print_string
	syscall
	
	li $t0, 0 			#int i = 0
	
while2:	bge $t0, SIZE, endw2
	
	la   $t2, arr
	sll  $t3, $t0, 2
	addu $t3, $t2, $t3
	
	lw $a0, 0($t3)
	li $v0, print_int10
	syscall
	
	#print_string(;)
	la $a0, str3
	li $v0, print_string
	syscall
	
	addi $t0, $t0, 1		#i++
	j while2

endw2:
	jr $ra
	
