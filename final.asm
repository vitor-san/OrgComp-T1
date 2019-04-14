.data	# diretiva para inicio do segmento de dados
	.align 0	# alinha os dados byte a byte na memoria
	str_menu: .asciiz "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MENU PRINCIPAL <<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n"		# definindo a string str_menu
	str_avisa: .asciiz "(Todos os numeros fornecidos para as operacoes abaixo devevm ser inteiros)\n"		# definindo a string str_avisa
	str_soma: .asciiz "0 - Soma\n"											# e assim por diante...
	str_sub: .asciiz "1 - Subtracao\n"
	str_mult: .asciiz "2 - Multiplicacao (ambos devem ser de, no maximo, 16 bits)\n"
	str_div: .asciiz "3 - Divisao (ambos devem ser de, no maximo, 16 bits)\n"
	str_pot: .asciiz "4 - Potenciacao (primeiro elevado ao segundo)\n"
	str_sqrt: .asciiz "5 - Raiz quadrada\n"
	str_tabu: .asciiz "6 - Tabuada\n"
	str_imc: .asciiz "7 - Calculo do IMC\n"
	str_fat: .asciiz "8 - Fatorial\n"
	str_fib: .asciiz "9 - Termos da sequencia de Fibonacci em (a, b)\n"
	str_end: .asciiz "10 - Sair do programa\n"
	str_opc: .asciiz "\n- Bem-vindx a calculadora MIPS! Digite o numero correspondente a opcao que deseja selecionar: "
	str_n1: .asciiz "\nPrimeiro numero: "
	str_n2: .asciiz "Segundo numero: "
	str_n_pos: .asciiz "\nDigite um numero inteiro positivo: "
	str_peso: .asciiz "\nPeso (em kg): "
	str_altura: .asciiz "Altura (em cm): "	
	str_res: .asciiz ">> Resultado: "
	str_resu_imc: .asciiz ">> IMC = "
	str_vezes: .asciiz " x "
	str_igual: .asciiz " = " 
	str_line: .asciiz "\n"		# quebra de linha
	str_tab: .asciiz "\t"		# tab
	str_erro: .asciiz "\nEntrada invalida!"
	str_rep_opc: .asciiz "\n\nA opcao digitada nao existe. Digite uma opcao valida!\n"
	.align 4
	numeroPrecisao: .float 0.00001
	numero2: .float 2

	
.text	# diretiva para inicio do segmento de texto
	.globl main			# seta a label main como global
	
main:	# inicio do programa
	
	# vamos imprimir abaixo todas as strings relativas ao menu
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_menu		# carrega o endereco de str_menu em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)

	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_avisa		# carrega o endereco de str_avisa em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_soma		# carrega o endereco de str_soma em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_sub			# carrega o endereco de str_sub em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_mult		# carrega o endereco de str_mult em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_div			# carrega o endereco de str_div em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_pot			# carrega o endereco de str_pot em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_sqrt		# carrega o endereco de str_sqrt em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_tabu		# carrega o endereco de str_tabu em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_imc			# carrega o endereco de str_imc em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_fat			# carrega o endereco de str_fat em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_fib			# carrega o endereco de str_fib em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_end			# carrega o endereco de str_end em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_opc			# carrega o endereco de str_opc em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereco em $a0)
	
	# vai pegar a opcao do usuario
	li $v0, 5			# codigo para read_int
	syscall				# chamada de sistema para E/S (le um int)
	
	move $t0, $v0			# copia a opcao digitada pelo usuario para o registrador $t0
	
	# a seguir, definiremos em qual das funcoes o programa entrara

#SOMA
	bne $t0, $zero, sem_soma	# se a opcao escolhida nao for 0, entao o programa continuara procurando a opcao certa
	j soma				# jump para a linha de codigo da operacao
	j main				# retorna para o menu
	
sem_soma:				# label usada para criar um "else if" com a operacao	
#SUBTRACAO
	li $t1, 1			# carrego o valor constante 1 para o registrador $t1
	bne $t0, $t1, sem_subt		# se o valor que o usuario digitou nao foi 1, o programa continua procurando a opcao certa
	j subt				# jump para a linha de codigo da operacao
	
	
