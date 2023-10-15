;本函数要求dx寄存器中已经保存好了待输出字符串的地址
print_msg proc near
    print_msg_init:
        push ax
    print_msg_body:
        mov ah,09h
        int 21h
    print_msg_return:
        pop ax
        ret
print_msg endp