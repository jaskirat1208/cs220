.data
mystring: .asciiz ""
nextline: .asciiz "\n"
.text
main:
#taking input
li $v0,8
li $a1,20
la $a0,mystring
syscall

li $v0,4
li $t0,0

#looping through the string

loop:	lb $t1,mystring($t0)
	beq $t1,0,exit
	sub $t1,$t1,32
	sb $t1,mystring($t0)
	addi $t0,$t0,1
	j loop



#print final string
exit:
li $v0,4
la $a0,mystring
syscall

#end program

li $v0,10
syscall