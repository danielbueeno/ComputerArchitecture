#The conversion of a quantity encoded in Gray code to natural binary (the operation inverse of the one described in 
#the previous paragraph) can be done, in a non-iterative way and for 8-bit quantities, as follows:
#num = gray;
#num = num ^ (num >> 4);
#num = num ^ (num >> 2);
#num = num ^ (num >> 1);
#bin = num;
#Translate the previous program into assembly, using registers $t0, $t1 and $t2 for the
#storage of variables "gray" "num" and "bin", respectively

	.data
	.text
	.globl main
main: 
	li   $t0, 2   		#$t0 = gray 
	move $t1, $t0		#num($t1) = gray
	srl  $t1, $t1, 4	#num = num >> 4
	xor  $t1, $t0, $t1      #num = gray ^ (num >> 4)
	srl  $t0, $t1, 2        #$t0 = num >> 2
	xor  $t1, $t1, $t0      # num = num ^ (num>>2)
	srl  $t0, $t1, 1       	#$t0 = num >> 1
	xor  $t1, $t1, $t0      #num = num ^ (num>>1)
	move $t2, $t1		#bin = num 
	jr   $ra 