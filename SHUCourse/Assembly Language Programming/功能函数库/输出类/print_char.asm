;输出dl寄存器中的一个字符
print_char proc near
    print_char_init:
        push ax
    print_char_body:
        mov al,02h
        int 21h
    print_char_return:
        pop ax
        ret
print_char endp