sem_subt:				# label usada para criar um "else if" com a operacao		
#MULTIPLICACAO
	li $t1, 2			# carrego o valor constante 2 para o registrador $t1
	bne $t0, $t1, sem_multi		# se o valor que o usuario digitou nao foi 2, o programa continua procurando a opcao certa
	j multi				# jump para a linha de codigo da operacao

		
sem_multi:				# label usada para criar um "else if" com a operacao	
#DIVISAO
	li $t1, 3			# carrego o valor constante 3 para o registrador $t1
	bne $t0, $t1, sem_divi		# se o valor que o usuario digitou nao foi 3, o programa continua procurando a opcao certa
		
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_n1			# salva o endereco da string em a0
	syscall				# printa string
	
	li $v0, 5			# carrega 5 para v0, (le int)
	syscall				# le o numero digitado
	
	move $a1, $v0			# atribui n1 para $a1
	
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_n2			# salva o endereco da string em a0
	syscall				# printa string
	
	li $v0, 5			# carrega 5 para v0, (le int)
	syscall				# le o numero digitado
	
	move $a2, $v0			# atribui n2 para $a2
		
	beqz $a2 erro			# verifica se a entrada e valida, caso nao seja, nao chama o procedimento de divisao
		
	jal divi			# jump para a linha de codigo da operacao
		
	li $v0, 4			# carrega a instrucao para o v0 (printar string)
	la $a0, str_res			# carrega o endereco da string que sera mostrada (resposta)
	syscall				# imprime a string
		
	li $v0, 2			# carrega a instrucao para mostrar um float
	mov.s $f12, $f0 		# move o retorno da funcao para f12, o qual sera printado
	syscall				# chama o sistema para mostrar na tela o numero
		
	j main				# retorna para o menu
		
						
sem_divi:				# label usada para criar um "if" com a operacao
#POTENCIA
	li $t1, 4			# carrego o valor constante 4 para o registrador $t1
	bne $t0, $t1, sem_pot		# se o valor que o usuario digitou nao foi 4, o programa continua procurando a opcao certa
	j pot				# jump para a linha de codigo da operacao
	

sem_pot:				# label usada para criar um "else if" com a operacao
#RAIZ
	li $t1, 5			# carrego o valor constante 5 para o registrador $t1
	bne $t0, $t1, sem_sqrt		# se o valor que o usuario digitou nao foi 5, o programa continua procurando a opcao certa
		
	li $v0, 4			# carrega a instrucao para o $v0
	la $a0, str_n_pos		# carrega o endereco da string que sera mostrada
	syscall				# imprime a string
		
	li $v0, 5 			# le o interio para o calculo da raiz
	syscall		       		# chama o sistema para ler o numero
	move $a0, $v0 			# move o numero para $a0, pois $a0 eh o parametro da funcao
		
	bltz $a0 erro			# verifica se a entrada e valida, caso nao seja, nao chama o procedimento de raiz
		
	jal sqrt 			# chama o procedimento para calcular a raiz
		
	li $v0, 4			# carrega a instrucao para o $v0
	la $a0, str_res			# carrega o endereco da string que sera mostrada (resposta)
	syscall				# imprime a string
		
	li $v0, 2			# carrega a instrucao para mostrar um float
	mov.s $f12, $f0 		# move o retorno da funcao para $f12, o qual sera printado
	syscall				# chama o sistema para mostrar na tela o numero
		
	j main 				# retorna para o menu
	
	
sem_sqrt:				# label usada para criar um "else if" com a operacao
#TABUADA
	li $t1, 6			# carrego o valor constante 6 para o registrador $t1
	bne $t0, $t1, sem_tab		# se o valor que o usuario digitou nao foi 6, o programa continua procurando a opcao certa
	j tab				# jump para a linha de codigo da operacao


sem_tab:				# label usada para criar um "else if" com a operacao
#IMC
	li $t1, 7			# carrego o valor constante 7 para o registrador $t1
	bne $t0, $t1, sem_imc		# se o valor que o usuario digitou nao foi 7, o programa continua procurando a opcao certa
	j imc				# jump para a linha de codigo da operacao
	
			
