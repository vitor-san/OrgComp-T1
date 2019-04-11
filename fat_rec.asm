.data 
	.align 0

.text
	.globl main
	
main :

	li $v0, 5 #read the integer
	syscall 
	move $a0,$v0 #$a0 = input
	
	jal fat #go to the function
	move $a0,$v0 #move the result to $a0
	li $v0, 1 #print the result
	syscall
	
	li $v0, 10 #exit
	syscall
	
fat :
	addi $sp,$sp,8 #move the stack pointer foward
	sw $a0, 0($sp) #first position based on the pointer
	sw $ra, -4($sp) #second position based on the pointer
	
	beq $a0,$zero, end_rec #if ($a0 == 0) return
	addi $a0, $a0, -1 #$a0--
	
	jal fat #the recursive call
	
	addi $a0,$a0,1 #add one to the return of the recursion
	mul $v0,$v0,$a0 #multiply the result
	
	
desempilha :
	lw $a0, 0($sp) #load the last value of $a0
	lw $ra, -4($sp) #load the last value of $ra
	addi $sp,$sp,-8 #move the stack pointer back
	jr $ra #go back to postion determined by $ra
	
end_rec : #ends the recursion, after the base case
	li $v0, 1 
	j desempilha
	
