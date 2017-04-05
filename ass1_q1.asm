func :
		li $t0 ,5
		mult $t0 $t1
		mflo $t5
		li $t0 ,7 
		mult $t0 $t2
		mflo $t6
		add  $t7 $t6  $t5
		sub $a0 $zero $t7
		blt $a0 -35 IF
		bge $a0 35 ELIF
		add $v1 $a0 $zero
		jr $ra

IF:
	li $v1 -35
	jr $ra
	
ELIF:
	li $v1 35
	jr $ra


main:
		li $t1 ,54
		li $t2 ,33
		j func
		    

			