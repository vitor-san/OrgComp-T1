.data

times :	.asciiz " X "
equals :	.asciiz " = " 
n :	.asciiz "\n"

.text
	.globl main
	
main :

	addi $a1,$zero, 5
	jal tabuada
	li $v0,10
	syscall



tabuada :

	addi $sp,$sp, -8
	sw $a1, 0($sp)
	sw $ra, 4($sp)
	
	addi $t1, $zero, 1
	addi $t3, $zero 11 #stop condtion
	
			
	loop_tab :
	
	beq $t1,$t3,end_loop_tab
					
	li $v0,1 
	move $a0, $a1
	syscall
	
	li $v0, 4
	la $a0, times
	syscall
	
	li $v0,1 
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, equals
	syscall
	
	li $v0,1
	mul $t2, $a1, $t1 
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, n
	syscall
	
	addi $t1,$t1, 1
	
	j loop_tab
	
	end_loop_tab :
	
	lw $a1, 0($sp)
	lw $ra, 4($sp)
	addi $sp,$sp, 8
	jr $ra	
	
			
