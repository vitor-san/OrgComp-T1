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
	sw $a1, 0($sp) #the first argument
	sw $a2, 4($sp) #the second argument		
	sw $ra, 8($sp)
	
	move $t4,$a2 #stop condition
	addi $t4,$t4, 1 #end the loop at a-1
	
	loop_seg : 
		beq $a1,$t4,end_loop_seg 
		jal fibonachi #function that calculate the fibonachi of a2
		move $a0,$v0	#the return of fibonachi function
		li $v0,1  #print the return
		syscall
		li $v0,4
		la $a0,n #print \n
		syscall
	
		addi $a1,$a1,1 # a = a + 1
		
		j loop_seg
		
	end_loop_seg :
		lw $a1, 0($sp)		
		lw $a2, 4($sp)
		lw $ra, 8($sp)
		addi $sp,$sp,12 
		
		jr $ra
	
	
	
			
fibonachi :
	addi $sp,$sp,-8 
	sw $a1, 0($sp)		
	sw $ra, 4($sp)
	
	addi $t0,$zero,1 #fib(0)
	addi $t1,$zero,1 #fib(1)
	addi $t3,$zero,1 #stop condition
	
	loop :
		beq $a1,$t3,end_loop 
		add $v0,$t0,$t1 #the next fibonachi number
		move $t0,$t1 #fib(n) = fib(n+1)
		move $t1,$v0 #fib(n+1) = fib(n+2)
		addi $a1,$a1,-1 
		
		j loop
		
	end_loop :
		lw $a1, 0($sp)		
		lw $ra, 4($sp)
		addi $sp,$sp,8 
		
		jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
