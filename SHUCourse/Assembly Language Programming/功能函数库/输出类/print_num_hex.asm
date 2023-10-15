;将AX寄存器中数字输出
;需要定义hexChars:
;hexChars db '0123456789ABCDEF$'
print_num_hex proc near
    print_num_hex_init:
        push ax
        push cx
        push dx
        push si
    print_num_hex_body:
        mov cx,4
        print_num_hex_loop:
            push cx
            mov cl,4
            rol ax,cl
            push ax
            and ax,000fh
            lea si,hexChars
            add si,ax
            mov dl, byte ptr [si]
            mov ah,02h
            int 21h
            pop ax
            pop cx
            loop print_num_hex_loop
        mov dl,'H'
        mov ah,02h
        int 21h
    print_num_hex_return:
        pop si
        pop dx
        pop cx
        pop ax
        ret
print_num_hex endp