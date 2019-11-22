assume cs:code,ds:data
data segment
fibo db 10 dup(?)
n db 0ah
data ends
code segment
   start:
          mov ax,data
          mov ds,ax
          lea si,fibo
          mov al,00
          mov [si],al
          inc si

          mov bl,01
          mov [si],bl
          inc si

          mov cl,n
          sub cl,2

     next:
             add al,bl
             mov [si],al
             inc si
             xchg al,bl
             loop next
             mov ah,4ch
             int 21h
             code ends
             end start