sem_imc:				# label usada para criar um "else if" com a operacao
#FATORIAL
	li $t1, 8			# carrego o valor constante 8 para o registrador $t1
	bne $t0, $t1, sem_fat		# se o valor que o usuario digitou nao foi 8, o programa continua procurando a opcao certa
					
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_n_pos			# salva o endereco da string em a0
	syscall				# printa string
				
	li $v0, 5			# carrega 5 para v0, (le int)
	syscall				# le o numero digitado
	
	move $a0, $v0			# move o numero lido para $a0
	
	blt $v0, $zero, erro		# testa se o numero lido e nao negativo, caso seja o procedimento nao e chamado
	
	jal fat_rec			# chama o procedimento para calculo do fatorial
	
	move $a1, $v0			# move o resultado para $a1
	
	li $v0, 4			# carrega a instrucao para o $v0
	la $a0, str_res			# carrega o endereco da string que sera mostrada (resposta)
	syscall				# imprime a string

	move $a0, $a1			# move o resultado para $a0
	li $v0, 1			# carrega a instrucao para o $v0
	syscall				# imprime a o resultado
	
	# pula uma linha
	li $v0, 4			# carrega a instrucao para o $v0
	la $a0, str_line		# carrega o endereco da string que sera mostrada (\n)
	syscall				# imprime a string
	
	j main				# retorna para o menu
			
	
sem_fat:				# label usada para criar um "else if" com a operacao
#SEQUENCIA DE FIBONACCI	
	li $t1, 9			# carrego o valor constante 9 para o registrador $t1
	bne $t0, $t1, sem_fib		# se o valor que o usuario digitou nao foi 9, o programa continua procurando a opcao certa

	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_n1			# salva o endereco da string em a0
	syscall				# printa string
		
	li $v0, 5			# carrega 5 para v0, (le int)
	syscall				# le o numero digitado
	
	blt $v0, $zero, erro		# testa se o numero lido eh negativo, caso seja o procedimento nao e chamado
	move $a1,$v0			# move o numero lido para $a1		
			
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_n2			# salva o endereco da string em a0
	syscall				# printa string
		
	li $v0, 5			# carrega 5 para v0, (le int)
	syscall				# le o numero digitado
	
	blt $v0, $a1, erro		# testa se o numero lido eh maior ou igual ao primeiro, caso seja o procedimento nao e chamado
	move $a2,$v0			# move o numero lido para $a2
	
	jal fib_seg			# chama o procedimento para calculo da sequencia de fibonacci
		
	j main				# retorna para o menu
	
	
sem_fib:				# label usada para criar um "else if" com a operacao
#ENCERRAR PROGRAMA
	li $t1, 10			# carrego o valor constante 10 para o registrador $t1
	beq $t0, $t1, end_main		# se o valor que o usuario digitou foi 10, encerra o programa
	
	j repeat_main			# caso o usuario entre com um numero invalido de opcao


#======================================FIM DO MENU(MAIN)===================================

# AGORA VEM AS OPERACOES EM SI

soma:
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_n1			# salva o endereco da string em a0
	syscall				# printa string
	
	li $v0, 5			# carrega 5 para v0, (le int)
	syscall				# le o numero digitado
	
	move $t0, $v0			# atribui n1 para $t0
	
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_n2			# salva o endereco da string em a0
	syscall				# printa string
	
	li $v0, 5			# carrega 5 para v0, (le int)
	syscall				# le o numero digitado
	
	move $t1, $v0			# atribui n2 para $t1
	
	add $t0, $t0, $t1		# realiza o calculo n1 = n1 + n2
	
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_res			# salva o endereco da string em a0
	syscall				# printa string
	
	li $v0, 1			# carrega 1 para v0, (imprimir int)
	move $a0, $t0			# ira colocar o resultado da soma em $a0, para que seja printado
	syscall				# printa resultado

	j main				# retorna para o menu
	
	
	
subt:
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_n1			# salva o endereco da string em a0
	syscall				# printa string
	
	li $v0, 5			# carrega 5 para v0, (le int)
	syscall				# le o numero digitado
	
	move $t0, $v0			# atribui n1 para $t0
	
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_n2			# salva o endereco da string em a0
	syscall				# printa string
	
	li $v0, 5			# carrega 5 para v0, (le int)
	syscall				# le o numero digitado
	
	move $t1, $v0			# atribui n2 para $t1
	
	sub $t0, $t0, $t1		# realiza o calculo n1 = n1 - n2
	
	li $v0, 4			# carrega 4 para v0, (imprimir string)
	la $a0, str_res			# salva o endereco da string em a0
	syscall				# printa string
	
	li $v0, 1			# carrega 1 para v0, (imprimir int)
	move $a0, $t0			# ira colocar o resultado da soma em $a0, para que seja printado
	syscall				# printa resultado

	j main				# retorna para o menu
	
	
	
