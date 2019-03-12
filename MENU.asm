
;******** NL: 1     ROBERTO ANTONIO AGUILAR MARTINEZ  10am
; 
;**************** menuCorto.asm **************
;******************************************



.model small
.stack
.data
    menu   db '--- MENU ---   ',10,13
           db '                              1,Sumar        ',10,13
           db '                              2,Restar       ',10,13
           db '                              3,Multiplicar  ',10,13
           db '                              4,Dividir      ',10,13
           db '                              5,Salir        ',10,13
           db '                              Opcion = $     '
    opcion db 0  
    
    n1 db 0
    n2 db 0
    r  db 0   
    msjN1   db  'introduce n1      :   $'
    msjN2   db  'introduce n2      :   $'
    msjR    db  'El resultado es   :   $'
    salto db 10,13    
    
    
.code 
    inicio: mov ax, @data
            mov ds,ax  
    tecla: 
            mov ah,0
            mov al,3
            int 10h
            
        mov ah,2  ;cursor
        mov dh,5  ;ren
        mov dl,30 ;col
        mov bh,0  ;pag
        int 10h
        
        mov ah,9
        lea dx,menu
        int 21h 
        
        
        mov ah,1
        int 21h
        mov opcion, al
        cmp opcion, '5'
        je fin
                
                
        ;**** LEER
        
        mov ah, 2
        mov dh, 15
        mov dl, 30
        mov bh, 0
        int 10h
        
            mov ah,9
            lea dx,msjN1
            int 21h
            
        mov ah, 2
        mov dh, 15
        mov dl, 50
        mov bh, 0
        int 10h
        
        
            mov ah,1
            int 21h
                mov n1,al
                sub n1,30h   
                
                ;**** LEERN2
        
        mov ah, 2
        mov dh, 16
        mov dl, 30
        mov bh, 0
        int 10h
        
            mov ah,9
            lea dx,msjN2
            int 21h
            
        mov ah, 2
        mov dh, 16
        mov dl, 50
        mov bh, 0
        int 10h
        
        
            mov ah,1
            int 21h
                mov n2,al
                sub n2,30h
    
        
        
        
        comparar:  
               mov ah, 2
               mov dl, salto
               int 21h
                           
               CMP opcion, '1' 
               je suma
               ;completar
               cmp opcion, '2'
               je resta
               cmp opcion, '3'
               je multiplicar
               cmp opcion, '4'
               je dividir
               
               jmp tecla ; JMP = salto a tecla  
               
        suma: 
                mov al, n1
                mov bl, n2
                add al, bl
                mov r,  al 
                add r, 30h
                     
                
                mov ah,2
                mov dh,17
                mov dl,30
                mov bh,0
                int 10h 
                
                mov ah,9
                lea dx, msjR
                int 21h  
                
                mov ah,2
                mov dl, r
                int 21h
                
                mov ah,0
                int 16h
                
                jmp tecla   
                    
        resta:  
        
                mov al, n1
                mov bl, n2
                sub al, bl
                mov r,  al 
                add r, 30h
                     
                
                mov ah,2
                mov dh,17
                mov dl,30
                mov bh,0
                int 10h 
                
                mov ah,9
                lea dx, msjR
                int 21h  
                
                mov ah,2
                mov dl, r
                int 21h
                
                mov ah,0
                int 16h
                
                jmp tecla  
        multiplicar: 
        
                mov al, n1
                mov bl, n2
                mul bl
                mov r,  al 
                add r, 30h
                     
                
                mov ah,2
                mov dh,17
                mov dl,30
                mov bh,0
                int 10h 
                
                mov ah,9
                lea dx, msjR
                int 21h  
                
                mov ah,2
                mov dl, r
                int 21h
                
                mov ah,0
                int 16h
                
                jmp tecla 
        dividir:   
                mov ax,0
                mov al, n1
                mov bl, n2
                
                div bl
                mov r,  al
                mov ah, 0 
                add r, 30h
                     
                
                mov ah,2
                mov dh,17
                mov dl,30
                mov bh,0
                int 10h 
                
                mov ah,9
                lea dx, msjR
                int 21h  
                
                mov ah,2
                mov dl, r
                int 21h
                
                mov ah,0
                int 16h
                
                jmp tecla 
                
                
               
    fin: mov ax,4c00h
         int 21h

end




