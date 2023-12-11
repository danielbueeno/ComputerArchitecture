#Code an assembly progam that determines the result of the biwise logical operations AND, OR, NOR, XOR
	
	.data
	
	.text
	.globl main
main: 	li $t0, 0x1234				#$t0 = val_1 
	li $t1, 0x000F				#$t1 = val_2
	
	and $t2, $t0, $t1			#$t2 = val_1 & val_2 (and bitwise)
	or  $t3, $t0, $t1			#$t3 = val_1 | val_2 (or bitwise)
	nor $t4, $t0, $t1			#$t4 = val_1 nor val_2
	xor $t5, $t0, $t1			#$t5 = val_1 ^ val_2
	
	jr $ra					#end program 
	