;将CX寄存器中的数值以4位hex数值进行输出
print_cx prog near:
    push ax
    mov bx, 4
    loop4:
        rol cx, 4  ; 将cx寄存器循环左移4位
        mov al, cl
        and ax, 000fh  ; 与操作，获取ax的低4位
        mov si, offset hexChars
        add si, ax  ; 获取hexChars中对应的字符
        mov dl, byte ptr [si]
        mov ah,02h
        int 21h
        dec bx
        jnz loop4  ; 循环4次
    mov dl, 'H'
    mov ah,02h
    int 21h
    pop ax
    ret
print_cx endp