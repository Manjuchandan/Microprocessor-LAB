assume cs:code
code segment

   start:
            mov ah,2ch
            int 21h

            mov al,ch
            call hexa
            call disp
            mov dl,':'
            mov ah,2
            int 21h

            mov al,cl
            call hexa
            call disp

            mov ah,4ch
            int 21h

         disp proc
           push cx
           mov ah,00h
           mov cx,04h
           shl ax,cl
           shr al,cl
           add ax,3030h
           push ax
           mov dl,ah
           mov ah,2
           int 21h
           pop ax
           mov dl,al
           mov ah,2
           int 21h
           pop cx
           ret
           disp endp

      hexa proc
            push cx
            mov cl,al
            mov ch,0
            mov al,0
         next:
               add al,1
               daa
               loop next
               pop cx
               ret
               hexa endp

                code ends
                end start