multi:
	# atribui 4 para $v0. Imprime "Primeiro numero: "
	li $v0, 4 			
	la $a0, str_n1
	syscall				

	# atribui 5 para $v0. Le o valor de n1
	li $v0, 5			
	syscall				
	
	# testa se o numero lido possui 16 bits substraindo dele o maior numero possivel e 
	# testando se essa subtracao tem resultado maior que zero (o que eh errado caso aconteca)
	
	# para chegarmos no valor maximo = '46340' fizemos a seguinte funcao em C
	# que imprime o valor maximo de 'a' aceito para uma multiplcacao ate que 
	# o resultado (c) de erro (overflow)
	
	# int main() {
	#	
	# 	 int a = 32767;
	#	 int c;
	#
	#	 do {
	#		 c = a * a;
	#		 a++;
	#	 } while (c > 0);
	#
	#	 printf("%d\n", a);
	#
	#	 return 0;
	# }
	
	# e a partir desta funcao, tivemos a = 46341
	# usamos, portanto, o valor maximo permitido antes do ultimo incremento = 46340
	
	li $t3, 46340
	sub $t3, $v0, $t3	# $t3 = $v0 - $t3
	bgt $t3, $zero, erro	# se $t3 > 0, entao o numero eh invalido
	
	# registrador $t0 recebe valor digitado pelo usuario que esta em $v0
	# $t0 <- n1
	move $t0, $v0
	
	# atribui 4 para $v0. Imprime "Segundo numero: "
	li $v0, 4
	la $a0, str_n2
	syscall 
	
	# atribui 5 para $v0. Le o valor de n2
	li $v0, 5
	syscall
	
	# testa se o numero lido possui 16 bits
	li $t3, 46340
	sub $t3, $v0, $t3
	bgt $t3, $zero, erro
	
	# registrador $t1 recebe valor digitado pelo usuario que esta em $v0
	# $t1 <- n2
	move $t1, $v0
	
	# trecho que executa a multiplcacao
	# envia o resultado da multiplcacao para $t2
	# t2 <- n1*n2
	mult $t1, $t0
	mflo $t2
	
	# imprime "O valor da multiplcacao entre 'n1' e 'n2' eh: "
	li $v0, 4
	la $a0, str_res
	syscall
	
	# imprime $t2 (resultado da mult)
	li $v0, 1
	move $a0, $t2
	syscall
	
	j main



divi:
	#OBS f0 nao eh salvo pois ele sera usado como retorno, sendo assim, seu valor sera alterado de qualquer forma
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	swc1 $f1, ($sp) 	# guarda o registrador na pilha, f1 eh o denominador da divisao
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	swc1 $f2, ($sp) 	# guarda o registrador na pilha, f2 eh o divisor da divisao
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	sw $v0, ($sp)		# guarda o registrador na pilha, v0 eh usado para chamar procedimentos
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	sw $a1, ($sp)	 	# guarda o registrador na pilha, a1 eh usado para passar parametros para o sistema
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	sw $a2, ($sp)		# guarda o registrador na pilha, a2 eh usado para armazenar temporariamente o denominador
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	sw $ra, ($sp)		# guarda o registrador na pilha, ra possui o endereco de retorno
	
	mtc1 $a1, $f1 		# Copia o valor passado como parametro para f1
	cvt.s.w $f1, $f1 	# Comverte o valor para float
	
	mtc1 $a2, $f2 		# Copia o valor passado como parametro para f2
	cvt.s.w $f2, $f2 	# Comverte o valor para float
	
	div.s $f3, $f1, $f2 	# realia a divisao e salva em f1, apaga o denominador
	
	mov.s $f0, $f3 		# move o f3, que e o resultado, para f0 que sera o registrado de retorno
	
	lw $ra, ($sp) 		# recupero o valor de ra da pilha
	addi $sp, $sp, 4	# volta 1 end na pilha, para o proximo com dados
	
	lw $a2, ($sp) 		# recupero o valor de a1 da pilha
	addi $sp, $sp, 4	# volta 1 end na pilha, para o proximo com dados
	
	lw $a1, ($sp) 		# recupero o valor de a0 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	lw $v0, ($sp) 		# recupero o valor de v0 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f2, ($sp)		# recupero o valor de f2 da pilha
	addi $sp, $sp, 4	# volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f1, ($sp)	 	# recupero o valor de f1 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	jr $ra
	
	
	
