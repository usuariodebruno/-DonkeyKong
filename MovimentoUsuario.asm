#Entranda de teclado a microprocessador -> IRQ: interrup��o | (star) Rotina de consulta periferico  name? - voce tem  RomRombim 
#Endere�o de I/O 
# Leitura (LW ) -> 0 = nada informado | 1 - H�  -- Depois da leitura endere�o um limpa    
# segundo endere�o o informa��o  

#Keybord and Display MMIO

.text 

main: 
	lui $8, 0xffff #endere�o da flag de pergunta
	
laco:
	addi $4, $0, '.'
	addi $2, 0, 11
	syscall 
	lw $9, 0($8)	 #regata o valor no endere�o de memoria 
	beq $9, $0,  segue
	j terminou
	
segue:	j laco

terminou: addi $2, $0, 11
syscall 