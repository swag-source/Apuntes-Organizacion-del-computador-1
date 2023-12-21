SET R0, 0x05
SET R1, 0X00
SET R2, 0x00
SET R3, 0x01
JZ fin

ciclo: 
ADD R2, R3
ADD R1, R2
CMP R2, R0
JZ fin
JMP ciclo

fin: 
JMP fin

