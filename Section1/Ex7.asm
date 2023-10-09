#The conversion between gray code to binary code, can be done by the following way:
#num = gray;
#num = num ^ (num >> 4);
#num = num ^ (num >> 2);
#num = num ^ (num >> 1);
#bin = num; 

#Convert that to assembly.

	.data
	.text
	.globl main

main: 	li  $t0, 2

	srl $t1, $t0, 4		#$t1 = (num >> 4)
	xor $t1, $t0, $t1	#num = $t1 = num ^ ($t1)
	
	srl $t2, $t1, 2		#$t2 = ($t1 >> 2);
	xor $t2, $t1, $t2 	#num = $t2 = $t1 ^ ($t2)
	
	srl $t3, $t2, 1		# $t3 = ($t2 >> 1)
	xor $t3, $t2, $t3	# num = $t2 ^ ($t3);
	
	move $t4, $t3 		#$t4 = $t3 --> bin = num 
	
	jr $ra
	
	