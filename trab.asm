.data	# diretiva para inicio do segmento de dados
	.align 0	# alinha os dados byte a byte na memoria
	str_menu: .asciiz "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MENU PRINCIPAL <<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n"		# definindo a string str_menu
	str_avisa: .asciiz "(Todos os numeros fornecidos para as operacoes abaixo devevm ser inteiros)\n"		# definindo a string str_avisa
	str_soma: .asciiz "0 - Soma\n"	# e assim por diante...
	str_sub: .asciiz "1 - Subtracao\n"
	str_mult: .asciiz "2 - Multiplicacao (ambos devem ser de, no maximo, 16 bits)\n"
	str_div: .asciiz "3 - Divisao (ambos devem ser de, no maximo, 16 bits)\n"
	str_pot: .asciiz "4 - Potenciacao (primeiro elevado ao segundo)\n"
	str_sqrt: .asciiz "5 - Raiz quadrada\n"
	str_tabu: .asciiz "6 - Tabuada\n"
	str_imc: .asciiz "7 - Calculo do IMC\n"
	str_fat: .asciiz "8 - Fatorial\n"
	str_fib: .asciiz "9 - Calculo da sequencia de Fibonacci no intervalo (a, b)\n"
	str_end: .asciiz "10 - Sair do programa\n"
	str_opc: .asciiz "\n- Bem-vindx a calculadora MIPS! Digite o numero correspondente a opcao que deseja selecionar: "
	str_n1: .asciiz "\nn1 = "
	str_n2: .asciiz "n2 = "
	str_peso: .asciiz "\nPeso = "
	str_altura: .asciiz "Altura (em cm) = "
	str_rep_opc: .asciiz "\n\nA opcao digitada nao existe. Digite uma opcao valida!\n"
	str_resu_soma: .asciiz ">> n1 + n2 = "
	str_resu_sub: .asciiz ">> n1 - n2 = "
	str_resu_mult: .asciiz ">> n1 * n2 = "
	str_resu_imc: .asciiz ">> IMC = "
	str_vezes: .asciiz " x "
	str_igual: .asciiz " = " 
	str_line: .asciiz "\n"		# quebra de linha
	str_tab: .asciiz "\t"		# tab
	str_sqrt_num: .asciiz "Digite um número inteiro positivo:\n"
	str_sqrt_erro: .asciiz "Entrada inválida."
	str_res: .asciiz "Resultado:"
	str_exp: .asciiz "Digite o valor de exp:"
	.align 4
	numeroPrecisao: .float 0.00001
	numero2: .float 2

	
.text	# diretiva para inicio do segmento de texto
	.globl main		# seta a label main como global
	
