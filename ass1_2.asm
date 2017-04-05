.data
	mystr:  .asciiz ""
	nextline: .asciiz "\n"

.text

.globl main
#input


main:
	li $v0 5
	syscall
	add $t0 $v0 $zero

	li $v0, 8
	la $a0, mystr

	add $a1,$t0, $zero
	syscall
	#looping the loop
	li $t0,0 
	loop:
		lb $t1, mystr($t0)
		beq $t1, 0, exit
		bge $t1, 97, Label
		Label:
			bge $t1,97,Label1
			j contd
		Label1:
			sub $t1, $t1, 32
			j contd
		contd:
			sb $t1, mystr($t0)
		add $t0, $t0, 1		
		j loop
	#output
	exit:
	li $v0 ,4
	la $a0, mystr

	syscall

 