pot:
	# atribui 4 para $v0. Imprime "Primeiro numero: "
	li $v0, 4 
	la $a0, str_n1
	syscall
	
	# atribui 5 para $v0. Le o valor da base
	li $v0, 5
	syscall
	
	# testa se o numero lido eh nao negativo
	blt $v0, $zero, erro
	
	# registrador $t0 recebe valor digitado pelo usuario que esta em $v0
	# $t0 <- n
	move $t0, $v0
	
	# atribui 4 para $v0. Imprime "Segundo numero: "
	li $v0, 4
	la $a0, str_n2
	syscall 
	
	# atribui 5 para $v0. Le o valor do expoente
	li $v0, 5
	syscall
	
	# testa se o numero lido eh nao negativo
	blt $v0, $zero, erro
	
	# registrador $t1 recebe valor digitado pelo usuario que esta em $v0
	# $t1 <- exp
	move $t1, $v0

	move $t2, $zero 	# $t2 recebe zero e sera incrementado dentro do loop (como um 'i')
	addi $t3, $zero, 1 	# $t3 recebe 1 e acumulara o resultado da potenciacao
	
entra_calculo_pot:
	bge $t2, $t1, sai_calculo_pot 	# continua se ($t2 < exp), sai se ($t2 >= exp)
	
	mult $t3, $t0 		# LO = resultado * n
	mflo $t3 		# resultado = LO
	
	addi $t2, $t2, 1 	# $t2++
	
	j entra_calculo_pot
	
sai_calculo_pot:	
	# imprime "Resultado: "
	li $v0, 4
	la $a0, str_res
	syscall
	
	# imprime $t3 (resultado da pot)
	li $v0, 1
	move $a0, $t3
	syscall
	
	j main

	
	
sqrt:
	#OBS: $f0 nao eh salvo pois ele sera usado como retorno, sendo assim, seu valor sera alterado de qualquer forma
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	sw $ra, ($sp) 		# guarda o registrador na pilha, ra eh o local de retorno na main`
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	swc1 $f1, ($sp) 	# guarda o registrador na pilha, f1 eh a variavel x1, x1 armazena o chute inicialmente
	
	subi $sp, $sp, 4	# move o ponteiro da pilha para o proximo end vazio
	swc1 $f2, ($sp) 	# guarda o registrador na pilha, f2 eh a variavel x2, guarda o resultado do calculo
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	swc1 $f3, ($sp) 	# guarda o registrador na pilha, f3 guarda o valor anteriro para se ferificar a precisao do resultado
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	swc1 $f4, ($sp) 	# guarda o registrador na pilha, f4 guarda valor enviado como parametro

	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	swc1 $f5, ($sp) 	# guarda o registrador na pilha, f5 guarda o valor 2.0, muito usado no calculo de raiz
			
	subi $sp, $sp, 4	# move o ponteiro da pilha para o proximo end vazio
	swc1 $f6, ($sp)		# guarda o registrador na pilha, f6 guarda o valor de precisao desejado
	
	subi $sp, $sp, 4 	# move o ponteiro da pilha para o proximo end vazio
	swc1 $f7, ($sp) 	# guarda o registrador na pilha, f7 guarda o valor do calculo da precisao
					
	mtc1 $a0, $f4 		# copia o valor passado como parametro para f4
	cvt.s.w $f4, $f4 	# converte o valor para float
	
	bnez $a0, nao_zero	# verifica se esta sendo calculada a raiz de 0
	
	mov.s $f3, $f4		# caso esteja, move o 0 para f1 (f1 armazena o resultado)
	j sai_raiz		# encerra o procedimento

nao_zero:
	lwc1 $f5, numero2	 # carrega 2 no registrador, usado muito no calculo
	
	div.s $f1, $f4, $f5 	# calcula o chute, sendo ele raiz/2

	lwc1 $f6, numeroPrecisao 	# carrega a precisao do calculo da raiz
	
	# realiza a primeira conta antes de entrar no loop, simula um do while
	
	div.s $f2, $f4, $f1 	# realiza a conta raiz/x1
	add.s $f2, $f2, $f1  	# realiza a conta (raiz/x1) + x1
	div.s $f2, $f2, $f5 	# realiza a conta ((raiz/x1) + x1)/2
	
	mov.s $f3, $f1		# registra o valor anterior em f3
	mov.s $f1, $f2		# o anterior recebe o atual
	
