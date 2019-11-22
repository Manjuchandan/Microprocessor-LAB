assume cs:code,ds:data
data segment
a db 10h,11h,13h,14h,15h
n db n-a
key db 13h
msg1 db "key is not found$"
msg2 db "key is found at position"
pos db ?,"$"
data ends

code segment
  start:
         mov ax,data
         mov ds,ax
         mov al,0
         mov dl,n
         dec dl

  again:
          cmp al,dl
          ja failed
          mov cl,al
          add al,dl
          shr al,1
          mov ah,00h
          mov si,ax
          mov bl,[si]
          cmp bl,key
          jae loc1
          inc al
          jmp again

    loc1:
           je success
           dec al
           mov dl,al
           mov al,cl
           jmp again

  success:
           inc al
           add al,30h
           mov pos,al
           lea dx,msg2
           jmp display

   failed:
           lea dx,msg1
           jmp display

    display:
              mov ah,09h
              int 21h
              mov ah,4ch
              int 21h

              code ends
              end start
             
