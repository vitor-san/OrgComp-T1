.data
	.align 0
	str_arg1: .asciiz "Digite o valor de n: "
	str_res_fat: .asciiz "O valor de 'n!' eh: "
	n: .asciiz "\n"
.text
	.globl main
main: 
	# atribui 4 para $v0. Imprimi "Digite o valor de n: "
	li $v0, 4 
	la $a0, str_arg1
	syscall
erro_n_fat:
	# atribui 5 para $v0. Le o valor de 'n'
	li $v0, 5
	syscall
	
	# Testa se o numero lido eh nao negativo
	ble $v0, $zero, erro_n_fat
	
	# registrador $t0 recebe valor digitado pelo usuario que esta em $v0
	# $t0 <- n
	move $t0, $v0

	# codigo vai aqui
	addi $t1, $zero, 1 # $t1 recebe 1 e sera incrementado dentro do loop (como um 'i')
	addi $t2, $zero, 1 # $t recebe 1 e acumulara o resultado do fatorial
entra_calculo_fatorial:
	bgt $t1, $t0, sai_calculo_fatorial # continua se (i($t1) <= n($t0)), sai do loop se (i($t1) > n($t0))
	mult $t2, $t1 # LO = resultado * i
	mflo $t2 # resultado = LO
	addi $t1, $t1, 1 # $t1++
	j entra_calculo_fatorial
sai_calculo_fatorial:
	# imprime "O valor de 'n!' eh: "
	li $v0, 4
	la $a0, str_res_fat
	syscall
	
	# imprime $t2 (resultado da fat)
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

	# sair da funcao
	j main
