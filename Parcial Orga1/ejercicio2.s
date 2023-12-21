# Explicación

.text:
main:
    # Cargamos en registros de argumentos para funciones, source y destino.
    la a0, src
    la a1, dst
    li a2, 12 ## longitud array
    call array_or


return:
    mv ra, a1
    j halt

halt:
    j halt

 
array_or:
    mv s0, a0 # Dirección source a s0.
    mv s1, a1 # Dirección destino a s1.
    mv s2, a2 # me guardo la longitud para luego ir restando (funcionaria como mi "iterador").
    
    
loop:
    beqz s2, return  # Cuando terminamos nuestras iteraciones, volvemos a la etiqueta return
    
    mv t0, zero 
    lw a3, 0(s0)
    lw a4, 0(s1)
    
    or t0, a3, a4 # Hago el "or" entre los valores de mis dos registros
    
    sw t0, 0(s1) # Guardo en el registro s1 el valor de OR entre a0 y a1 (que esta en t0)
    
    addi s0, s0, 4 # sumo 4 bytes al valor almacenado en s0 (src)
    addi s1, s1, 4 # sumo 4 bytes al valor almacenado en s1 (dst)
    addi s2, s2, -1 # decremento la cuenta de n en 1
    
    j loop ## iteramos



imprimir:
    la t2, dst
    # Cantidad de datos.
    li t3, 12
loop_imprimir:
    beqz t3, exit
    addi t3, t3, -1
    lw t4, 0(t2)
    # Imprime el resultado
    mv a0, t4
    li a7, 34
    ecall
    addi t2, t2, 4

    j loop_imprimir
exit:
    # Termina el programa.
    li a0, 0
    li a7, 93
    ecall

.data:
src:
.word 0xffffffff, 0x95555555, 0xf4444444, 0xf1111111
.word 0xffffff00, 0xf5005555, 0x95444444, 0xf1113311
.word 0xff00ffff, 0xf5550055, 0xa4444433, 0xa1551111      
dst:
.word 0xf5005555, 0x95444444, 0xf1113311, 0xffffff00
.word 0xf1111111, 0xffffffff, 0x95555555, 0xf4444444
.word 0xa1551111, 0xff00ffff, 0xf5550055, 0xa4444433