main:	# inicio do programa
	
	# vai imprimir uma string
	li $v0, 4			# atribui 4 para $v0. Codigo para print_str
	la $a0, str_menu		# carrega o endereco de str_menu em $a0
	syscall				# chamada de sistema para E/S (imprime a string que tem o endereï¿½o em $a0)
	
	# repetiremos o bloco de codigo acima sempre que quisermos imprimir uma string
	
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
	la $a0, str_tabu
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
	
	# vai pegar a opcao do usuario
	li $v0, 5		# codigo para read_int
	syscall
	
	move $t0, $v0		# copia a opcao digitada pelo usuario para o registrador $t0
	
	
	# a seguir, definiremos em qual das funcoes o programa entrara
	
	bne $t0, $zero, soman		# se a opcao escolhida for 0, entao o programa entrara na funcao de soma
					# caso contrario, continuara procurando a opcao certa
					# a mesma ideia se aplica em cada um dos blocos de codigo abaixo (como se fossem diversos ifs)
					
		j soma			# jump para a linha de codigo da operacao
		j main			# retorna para o menu
	soman:
			
	li $t1, 1			# carrego o valor constante 1 para o registrador $t1
	bne $t0, $t1, subtn		# se o valor que o usuario digitou foi 1, entra na operacao de subtracao
		j subt			# jump para a linha de codigo da operacao
	subtn:
	
	
	
	li $t1, 2			# carrego o valor constante 2 para o registrador $t1
	bne $t0, $t1, multin		# se o valor que o usuario digitou foi 2, entra na operacao de mutiplicacao
		j multi			# jump para a linha de codigo da operacaooperacao
		
	multin:
	
	
	
	li $t1, 3			# carrego o valor constante 3 para o registrador $t1
	bne $t0, $t1, divin		# se o valor que o usuario digitou foi 3, entra na operacao de divisao
		
		li $v0, 4		# carrega 4 para v0, (imprimir string)
		la $a0, str_n1		#salva o endereço da string em a0
		syscall			#printa string
	
		li $v0, 5		# carrega 5 para v0, (le int)
		syscall			# le o numero digitado
	
		move $a0, $v0		# atribui n1 para $a0
	
		li $v0, 4		# carrega 4 para v0, (imprimir string)
		la $a0, str_n2		#salva o endereço da string em a0
		syscall			#printa string
	
		li $v0, 5		# carrega 5 para v0, (le int)
		syscall			# le o numero digitado
	
		move $a1, $v0		# atribui n2 para $a1
		
		beqz $a1 divi_erro	# verifica se a entrada é valida
		
		jal divi		# jump para a linha de codigo da operacao
		
		li $v0, 4		# carrega a instrucao para o v0
		la $a0, str_res	# carrega o endereco da string que sera mostrada (resposta)
		syscall			# imprime a a string
		
		li $v0, 2		# carrega a instrucao para mostrar um float
		mov.s $f12, $f0 	# move o retorno da funcao para f12, o qual sera printado
		syscall			# chama o sistema para mostrar na tela o numero
		
		j main
		
	divi_erro:
		li $v0, 4		# carrega a instrucao para o v0
		la $a0, str_sqrt_erro	# carrega o endereco da string que sera mostrada
		syscall			# imprime a a string
			
	divin:
	
	
		
	li $t1, 4			# carrego o valor constante 4 para o registrador $t1
	bne $t0, $t1, potn		# se o valor que o usuario digitou foi 4, entra na operacao de potencia
		j pot			# jump para a linha de codigo da operacao
	potn:
	
	
	
	li $t1, 5			# carrego o valor constante 5 para o registrador $t1
	bne $t0, $t1, sqrtn 		# se o valor que o usuario digitou foi 5, entra na operacao de raiz
		
		li $v0, 4		# carrega a instrucao para o v0
		la $a0, str_sqrt_num	# carrega o endereco da string que sera mostrada
		syscall			# imprime a a string
		
		li $v0, 5 		# Le o interio para o calculo da raiz
		syscall		       	#chama o sistema para ler o numero
		move $a0, $v0 		# move o numero para a0, pois a0 é o parametro da funcao
		
		bltz $a0 sqrtn_erro	# verifica se a entrada é valida
		
		jal sqrt 		# chama o procedimento para calcular a raiz
		
		li $v0, 4		# carrega a instrucao para o v0
		la $a0, str_res		# carrega o endereco da string que sera mostrada (resposta)
		syscall			# imprime a a string
		
		li $v0, 2		# carrega a instrucao para mostrar um float
		mov.s $f12, $f0 	# move o retorno da funcao para f12, o qual sera printado
		syscall			# chama o sistema para mostrar na tela o numero
		
		j main 			# retorna para o menu
	
	sqrtn_erro:
		li $v0, 4		# carrega a instrucao para o v0
		la $a0, str_sqrt_erro	# carrega o endereco da string que sera mostrada
		syscall			# imprime a a string
	
	sqrtn:
	
	
	
	li $t1, 6			# carrego o valor constante 6 para o registrador $t1
	bne $t0, $t1, tabn		# se o valor que o usuario digitou foi 6, entra na operacao de tabuada
		j tab			# jump para a linha de codigo da operacao
	tabn:
	
	
	
	li $t1, 7			# carrego o valor constante 7 para o registrador $t1
	bne $t0, $t1, imcn		# se o valor que o usuario digitou foi 7, entra na operacao de IMC
		j imc			# jump para a linha de codigo da operacao
	imcn:



	li $t1, 8			# carrego o valor constante 8 para o registrador $t1
	bne $t0, $t1, fatn		# se o valor que o usuario digitou foi 8, entra na operacao de fatorial
		j fat			# jump para a linha de codigo da operacao
	fatn:

	
			
	li $t1, 9			# carrego o valor constante 9 para o registrador $t1
	bne $t0, $t1, fibn		# se o valor que o usuario digitou foi 9, entra na operacao de Fibonacci
		j fib			# jump para a linha de codigo da operacao
	fibn:
	
	
	
	li $t1, 10			# carrego o valor constante 10 para o registrador $t1
	beq $t0, $t1, end		# se o valor que o usuario digitou foi 10, encerra o programa
	
	j repeat_main			# caso o usuario entre com um numero invalido de opcao