loop_raiz:
	# loop para aumento da precisao da raiz ate o desejado
	sub.s $f7, $f3, $f1 	# calcula a precisao
	abs.s $f7, $f7 		# converte para positivo
	c.le.s $f7, $f6 	# compara se f7 eh menor que f6 e seta uma flag com o resultado
	bc1t sai_raiz 		# verifica a flag da comparacao
	div.s $f2, $f4, $f1 	# realiza a conta raiz/x1
	add.s $f2, $f2, $f1  	# realiza a conta (raiz/x1) + x1
	div.s $f2, $f2, $f5	# realiza a conta ((raiz/x1) + x1)/2
	
	mov.s $f3, $f1		# registra o valor anterior em f3
	mov.s $f1, $f2		# o anterior recebe o atual
		
	j loop_raiz
	
sai_raiz:
	mov.s $f0, $f3 		# move o f1, q eh o x1, para f0 que sera o registrado de retorno
	
	lwc1 $f7, ($sp) 	# recupero o valor de f7 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f6, ($sp) 	# recupero o valor de f6 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f5, ($sp) 	# recupero o valor de f5 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f4, ($sp) 	# recupero o valor de f4 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f3, ($sp) 	# recupero o valor de f3 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f2, ($sp) 	# recupero o valor de f2 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f1, ($sp)		# recupero o valor de f1 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	lw $ra, ($sp) 		# recupero o valor de f7 da pilha
	addi $sp, $sp, 4 	# volta 1 end na pilha, para o proximo com dados
	
	jr $ra		# retorna para o endereco em ra (local que chamou o procedimento)
	
	
	
tab:
	li $v0, 4		# print_str
	la $a0, str_n1		
	syscall
				
	li $v0, 5		# read_int
	syscall
	
	move $t0, $v0		# copia o valor digitado para $t0
	
	addi $t1, $zero, 1 	# primeiro numero
	addi $t3, $zero, 11	# condicao de parada
		
loop_tab:
	beq $t1, $t3, end_loop_tab
		
	li $v0, 4		# print_str
	la $a0, str_line	# adiciona um "\n" por motivos de formatacao
	syscall	
		
	li $v0, 4		# print_str
	la $a0, str_tab		# adiciona um "\t" por motivos de formatacao
	syscall
					
	li $v0, 1		# print_int
	move $a0, $t0 		# printa o numero que foi passado como parametro (da tabuada)
	syscall
	
	li $v0, 4		# print_str
	la $a0, str_vezes
	syscall
	
	li $v0, 1 		# print_int
	move $a0, $t1 		# printa o numero atual
	syscall
	
	li $v0, 4		# print_str
	la $a0, str_igual
	syscall
	
	li $v0, 1		# print_int
	mul $t2, $t0, $t1 	# $t2 = a * i
	move $a0, $t2
	syscall
	
	addi $t1, $t1, 1 	# i = i + 1
	
	j loop_tab 
	
end_loop_tab:
	j main			# o programa pedira por uma nova opcao
		
	
	
imc:
	li $v0, 4		# print_str
	la $a0, str_peso
	syscall
	
	li $v0, 5		# read_int
	syscall
	
	move $t0, $v0		# atribui n1 para $t0
	
	li $v0, 4		# print_str
	la $a0, str_altura
	syscall
	
	li $v0, 5		# read_int
	syscall
	
	move $t1, $v0		# atribui n2 para $t1
	
	mtc1 $t0, $f1 		# copia o valor de t0 para f1
	cvt.s.w $f1, $f1 	# converte o valor para float
	
	mtc1 $t1, $f2 		# copia o valor de t1 para f2
	cvt.s.w $f2, $f2 	# converte o valor para float
	
	mul.s $f2, $f2, $f2	# altura ^ 2
	
	li $t2, 10000
	
	mtc1 $t2, $f3 		# copia o valor de t2 para f3
	cvt.s.w $f3, $f3 	# converte o valor para float
	
	mul.s $f1, $f1, $f3	# peso = peso * 10000 (compensa o fato de a altura estar em cm)
	
	div.s $f1, $f1, $f2	# IMC = peso / (altura ^ 2)
	
	li $v0, 4		# print_str
	la $a0, str_resu_imc
	syscall
	
	li $v0, 2		# print_int
	mov.s $f12, $f1		# copia o valor do IMC para o registrador que sera usado na impressao
	syscall

	j main			# o programa pedira por uma nova opcao
	
	
	
