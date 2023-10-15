data segment
    linefeed db 0ah,0dh,'$'
    helloworld_msg db 'helloword$'
    hexChars db '0123456789ABCDEF$'
    string_buffer db 50 dup(?),'$'
    count dw ?

data ends

code segment
    assume cs:code,ds:data,es:data

start:
;基本准备
    mov ax,data
    mov ds,ax
    mov es,ax
test_body:
    lea si,string_buffer
    mov cx,6
    call input_string
    mov dx,si
    call print_msg
end_proc:
    mov ah,4ch
    int 21h

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

code ends
end start