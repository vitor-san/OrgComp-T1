.data
	.align 0
	str_arg1: .asciiz "Digite o valor de n1 (ate 16 bits): "
	str_arg2: .asciiz "Digite o valor de n2 (ate 16 bits): "
	str_res_div: .asciiz "O valor da divisao de 'n1' por 'n2' eh: "
	n: .asciiz "\n"
.text
	.globl main
main: 
	# atribui 4 para $v0. Imprimi "Digite o valor de n1: "
	li $v0, 4 
	la $a0, str_arg1
	syscall
erro_n1_div:
	# atribui 5 para $v0. Le o valor de n1
	li $v0, 5
	syscall
	
	# Testa se o numero lido possui 16 bits
	# Substraindo o maior numero possivel (2^16 - 1 == 65535)
	# E testando se essa subtracao tem resultado maior que zero (o que eh errado caso aconteca)
	
	li $t3, 65535
	sub $t3, $v0, $t3
	bgt $t3, $zero, erro_n1_div
	
	# registrador $t0 recebe valor digitado pelo usuario que esta em $v0
	# $t0 <- n1
	move $t0, $v0
	# atribui 4 para $v0. Imprime "Digite o valor de n2: "
	li $v0, 4
	la $a0, str_arg2
	syscall 
erro_n2_div:
	# atribui 5 para $v0. Le o valor de n2
	li $v0, 5
	syscall
	# Testa se o numero lido possui 16 bits
	# Substraindo o maior numero possivel (2^16 - 1)
	# E testando se essa subtracao tem resultado maior que zero (o que eh errado caso aconteca)
	li $t3, 65535
	sub $t3, $v0, $t3
	bgt $t3, $zero, erro_n2_div
	# registrador $t1 recebe valor digitado pelo usuario que esta em $v0
	# $t1 <- n2
	move $t1, $v0
	
	# trecho que executa a divisao
	# envia o resultado da divisao para $t2
	# t2 <- n1/n2
	div $t0, $t1
	mflo $t2
	
	# imprime "O valor da divisao de 'n1' por 'n2' eh: "
	li $v0, 4
	la $a0, str_res_div
	syscall
	
	# imprime $t2 (resultado da div)
	li $v0, 1
	move $a0, $t2
	syscall
	
	# pula uma linha
	li $v0, 4
	la $a0, n
	syscall
	
	# sair (c�digo para finalizar o programa)
	li $v0, 10	
	syscall

	# sair da funcao
	j main
