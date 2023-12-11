#Code a program that read 10 values, sort them and prints the sorted array(use bubble sort alg )

	.data 
arr: 	.space 40
str:    .asciiz "Insert 10 numbers: \n"
str2: 	.asciiz "\nSorting ...\n"

	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv print_string,4
	.eqv print_int,1
	.eqv read_int,5
	
	.text
	.globl main
main: 
	la $a0, str
	li $v0, print_string
	syscall 
	
	la   $t0, arr
	li   $t1, SIZE
	
	sll  $t2, $t1, 2
	addu $t2, $t2, $t0
	
insertion_for:
	 bgeu $t0, $t2, endInsertionFor
	 
	 li $v0, read_int
	 syscall
	 
	 sw $v0, 0($t0)
	 
	 addiu $t0, $t0, 4
	 j insertion_for

endInsertionFor: 
	la $a0, str2
	li $v0, print_string
	syscall 
do:					#	do{
	li	$t1, FALSE		#		houveTroca = FALSE
	li	$t0, 0			#		i = 0
while1:	bge	$t0, 9, endw1		#		while(i < SIZE-1) {
	la	$t2, arr		#			int *p = &(lista[0])
	sll	$t3, $t0, 2		#			int tmp1 = i *4;
	addu	$t3, $t2, $t3		#			tmp1 = lista+i;
	
	lw	$t4, 0($t3)		#			int aux1 = lista[i];	//$t4 - aux1
	lw	$t5, 4($t3)		#			int aux2 = lista[i+1];  //$t5 - aux2
if:	ble	$t4, $t5, endif		#			if( lista[i] > lista[i+1])
	sw	$t4, 4($t3)		#				lista[i+1] = aux;
	sw	$t5, 0($t3)		#				lista[i] = aux2;
	li	$t1, TRUE		#				houveTroca = True;	
endif:					#			}
	addi	$t0, $t0, 1		#			i++
	j	while1			#		}
endw1:					#
					#
endd:	beq	$t1, TRUE, do		#	} while(houveTroca == True);
	li $t2, 0
printFor: 
	
	bge $t2, SIZE, endPrintFor
	
	sll   $t3, $t2, 2
	addu  $t3, $t2, $t0
	lw    $t3, 0($t3)
	
	move $a0, $t3
	li   $v0, print_int
	syscall
	
	addi $t2, $t2, 1
	j printFor

endPrintFor: 
	jr $ra
 	
 	
 	
 	
	