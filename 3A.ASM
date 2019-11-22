assume cs:code,ds:data

disp macro mes
lea dx,mes
mov ah,09
int 21h
endm

data segment
psd1 db "manju123"
len1 db len1-psd1
psd2 db 100 dup(?)
len2 db ?
mes1 db 0ah,0dh,"match$"
mes2 db 0ah,0dh,"not match$"
mes3 db 0ah,0dh,"enter d password$"
mes4 db 0ah,0dh,"exceed 3 attemps keyboard locked$"
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov es,ax
        mov bl,00

   repeat:
           call readpsd
           call match
           inc bl
           cmp bl,3
           jb repeat
           disp mes4
           mov ah,4ch
           int 21h
   readpsd proc
               disp mes3
               mov bh,00
               lea si,psd2

        again:
               mov ah,8
               int 21h
               cmp al,0dh
               je next
               mov [si],al
               inc si
               inc bh
               mov dl,"*"
               mov ah,2
               int 21h
               jmp again
        
        next:
                mov len2,bh
                ret
                readpsd endp

          match proc
                    mov cl,len1
                    cmp cl,len2
                    je matchstr
                    jmp mismatch

          matchstr:
                   lea si,psd1
                   lea di,psd2
                   mov ch,0
                   cld
                   rep cmpsb
                   jnz mismatch
                   disp mes1
                   mov ah,4ch
                   int 21h
            mismatch:
                       disp mes2
                       ret
                       match endp

                       code ends
                       end start