soma:
	li $v0, 4		# print_str
	la $a0, str_n1		
	syscall
	
	li $v0, 5		# read_int
	syscall
	
	move $t0, $v0		# atribui n1 para $t0
	
	li $v0, 4		# print_str
	la $a0, str_n2		
	syscall
	
	li $v0, 5		# read_int
	syscall
	
	move $t1, $v0		# atribui n2 para $t1
	
	add $t0, $t0, $t1	# n1 = n1 + n2
	
	li $v0, 4		# print_str
	la $a0, str_resu_soma
	syscall
	
	li $v0, 1		# print_int
	move $a0, $t0		# ira colocar o resultado da soma em $a0, para que seja printado
	syscall

	j main			# o programa pedira por uma nova opcao
	
subt:
	li $v0, 4		# print_str
	la $a0, str_n1
	syscall
	
	li $v0, 5		# read_int
	syscall
	
	move $t0, $v0		# atribui n1 para $t0
	
	li $v0, 4		# print_str
	la $a0, str_n2
	syscall
	
	li $v0, 5		# read_int
	syscall
	
	move $t1, $v0		# atribui n2 para $t1
	
	sub $t0, $t0, $t1	# n1 = n1 - n2
	
	li $v0, 4		# print_str
	la $a0, str_resu_sub
	syscall
	
	li $v0, 1		# print_int
	move $a0, $t0		# ira colocar o resultado da subtração em $a0, para que seja printado
	syscall

	j main			# o programa pedira por uma nova opcao
	
multi:
# atribui 4 para $v0. Imprimi "Digite o valor de n1: "
	li $v0, 4 
	la $a0, str_n1
	syscall
	
erro_n1_mult:
	# atribui 5 para $v0. Le o valor de n1
	li $v0, 5
	syscall
	
	# Testa se o numero lido possui 16 bits
	# Substraindo o maior numero possivel (2^16 - 1)
	# E testando se essa subtracao tem resultado maior que zero (o que eh errado caso aconteca)
	
	# Para chegarmos no valor maximo = '46341', fizemos a seguinte funcao em C
	# que imprime os valores máximos de 'a' e 'b' aceitos para uma multiplcacao
	# até que o resultado (c) de erro (overflow)
	
	# int main() {
	#	
	# 	 int a = 32767,b = 32767;
	#	 int c;
	#
	#	 do {
	#		 c = a * b;
	#		 a++;
	#		 b++;
	#	 } while (c > 0);
	#
	#	 printf("%d %d", a, b);
	#
	#	 return 0;
	# }
	
	# E a partir desta funcao, tivemos a = b = 46342
	# Usamos, portante, o valor maximo permitido antes do ultimo incremento = 46341
	
	li $t3, 46341
	sub $t3, $v0, $t3
	bgt $t3, $zero, erro_n1_mult
	
	# registrador $t0 recebe valor digitado pelo usuario que esta em $v0
	# $t0 <- n1
	move $t0, $v0
	# atribui 4 para $v0. Imprime "Digite o valor de n2: "
	li $v0, 4
	la $a0, str_n2
	syscall 
erro_n2_mult:
	# atribui 5 para $v0. Le o valor de n2
	li $v0, 5
	syscall
	# Testa se o numero lido possui 16 bits
	# Substraindo o maior numero possivel (2^16 - 1)
	# E testando se essa subtracao tem resultado maior que zero (o que eh errado caso aconteca)
	li $t3, 46341
	sub $t3, $v0, $t3
	bgt $t3, $zero, erro_n2_mult
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
	la $a0, str_resu_mult
	syscall
	
	# imprime $t2 (resultado da mult)
	li $v0, 1
	move $a0, $t2
	syscall
	
	# pula uma linha
	li $v0, 4
	la $a0, str_line
	syscall
	
	j main
	
