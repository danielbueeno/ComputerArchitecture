#The conversion of a quantity encoded in natural binary to the equivalent in Gray code can be done as follows:
#gray = bin ^ (bin >> 1);
#Translate the previous expression into assembly, using registers $t0 and $t1 for the storage of variables "bin"
#and "gray", respectively

	.data 
	.text
	.globl main
main:
	li  $t0, 2	    	#$t0 = bin
	srl $t1, $t0, 1   	#$t1 = bin >> 1
	xor $t1, $t0, $t1   	#$t1 = $t0 ^ $t1 
	
	jr $ra
	