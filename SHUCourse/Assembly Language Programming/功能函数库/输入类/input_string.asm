;从键盘中读取字符串，传入SI所指向的地址
;CX中存储字符长度限制
;本函数会在字符串结尾自动添加'$'
input_string proc near
    input_string_init:
        push ax
        push cx
        push si
    input_string_body:
        input_string_loop:
            mov ah,01h
            int 21h
            cmp al,0dh
            je input_string_return
            mov [si],al
            inc si
            loop input_string_loop
    input_string_return:
        mov [si],'$'
        pop si
        pop cx
        pop ax
        ret
input_string endp