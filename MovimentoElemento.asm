.text
main: lui $8, 0x1001 #carregar cenraio
      addi $9, $0, 0xa1a1a1  #cor doElemento
      addi $10, $0, 32      
      
for1: beq $10, $0, fimlinha1
      sw $9, 0($8) # endereçõ recebe a cor
      jal timer
      sw $0, -4($8)
      addi $8, $8, 4
      addi $10, $10, -1
      j for1
fimlinha1: addi $8, $8, -4
      sll $9, $9, 8
     
      addi $10, $0, 16
for2: beq $10, $0, fimlinha2
      sw $9, 0($8)
      addi $8, $8, 128
      addi $10, $10, -1
      j for2  

fimlinha2: lui $8, 0x1001
      sll $9, $9, 8
     
      addi $10, $0, 16
for3: beq $10, $0, fimlinha3
      sw $9, 0($8)
      addi $8, $8, 128
      addi $10, $10, -1
      j for3      
fimlinha3: addi $8, $8, -124
      lui $9, 0x00ff
      ori $9, $9, 0xffff
     
      addi $10, $0, 30
for4: beq $10, $0, fimlinha4
      sw $9, 0($8)
      addi $8, $8, 4
      addi $10, $10, -1
      j for4
fimlinha4:

       addi $2, $0, 10
       syscall  
       
timer:  addi $20, $0, 90000
fortimer: beq $20, $0, fimtimer
          nop
          nop
          nop
          addi $20, $20, -1
          j fortimer      
fimtimer: jr $31
