assume cs:code
code segment

          start:
                  mov cx,100d
                  mov bl,00

             nextdigit:
                         mov al,bl
                         aam
                         add ax,3030h
                         mov dl,ah
                         mov ah,2
                         push ax
                         int 21h
                          pop ax
                          mov dl,al
                          mov ah,2
                          int 21h

                          mov dl,0dh
                          mov ah,2
                          int 21h
                          call delay
                          inc bl
                          loop nextdigit
                          mov ah,4ch
                          int 21h
                  delay proc
                           mov si,0222h
                           l2:mov di,02ffh
                           l1:dec di
                           jnz l1
                           dec si
                             jnz l2
                             ret
                             delay endp
                             code ends
                             end start
