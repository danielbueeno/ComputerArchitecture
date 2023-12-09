#Code a program that converts a natural binary number to its equivalent gray code. Ex: gray = bin ^ (bin >> 1); 

 	.data
 	
 	 .text
 	 .globl main
main: 	 li  $t0, 0010			#t0 = 2 = bin
	 srl $t1, $t0, 1		#$t1 = bin >> 1
	 xor $t2, $t0, $t1              #gray = $t2 = $t0 ^ $t1 (gray = bin ^ (bin >> 1))
	 jr  $ra