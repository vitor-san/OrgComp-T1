.data
	.align 0
	str_arg1: .asciiz "Digite o valor de n: "
	str_arg2: .asciiz "Digite o valor de exp: "
	str_res_pot: .asciiz "O valor de 'n elevado ao exp' eh: "
	n: .asciiz "\n"
.text
	.globl main
main: 
	# atribui 4 para $v0. Imprimi "Digite o valor de n: "
	li $v0, 4 
	la $a0, str_arg1
	syscall
erro_n_pot:
	# atribui 5 para $v0. Le o valor de 'n'
	li $v0, 5
	syscall
	
	# Testa se o numero lido eh nao negativo
	blt $v0, $zero, erro_n_pot
	
	# registrador $t0 recebe valor digitado pelo usuario que esta em $v0
	# $t0 <- n
	move $t0, $v0
	# atribui 4 para $v0. Imprime "Digite o valor de exp: "
	li $v0, 4
	la $a0, str_arg2
	syscall 
erro_exp_pot:
	# atribui 5 para $v0. Le o valor de 'exp'
	li $v0, 5
	syscall
	# Testa se o numero lido eh nao negativo
	blt $v0, $zero, erro_exp_pot
	
	# registrador $t1 recebe valor digitado pelo usuario que esta em $v0
	# $t1 <- exp
	move $t1, $v0
	
	# codigo vai aqui
	move $t2, $zero # $t2 recebe zero e sera incrementado dentro do loop (como um 'i')
	addi $t3, $zero, 1 # $t3 recebe 1 e acumulara o resultado da potenciacao
entra_calculo_pot:
	bge $t2, $t1, sai_calculo_pot # continua se ($t2 < exp), sai se ($t2 >= exp)
	mult $t3, $t0 # LO = resultado * n
	mflo $t3 # resultado = LO
	addi $t2, $t2, 1 # $t2++
	j entra_calculo_pot
sai_calculo_pot:	
	# imprime "O valor de 'n elevado ao exp' eh: "
	li $v0, 4
	la $a0, str_res_pot
	syscall
	
	# imprime $t3 (resultado da pot)
	li $v0, 1
	move $a0, $t3
	syscall
	
	# pula uma linha
	li $v0, 4
	la $a0, n
	syscall
	
	# sair (código para finalizar o programa)
	li $v0, 10	
	syscall

	# sair da funcao
	j main
