assume cs:code,ds:data
data segment
str1 db "madama"
n db n-str1
str2 db 5 dup(?)
msg1 db "palindrome$"
msg2 db "not palindriome$"
data ends
code segment
   start:
          mov ax,data
          mov ds,ax
          mov es,ax
          mov cl,n
          lea si,n
          dec si
          lea di,str2

  nextchar:
             mov al,[si]
             mov [di],al
             dec si
             inc di
             loop nextchar
             lea si,str1
             lea di,str2
             mov cl,n
             cld
             rep cmpsb
             jnz unsuccess
             lea dx,msg1
             jmp disp
       unsuccess:
                   lea dx,msg2
                   jmp disp
          disp:
                mov ah,09h
                int 21h
                mov ah,07h
                int 21h
                mov ah,4ch
                int 21h

                code ends
                end start
            
