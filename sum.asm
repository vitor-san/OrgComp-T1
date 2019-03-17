.data 
	plus :	.asciiz " + "
	equals :	.asciiz " = " 
	n :	.asciiz "\n"
	
.text
	.globl main
	
main :
	
	addi $a1,$zero, 4
	addi $a2,$zero, 6
	
	jal sum
	
	li $v0,10
	syscall
	
sum :
	addi $sp,$sp,-12 
	sw $a1, 0($sp) #the first argument
	sw $a2, 4($sp) #the second argument		
	sw $ra, 8($sp)
	
	li $v0,1
	move $a0,$a1 #print a
	syscall
	
	li $v0,4
	la $a0,plus #print -
	syscall
	
	li $v0,1
	move $a0,$a2 #print b
	syscall
	
	li $v0,4
	la $a0,equals #print =
	syscall
	
	
	add $v0,$a1,$a2 #a+b
	move $a0,$v0 #print the result
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,n #print \n
	syscall
	
	lw $a1, 0($sp) #the first argument
	lw $a2, 4($sp) #the second argument		
	lw $ra, 8($sp)
	addi $sp,$sp,12 
	
	jr $ra
	
	
	






