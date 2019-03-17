.data
	.align 0
	str_arg1: .asciiz "Digite o valor de n1: "
	str_arg2: .asciiz "Digite o valor de n2: "
	str_res_mult: .asciiz "O valor da multiplcacao entre 'n1' e 'n2' eh: "
	n: .asciiz "\n"
.text
	.globl main
main: 
	# atribui 4 para $v0. Codigo para print_str
	li $v0, 4 
	la $a0, str_arg1
	syscall
erro_mult:
	# atribui 5 para $v0. Código para scanf
	li $v0, 5
	syscall
	# registrador $t0 recebe valor digitado pelo usuario que esta em $v0
	# $t0 <- a
	move $t0, $v0
	# atribui 4 para $v0. Código para print_str
	li $v0, 4
	la $a0, str_arg2
	syscall
	# atribui 5 para $v0. Código para scanf
	li $v0, 5
	syscall
	# registrador $t1 recebe valor digitado pelo usuario que esta em $v0
	# $t1 <- b
	move $t1, $v0
	
	# trecho que executa a multiplcacao
	# envia o resultado da multiplcacao para $t2
	# t2 <- n1*n2
	mult $t1, $t0
	mflo $t2
	
	# imprime "O valor da multiplcacao entre 'n1' e 'n2' eh: "
	li $v0, 4
	la $a0, str_res_mult
	syscall
	
	# imprime $t2 (resultado da mult)
	li $v0, 1
	move $a0, $t2
	syscall
	
	# pula uma linha
	li $v0, 4
	la $a0, n
	syscall
	
	# sair (código para finalizar o programa)
	li $v0, 10	
	syscall
	
	#sair da funcao
	j main
	
	
	
	
	
	
	