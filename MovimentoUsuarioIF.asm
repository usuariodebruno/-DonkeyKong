#Entranda de teclado a microprocessador -> IRQ: interrupção | (star) Rotina de consulta periferico  name? - voce tem  RomRombim 
#Endereço de I/O 
# Leitura (LW ) -> 0 = nada informado | 1 - Há  -- Depois da leitura endereço um limpa    
# segundo endereço o informação  

#Keybord and Display MMIO

.text 

main: 
	lui $8, 0xffff #endereço da flag de pergunta
	
laco:
	addi $4, $0, '.'
	addi $2, 0, 11
	syscall 
	lw $9, 0($8)	 #regata o valor no endereço de memoria 
	beq $9, $0,  segue
	
	addi $10, $0, 'f' #letra de entrada 
	lw $11, 4($8) #pega o valor digitado (no segundo endereço)
	beq $10, $11, terminou #compara o digitado com o valor de segundo endereço 
	
	j terminou
	
segue:	j laco

terminou: addi $2, $0, 11
syscall 