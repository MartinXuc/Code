;本函数要求数据段定义有：
;linefeed db 0ah,0dh,'$'
print_linefeed proc near
    print_linefeed_init:
        push ax
        push dx
    print_linefeed_body:
        lea dx,linefeed
        mov ah,09h
        int 21h
    print_linefeed_return:
        pop dx
        pop ax
        ret
print_linefeed endp