fat_rec:
	addi $sp, $sp, 8 	# move o ponteiro da pilha para frente, alocando duas posicoes de memoria
	sw $a0, 0($sp) 		# empilha $a0 na primeira posicao de memoria livre na pilha
	sw $ra, -4($sp) 	# empilha $ra na segunda posicao de memoria livre na pilha
	
	beq $a0, $zero, end_rec		# if ($a0 == 0) return
	addi $a0, $a0, -1 	# $a0 = $a0 - 1
	
	jal fat_rec 		# a chamada recursiva
	
	addi $a0, $a0, 1 	# adiciona um ao retorno da recursao
	mul $v0, $v0, $a0 	# multiplica o resultado
	
desempilha:
	lw $a0, 0($sp) 		# recupera o ultimo valor do $a0
	lw $ra, -4($sp) 	# recupera o ultimo valor do $ra
	addi $sp, $sp, -8 	# move o ponteiro da pilha para tras
	
	jr $ra 			# volta para a posicao determinada pelo $ra
	
end_rec: # finaliza a recursao apos o caso base
	li $v0, 1 
	j desempilha
	
	
	
fib_seg:
	addi $sp, $sp, -12 
	sw $a1, 0($sp) 		# o primeiro argumento
	sw $a2, 4($sp) 		# o segundo argumento		
	sw $ra, 8($sp)
	
	move $t4, $a2 		# condicao de parada
	addi $t4, $t4, 1 	# fim do loop em a-1
	
loop_seg: 
	beq $a1, $t4, end_loop_seg 
	
	jal fibonacci 		# funcao que calcula o fibonacci de a2
	
	move $t0, $v0		# o retorno da funcao do fibonacci
	
	li $v0, 4
	la $a0, str_line 	# printa "\n"
	syscall
	
	li $v0, 4
	la $a0, str_tab		# printa "\t"
	syscall
	
	move $a0, $t0		
	li $v0, 1  		# printa o retorno
	syscall
	
	addi $a1, $a1, 1	# a = a + 1
		
	j loop_seg
		
end_loop_seg:
	lw $a1, 0($sp)		# recupero o valor de $a1	
	lw $a2, 4($sp)		# recupero o valor de $a2
	lw $ra, 8($sp)		# recupero o valor de $ra
	addi $sp, $sp, 12 	# desaloco a pilha
		
	jr $ra
	
fibonacci:
	addi $sp, $sp, -8 	# aloco 2 espacos de memoria na pilha
	sw $a1, 0($sp)		# empilho $a1
	sw $ra, 4($sp)		# empilho $ra
	
	addi $t0, $zero, 1 	# fib(1)
	addi $t1, $zero, 1 	# fib(2)
	addi $t3, $zero, 2 	# condicao de parada
	
	beq $a1, $t0, base_case
	beq $a1, $t3, base_case
	
loop_fib:
	beq $a1, $t3, end_loop_fib 
	
	add $v0, $t0, $t1 	# o proximo numero na sequencia
	move $t0, $t1 		# fib(n) = fib(n+1)
	move $t1, $v0 		# fib(n+1) = fib(n+2)
	addi $a1, $a1, -1 
		
	j loop_fib
		
end_loop_fib:
	lw $a1, 0($sp)		# recupero o valor de $a1
	lw $ra, 4($sp)		# recupero o valor de $ra
	addi $sp, $sp, 8 	# desaloco a pilha
		
	jr $ra
	
base_case:
	addi $v0, $zero, 1
	j end_loop_fib




end_main:
	li $v0, 10		# codigo para finalizar o programa
	syscall
	
	
repeat_main:		
	# caso o usuario digite um valor inapropriado de opcao, sera pedido para que ele digite um valor valido
	li $v0, 4
	la $a0, str_rep_opc
	syscall
	
	j main
	
			
erro:	# caso alguma entrada seja invalida, a operacao faz um jump para ca
	li $v0, 4 		# atribui 4 para $v0
	la $a0, str_erro	# atribui a string de erro para $a0
	syscall			# imprime "Entrada invalida!"
	
	j main			# volta para o menu
