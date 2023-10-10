data segment
    x dw ?
    y dw ?
    result dw ?
    overflow_msg db 'Detected Error: Overflow!', '$'  ; 溢出错误消息
    rst_msg db 'The result is: ', '$'  ; 结果消息
    restore_msg db 'It has been stored in RESULT!', '$'  ; 结果存储消息
    linefeed db 0ah,0dh,'$'  ; 换行字符
    hexChars db '0123456789ABCDEF$'  ; 用于打印十六进制数字的字符数组
data ends

code segment
    assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax

    mov x, 51
    mov y, 100

    mov ax, x
    cmp ax, 50
    jle exit  ; 如果ax小于等于50，则跳转到exit

    jmp too_high

too_high:
    sub ax, y
    jo overflow  ; 如果结果溢出，跳转到overflow
    cmp ax, 0
    jge store_result  ; 如果结果大于等于0，跳转到store_result
    neg ax  ; 结果为负数时，取其绝对值

store_result:
    mov result, ax  ; 将结果存储到result变量
    lea dx, rst_msg
    call print_string  ; 打印结果消息
    mov cx, ax
    call print_num_cx  ; 打印十进制数字
    call print_linefeed  ; 打印换行
    lea dx, restore_msg
    call print_string  ; 打印结果存储消息
    call print_linefeed  ; 打印换行
    jmp exit

overflow:
    lea dx, overflow_msg
    call print_string  ; 打印溢出错误消息
    call print_linefeed  ; 打印换行
    jmp exit

exit:
    mov ah, 4ch
    int 21h  ; 程序退出

print_string:
    push ax
    mov ah, 09h
    int 21h  ; 使用中断21h和功能号09h打印字符串
    pop ax
    ret

print_linefeed:
    push ax
    lea dx, linefeed
    mov ah, 09h
    int 21h  ; 使用中断21h和功能号09h打印换行字符
    pop ax
    ret

print_character:
    push ax
    mov ah, 02h
    int 21h  ; 使用中断21h和功能号02h打印字符
    pop ax
    ret

print_num_cx:
    push ax
    mov bx, 4

    loop4:
        rol cx, 4  ; 将cx寄存器循环左移4位
        mov al, cl
        and ax, 000fh  ; 与操作，获取ax的低4位
        mov si, offset hexChars
        add si, ax  ; 获取hexChars中对应的字符
        mov dl, byte ptr [si]
        call print_character
        dec bx
        jnz loop4  ; 循环4次
    mov dl, 'H'
    call print_character
    pop ax
    ret

code ends
end start