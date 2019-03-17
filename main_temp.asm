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
	#Codigo
	j soma
	soman:
			
	li $t1, 1			# carrego o valor constante 1 para o registrador $t1
	bne $t0, $t1, subtn		# se o valor que o usuario digitou foi 1, entra na operacao de subtracao
	#Codigo
	j subt
	subtn:
	
	
	
	li $t1, 2
	bne $t0, $t1, multin
	#Codigo
	j multi
	multin:
	
	
	
	li $t1, 3
	bne $t0, $t1, divin
	#Codigo
	j divi
	divin:
	
	
	
	li $t1, 4
	bne $t0, $t1, potn
	#Codigo
	j pot
	potn:
	
	
	
	li $t1, 5
	bne $t0, $t1, sqrtn
	
		li $v0, 5 # Le o interio para o calculo da raiz
		syscall
		move $a0, $v0
		
		j sqrt
	sqrtn:
	
	
	
	li $t1, 6
	bne $t0, $t1, tabn
	#Codigo
	j tab
	tabn:
	
	
	
	li $t1, 7
	bne $t0, $t1, imcn
	#Codigo
	j imc
	imcn:



	li $t1, 8
	bne $t0, $t1, fatn
	#Codigo
	fatn:

	
			
	li $t1, 9
	bne $t0, $t1, fibn
	#Codigo
	fibn:
	
	
	
	li $t1, 10
	beq $t0, $t1, end
	
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

	j main
	
divi:

	j main
	
pot:
	


	j main
	
sqrt:
	#OBS f0 nao é salvo pois ele sera usado como retorno, sendo assim, seu valor sera alterado de 
	#qualquer forma
	
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
	
	li $v0, 2
		mov.s $f12, $f0
		syscall	

	j main
	
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