divi:
	#OBS f0 nao é salvo pois ele sera usado como retorno, sendo assim, seu valor sera alterado de 
	#qualquer forma
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	swc1 $f1, ($sp) # Guarda o registrador na pilha, f1 é o denominador da divisao
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	swc1 $f2, ($sp) # Guarda o registrador na pilha, f2 é o divisor da divisao
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	sw $v0, ($sp) # Guarda o registrador na pilha, v0 é usado para chamar procedimentos
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	sw $a0, ($sp) # Guarda o registrador na pilha, a0 é usado para passar parametros para o sistema
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	sw $a1, ($sp) # Guarda o registrador na pilha, t0 é usado para armazenar temporariamente o denominador
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	sw $ra, ($sp) # Guarda o registrador na pilha, ra possui o endereco de retorno
	
	
	mtc1 $a0, $f1 		# Copia o valor passado como parametro para f1
	cvt.s.w $f1, $f1 	# Comverte o valor para float
	
	mtc1 $a1, $f2 		# Copia o valor passado como parametro para f2
	cvt.s.w $f2, $f2 	# Comverte o valor para float
	
	div.s $f1, $f1, $f2 	# realia a multiplicao e salva em f1, apaga o denominador
	
	
	mov.s $f0, $f1 # move o f1, q é o x1, para f0 que sera o registrado de retorno
	
	lw $ra, ($sp) # Recupero o valor de ra da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lw $a1, ($sp) # Recupero o valor de a1 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lw $a0, ($sp) # Recupero o valor de a0 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lw $v0, ($sp) # Recupero o valor de v0 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f2, ($sp) # Recupero o valor de f2 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f1, ($sp) # Recupero o valor de f1 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	jr $ra
	
pot:
# atribui 4 para $v0. Imprimi "Digite o valor de n: "
	li $v0, 4 
	la $a0, str_n1
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
	la $a0, str_exp
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
	la $a0, str_res
	syscall
	
	# imprime $t3 (resultado da pot)
	li $v0, 1
	move $a0, $t3
	syscall
	
	# pula uma linha
	li $v0, 4
	la $a0, str_line
	syscall

	j main
	
sqrt:
	#OBS f0 nao é salvo pois ele sera usado como retorno, sendo assim, seu valor sera alterado de 
	#qualquer forma
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	sw $ra, ($sp) # Guarda o registrador na pilha, ra é o local de retorno na main`
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	swc1 $f1, ($sp) # Guarda o registrador na pilha, f1 é a variavel x1, x1 armazena o chute inicialmente
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	swc1 $f2, ($sp) # Guarda o registrador na pilha, f2 é a variavel x2, guarda o resultado do calculo
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	swc1 $f3, ($sp) # Guarda o registrador na pilha, f3 guarda o valor anteriro para se ferificar a precisao do resultado
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	swc1 $f4, ($sp) # Guarda o registrador na pilha, f4 guarda valor enviado como parametro

	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	swc1 $f5, ($sp) # Guarda o registrador na pilha, f5 guarda o valor 2.0, muito usado no calculo de raiz
			
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	swc1 $f6, ($sp) # Guarda o registrador na pilha, f6 guarda o valor de precisao desejado
	
	subi $sp, $sp, 4 # Move o ponteiro da pilha para o proximo end vazio
	swc1 $f7, ($sp) # Guarda o registrador na pilha, f7 guarda o valor do calculo da precisao
	
					
	mtc1 $a0, $f4 # Copia o valor passado como parametro para f4
	cvt.s.w $f4, $f4 # Comverte o valor para float
	
	lwc1 $f5, numero2 # Carrega 2 no registrador, usado muito no calculo
	
	div.s $f1, $f4, $f5 # Calcula o chute, sendo ele raiz/2

	lwc1 $f6, numeroPrecisao # Carrega a precisao do calculo da raiz
	
	#Realiza a primeira conta antes de entrar no loop, simula um do while
	
	div.s $f2, $f4, $f1 #Realiza a conta raiz/x1
	add.s $f2, $f2, $f1  #Realiza a conta (raiz/x1) + x1
	div.s $f2, $f2, $f5 #Realiza a conta ((raiz/x1) + x1)/2
	
	mov.s $f3, $f1 #Registra o valor anterior em f2
	mov.s $f1, $f2
	
	#Loop para aumento da precisao da raiz ate o desejado
	LoopRaiz:
		sub.s $f7, $f3, $f1 # calcula a precisao
		abs.s $f7, $f7 # converte para positivo
		c.le.s $f7, $f6
		bc1t RaizSai
		div.s $f2, $f4, $f1 #Realiza a conta raiz/x1
		add.s $f2, $f2, $f1  #Realiza a conta (raiz/x1) + x1
		div.s $f2, $f2, $f5 #Realiza a conta ((raiz/x1) + x1)/2
	
		mov.s $f3, $f1 #Registra o valor anterior em f2
		mov.s $f1, $f2
		
		j LoopRaiz
	
	RaizSai:
	
	mov.s $f0, $f1 # move o f1, q é o x1, para f0 que sera o registrado de retorno
	
	lwc1 $f7, ($sp) # Recupero o valor de f7 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f6, ($sp) # Recupero o valor de f6 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f5, ($sp) # Recupero o valor de f5 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f4, ($sp) # Recupero o valor de f4 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f3, ($sp) # Recupero o valor de f3 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f2, ($sp) # Recupero o valor de f2 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lwc1 $f1, ($sp) # Recupero o valor de f1 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	lw $ra, ($sp) # Recupero o valor de f7 da pilha
	addi $sp, $sp, 4 # Volta 1 end na pilha, para o proximo com dados
	
	jr $ra
	
	
