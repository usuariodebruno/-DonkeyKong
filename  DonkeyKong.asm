.data #0x10010000
.text

#Rotina para calcular ponto (l,c) linha & coluna
#Formula: &pX = &p0 + (l * L + C) * 4
#Entrada $4 = &p0; $5 = l; $6 = L; $7 = c.
#Saida: $2
#usa (sem preservar): $8
#Obs: Não chega parametros


_main:  
	lui $4, 0x1001 #valor inicial da memoria
	addi $5, $0, 2 #valor de linhas	(l)
	addi $6, $0, 8 #valor unidade grafica (L)	
	addi $7, $0, 3 #valor coluna (c)
	jal _EndPxy

	lui $8, 0x00ff #Preparando cor
	sw $8, 0($2) #colocar o que está no registrador $8 em $2
_end:
	addi $2, $0, 10 #ordem de
	syscall 

_EndPxy:
	mul $8, $5, $6 #$8 = l * L
	add $8, $8, $7 #$8 = l * L + c
	sll $8, $8, 2 #$8 = (l * L + c)*4
	add $2, $8, $4 #$2 = $8  + &p0
_fimEPxy: jr $31