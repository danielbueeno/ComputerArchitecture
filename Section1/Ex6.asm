#The conversion between a binary number to its equivalent Gray Code can be done in the following way:
#gray = bin ^ (bin >> 1);
#Translate the expression above to assembly.

	.data
	.text
	.globl main
main:
	li $t0, 2		#t0= bin= 010
	
	srl $t1, $t0, 1         #$t1 = (bin >> 1)
	xor  $t2, $t0, $t1       #$t2 = bin ^ (bin >> 1);
	
	jr $ra