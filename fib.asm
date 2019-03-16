.data

	str :	.asciiz "Fatorial\n"
	n :	.asciiz "\n"

.text 
	.globl main
	
main :
	li $v0,4
	la $a0,str
	syscall
	
	addi $a1,$zero,4 #fibonachi of 4		
	addi $a2,$zero,6 #fibonachi of 6
	jal fibonachi_seg
	
	li $v0,10
	syscall
	
	
	
fibonachi_seg :
	addi $sp,$sp,-12 
	sw $a1, 0($sp)
	sw $a2, 4($sp)		
	sw $ra, 8($sp)
	
	move $t4,$a1 #stop condition
	addi $t4,$t4, -1
	
	loop_seg :
		beq $a2,$t4,end_loop_seg
		jal fibonachi
		move $a0,$v0	
		li $v0,1
		syscall
		li $v0,4
		la $a0,n
		syscall
	
		addi $a2,$a2,-1
		
		j loop_seg
		
	end_loop_seg :
		lw $a1, 0($sp)		
		lw $a2, 4($sp)
		lw $ra, 8($sp)
		addi $sp,$sp,12 
		
		jr $ra
	
	
	
			
fibonachi :
	addi $sp,$sp,-8 
	sw $a2, 0($sp)		
	sw $ra, 4($sp)
	
	addi $t0,$zero,1 #fib(0)
	addi $t1,$zero,1 #fib(1)
	addi $t3,$zero,1 #stop condition
	
	loop :
		beq $a2,$t3,end_loop
		add $v0,$t0,$t1
		move $t0,$t1
		move $t1,$v0
		addi $a2,$a2,-1
		
		j loop
		
	end_loop :
		lw $a2, 0($sp)		
		lw $ra, 4($sp)
		addi $sp,$sp,8 
		
		jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	