tab:
	li $v0, 4		# print_str
	la $a0, str_n1		
	syscall
				
	li $v0, 5		# read_int
	syscall
	
	move $t0, $v0		# copia o valor digitado para $t0
	
	addi $t1, $zero, 1 		# primeiro numero
	addi $t3, $zero, 11		# condicao de parada
	
	li $v0, 4			# print_str
	la $a0, str_line		# adiciona um \n por motivos de formatacao
	syscall
		
	loop_tab:
		beq $t1, $t3, end_loop_tab
		
		li $v0, 4		# print_str
		la $a0, str_tab		# adiciona um \t por motivos de formatacao
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
	
		li $v0, 4		# print_str
		la $a0, str_line	# quebra de linha
		syscall
	
		addi $t1, $t1, 1 	# i = i + 1
	
		j loop_tab 
	
	end_loop_tab:
		j main		# o programa pedira por uma nova opcao
	
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
	
	mul $t1, $t1, $t1	# altura ^ 2
	
	li $t2, 10000
	mul $t0, $t0, $t2	# peso = peso * 10000 (compensa o fato de a altura estar em cm)
	
	div $t0, $t0, $t1	# IMC = peso / (altura ^ 2)
	
	li $v0, 4		# print_str
	la $a0, str_resu_imc
	syscall
	
	li $v0, 1		# print_int
	move $a0, $t0		# copia o valor do IMC para o registrador que sera usado na impressao
	syscall

	j main			# o programa pedira por uma nova opcao
	
fat:
# atribui 4 para $v0. Imprimi "Digite o valor de n: "
	li $v0, 4 
	la $a0, str_n1
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
	# imprime
	li $v0, 4
	la $a0, str_res
	syscall
	
	# imprime $t2 (resultado da fat)
	li $v0, 1
	move $a0, $t2
	syscall
	
	# pula uma linha
	li $v0, 4
	la $a0, str_line
	syscall
	
	j main
	
fib :
		
	li $v0,4
	la $a0,str_n1 #print n1 =
	syscall
		
	li $v0,5
	syscall #read the first number
	move $a1,$v0
		
	li $v0,4
	la $a0,str_n2 #print n2 =
	syscall
		
	li $v0,5
	syscall #read the second number
	move $a2,$v0
	
	jal fib_seg
	j main
	
fib_seg:

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
		la $a0, str_line #print \n
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
	
	loop_fib :
		beq $a1,$t3,end_loop_fib 
		add $v0,$t0,$t1 #the next fibonachi number
		move $t0,$t1 #fib(n) = fib(n+1)
		move $t1,$v0 #fib(n+1) = fib(n+2)
		addi $a1,$a1,-1 
		
		j loop_fib
		
	end_loop_fib :
		lw $a1, 0($sp)		
		lw $ra, 4($sp)
		addi $sp,$sp,8 
		
		jr $ra

end:
	li $v0, 10		# codigo para finalizar o programa
	syscall
	
repeat_main:		# caso o usuario digite um valor inapropriado de opcao, sera pedido para que ele digite um valor valido
	li $v0, 4
	la $a0, str_rep_opc
	syscall
	
	j main