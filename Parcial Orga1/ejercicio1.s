.text:

# inicializar programa
main:
    li a0, 0
    la a1, arr 
    li a2, 12 
    li a3, 0x5555

    call suma_arreglo
    
return:
    mv a0, s0
    j halt

halt:
    j halt
        
        
suma_arreglo:
    mv s0, a0 # se encargará de llevar cuenta de la suma.
    mv s1, a1 # guardo i-esimo elemento del array
    mv s2, a2 # longitud del arreglo.
    mv s3, a3 # guardo la constante para hacer el AND
    
    
loop:
    beqz s2, return
    
    lh t0, 0(s1)
    and t0, t0, s3 # realizo el AND con mi constante y valor del elemento del arreglo
    
    add s0, t0, s0 
    
    addi s1, s1, 2 
    addi s2, s2, -1 # decremento la cuenta de n en 1
    
    
    j loop ## iteramos n veces
    

exit:
    # Imprime la suma
    mv a0, t4
    li a7, 34
    ecall

    # Termina el programa.
    li a0, 0
    li a7, 93
    ecall

.data:
arr:
.half 0xffff, 0x5555, 0x4444, 0x1111
.half 0xffff, 0x5500, 0x5544, 0x1111
.half 0xff00, 0x5555, 0x4444, 0x1155
