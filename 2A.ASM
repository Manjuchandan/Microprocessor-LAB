assume cs:code,ds:data
data segment
x db 10h,05h,07h,12h,03h
n db n-x
data ends



   code segment
     start:
            mov ax,data
            mov ds,ax
            mov bl,n
            dec bl

    nextpass:
                mov cl,bl
               mov ah,00
               lea si,x
     nextcmp:
                 mov al,[si]
                 cmp al,[si+1]
                 jle do_nothing
                 xchg al,[si+1]
                 mov [si],al
                 mov ah,1
       do_nothing:
                     inc si
                     loop nextcmp
                     cmp ah,0
                     je finish
                     dec bl
                     jnz nextpass
       finish:
                mov ah,4ch
                int 21h
                code ends
                end start


