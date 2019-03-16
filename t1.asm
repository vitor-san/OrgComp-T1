.data	# diretiva para início do segmento de dados
	.align 0	# alinha os dados byte a byte na memória
	str_menu: .asciiz "------ MENU PRINCIPAL ------\n"	# definindo a string str_menu
	str_avisa: .asciiz "(Todos os números fornecidos para as operações abaixo devevm ser inteiros)\n"	# definindo a string str_avisa
	str_soma: .asciiz "0 - Soma\n"	# e assim por diante...
	str_sub: .asciiz "1 - Subtração\n"
	str_mult: .asciiz "2 - Multiplicação (ambos devem ser de, no máximo, 16 bits)\n"
	str_div: .asciiz "3 - Divisão (ambos devem ser de, no máximo, 16 bits)\n"
	str_pot: .asciiz "4 - Potênciação (primeiro elevado ao segundo)\n"
	str_sqrt: .asciiz "5 - Raiz quadrada\n"
	str_tab: .asciiz "6 - Tabuada\n"
	str_imc: .asciiz "7 - Cálculo do IMC\n"
	str_fat: .asciiz "8 - Fatorial\n"
	str_fib: .asciiz "9 - Cálculo da sequência de Fibonacci no intervalo (a, b)\n"
	str_end: .asciiz "10 - Sair do programa\n"
	str_opc: .asciiz "\nBem-vindx à calculadora MIPS! Digite o número correspondente à opção que deseja selecionar:"
	str_n1: .asciiz "n1 = "
	str_n2: .asciiz "n2 = "
	
.text	# diretiva para início do segmento de texto
	.globl main	# seta a label main como global
	
main:	# início do programa
	
	# vai imprimir uma string
	li $v0, 4			# atribui 4 para $v0. Código para print_str
	la $a0, str_menu			# carrega endereco de str_menu em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereço em $a0)
	
	# repetiremos o bloco de código acima sempre que quisermos imprimir uma string
	
	li $v0, 4
	la $a0, str_avisa
	syscall
	
	li $v0, 4
	la $a0, str_soma
	syscall
	
	li $v0, 4
	la $a0, str_sub
	syscall
	
	li $v0, 4
	la $a0, str_mult
	syscall
	
	li $v0, 4
	la $a0, str_div
	syscall
	
	li $v0, 4
	la $a0, str_pot
	syscall
	
	li $v0, 4
	la $a0, str_sqrt
	syscall
	
	li $v0, 4
	la $a0, str_tab
	syscall
	
	li $v0, 4
	la $a0, str_imc
	syscall
	
	li $v0, 4
	la $a0, str_fat
	syscall
	
	li $v0, 4
	la $a0, str_fib
	syscall
	
	li $v0, 4
	la $a0, str_end
	syscall
	
	li $v0, 4
	la $a0, str_opc
	syscall
	
	# vai pegar a opção do usuário
	li $v0, 5	# código para read_int
	syscall
	
	move $t0, $v0	# copia a opção digitada pelo usuário para o registrador $t0
	
	# a seguir, definiremos em qual das funções o programa entrará
	
	li $t1, 0	# carrego o valor 0 para o registrador $t1
	beq $t0, $t1, soma	# se a opção escolhida for 0, então o programa entrará na função de soma
	# caso contrário, continuará procurando a opção certa
	# a mesma ideia se aplica em cada um dos blocos de código abaixo
	
	li $t1, 1	
	beq $t0, $t1, subt
	
	li $t1, 2
	beq $t0, $t1, multi
	
	li $t1, 3
	beq $t0, $t1, divi
	
	li $t1, 4
	beq $t0, $t1, pot
	
	li $t1, 5
	beq $t0, $t1, sqrt
	
	li $t1, 6
	beq $t0, $t1, tab
	
	li $t1, 7
	beq $t0, $t1, imc
	
	li $t1, 8
	beq $t0, $t1, fat
	
	li $t1, 9
	beq $t0, $t1, fib
	
	li $t1, 10
	beq $t0, $t1, end
	
	j end	# desvio incondicional para o fim do programa (apenas como medida de prevenção)

soma:


	j main
	
subt:


	j main
	
multi:

	j main
	
divi:

	j main
	
pot:

	j main
	
sqrt:

	j main
	
tab:

	j main
	
imc:

	j main
	
fat:

	j main
	
fib:

	j main

end:
	li $v0, 10	# código para finalizar o programa
	syscall