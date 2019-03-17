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
	str_tab: .asciiz "6 - Tabuada\n"
	str_imc: .asciiz "7 - Calculo do IMC\n"
	str_fat: .asciiz "8 - Fatorial\n"
	str_fib: .asciiz "9 - Calculo da sequencia de Fibonacci no intervalo (a, b)\n"
	str_end: .asciiz "10 - Sair do programa\n"
	str_opc: .asciiz "\n- Bem-vindx a calculadora MIPS! Digite o numero correspondente a opcao que deseja selecionar: "
	str_n1: .asciiz "\nn1 = "
	str_n2: .asciiz "n2 = "
	str_peso: .asciiz "\npeso = "
	str_altura: .asciiz "altura (em cm) = "
	str_rep_opc: .asciiz "\n\nA opcao digitada nao existe. Digite uma opcao valida!\n"
	str_resu_soma: .asciiz ">> n1 + n2 = "
	str_resu_sub: .asciiz ">> n1 - n2 = "
	str_resu_mult: .asciiz ">> n1 * n2 = "
	str_resu_imc: .asciiz ">> IMC = "
	vezes: .asciiz " x "
	equals :	.asciiz " = " 
	n :	.asciiz "\n"

	
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
	
	# vai pegar a opcao do usuario
	li $v0, 5		# codigo para read_int
	syscall
	
	move $t0, $v0		# copia a opcao digitada pelo usuario para o registrador $t0
	
	
	# a seguir, definiremos em qual das funcoes o programa entrara
	
	beq $t0, $zero, soma		# se a opcao escolhida for 0, entao o programa entrara na funcao de soma
					# caso contrario, continuara procurando a opcao certa
					# a mesma ideia se aplica em cada um dos blocos de codigo abaixo (como se fossem diversos ifs)
	
	li $t1, 1			# carrego o valor constante 1 para o registrador $t1
	beq $t0, $t1, subt		# se o valor que o usuario digitou foi 1, entra na operacao de subtracao
	
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

	j main
	
tab:
	li $v0, 4		# print_str
	la $a0, str_n1		
	syscall
				
	li $v0, 5		# read_int
	syscall
	
	move $t0, $v0		# copia o valor digitado para $a0
	
	addi $t1, $zero, 1 		# primeiro numero
	addi $t3, $zero, 11		# condicao de parada
		
	loop_tab:
		beq $t1, $t3, end_loop_tab
					
		li $v0, 1		# print_int
		move $a0, $t0 		# printa o numero que foi passado como parametro
		syscall
	
		li $v0, 4		#print_str
		la $a0, vezes
		syscall
	
		li $v0,1 
		move $a0, $t1 #print the actual number
		syscall
	
		li $v0, 4
		la $a0, equals #print =
		syscall
	
		li $v0,1
		mul $t2, $a1, $t1 #print a * i
		move $a0, $t2 #print the result
		syscall
	
		li $v0, 4
		la $a0, n #print \n
		syscall
	
		addi $t1,$t1, 1 #go to the next number
	
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
	
repeat_main:	# caso o usuario digite um valor inapropriado de opcao, sera pedido para que ele digite um valor valido
	li $v0, 4
	la $a0, str_rep_opc
	syscall
	
	j main
