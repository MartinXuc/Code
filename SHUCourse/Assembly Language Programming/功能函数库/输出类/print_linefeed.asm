print_linefeed proc near
    print_linefeed_init:
        push ax
        push dx
    print_linefeed_body:
        mov dl,0ah
        call print_char
        mov dl,0dh
        call print_char
        int 21h
    print_linefeed_return:
        pop dx
        pop ax
        ret
print_linefeed endp