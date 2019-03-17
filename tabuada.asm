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
	
	addi $t1, $zero, 1 #first number 
	addi $t3, $zero 11 #stop condtion
	
			
	loop_tab :
	
	beq $t1,$t3,end_loop_tab
					
	li $v0,1 
	move $a0, $a1 #print the parameter number
	syscall
	
	li $v0, 4
	la $a0, times # print x
	syscall
	
	li $v0,1 
	move $a0, $t1 #print the actual number
	syscall
	
	li $v0, 4
	la $a0, equals #print =
	syscall
	
	li $v0,1
	mul $t2, $a1, $t1 #print a * i
	move $a0, $t2 #print the result
	syscall
	
	li $v0, 4
	la $a0, n #print \n
	syscall
	
	addi $t1,$t1, 1 #go to the next number
	
	j loop_tab 
	
	end_loop_tab :
	
	lw $a1, 0($sp)
	lw $ra, 4($sp)
	addi $sp,$sp, 8
	jr $ra	
	
			
