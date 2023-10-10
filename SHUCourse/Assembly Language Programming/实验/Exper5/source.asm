data segment
    keyword db 80 dup(?) ; 用于存储输入的关键字字符串
    sentence db 80 dup(?) ; 用于存储输入的句子字符串
    string_length dw ?
    string_length_keyword dw ?
    string_length_sentence dw ?
    ostring_keyword db "Enter keyword : $"
    ostring_sentence db "Enter sentence : $"
    ostring_match1 db "Match at location : $"
    ostring_match2 db " of the sentence.$"
    ostring_nomatch db "No match. $"
    error_length db "Illegal length! Input again : $"
    linefeed db 0ah,0dh,"$"
data ends

code segment
    assume cs:code, ds:data

start:
    mov ax, data 
    mov ds, ax
    mov es, ax

input_keyword:
    ;输出提示信息
    lea dx,ostring_keyword
    call print_string
    ;输入keyword
    mov cx,80
    lea di,keyword
    call input_string
    ;记录keyword长度
    mov ax,string_length
    mov string_length_keyword,ax

input_sentence:
    ;输出提示信息
    lea dx,ostring_sentence
    call print_string
    ;输入sentence
    mov cx,80
    lea di,sentence
    call input_string
    ;记录sentence长度
    mov ax,string_length
    mov string_length_sentence,ax
    ;比较sentence长度是不是小于keyword长度
    mov ax,string_length_sentence
    cmp ax,string_length_keyword
    jge compare_module
    ;句子长度太小了，重新输入
    lea dx,error_length
    call print_string
    call print_linefeed
    jmp input_sentence

compare_module:
    ;bx记录循环次数，同时也是sentence地址
    mov bx,1
    ;循环标签
    cmp_loop:
    ;计算剩余sentence长度
    ;相当于 len(S)-BX+1
    mov ax,string_length_sentence
    inc ax
    sub ax,bx
    ;判断长度是否足够比下去，不够的话就是nomatch
    cmp ax,string_length_keyword
    jl result_nomatch
    ;字符串比较部分
    lea di,keyword
    lea si,sentence
    add si,bx
    dec si
    ;相当于str(S)+bx-1，找到子串地址
    ;设置比较次数
    mov cx,string_length_keyword
    ;sentence子串地址为str(S)+bx-1
    cld
    repe cmpsb
    jz result_match
    ;当前子串不匹配，继续往后找
    inc bx
    jmp cmp_loop

result_match:
    ;输出第1段话
    lea dx,ostring_match1
    mov ah,09h
    int 21h
    ;将cx值转换为16进制数输出
    mov cx,bx
    call print_cx
    ;输出第2段话
    lea dx,ostring_match2
    mov ah,09h
    int 21h
    ;回车换行
    call print_linefeed
    ;跳转到输入句子
    jmp input_sentence

result_nomatch:
    ;输出不匹配的消息
    lea dx,ostring_nomatch
    call print_string
    call print_linefeed
    ;重新输入句子
    jmp input_sentence

end_prog:
    mov ah,4ch
    int 21h

;接下来是函数部分
input_string:
    init_input_string:
    ;初始化
    push di
    xor ax,ax
    mov string_length,ax

    input_loop:
        ;读取用户输入的字符
        mov ah,01h
        int 21h
        ;判断是否为ctrl_c
        cmp al,03h
        je exit_prog
        ;判断是否为回车
        cmp al,0dh
        je exit_loop
        ;将字符传入数组
        mov [di],al
        inc di
        inc string_length
        ;判断是否超过上限
        dec cx
        jz size_exceeded
        ;继续循环
        jmp input_loop

    size_exceeded:
        pop di
        ;输出错误提示信息
        lea dx,linefeed
        mov ah,09h
        int 21h
        lea dx,error_length
        mov ah,09h
        int 21h
        jmp init_input_string

    exit_loop:
        mov al,'$'
        mov [di],al
        pop di
        ret

    exit_prog:
        pop di
        jmp end_prog

print_cx:
    push ax
    shl cx,4h
    mov dl,ch
    call print_number_4b
    xor ch,ch
    shl cx,4h
    mov dl,ch
    call print_number_4b
    mov dl,'H'
    mov ah,02h
    int 21h
    pop ax
    ret

print_number_4b:
    push ax
    add dl,30h;将dl值+30h变成数字0-9的ascii码
    cmp dl,39h;判断是不是超过'9'
    jle print_character;不超过就输出
    add dl,7;超过了转换成大写字母再输出
    print_character:
        mov ah,02h
        int 21h
    pop ax
    ret

print_linefeed:
    push ax
    lea dx,linefeed
    mov ah,09h
    int 21h
    pop ax
    ret

print_string:
    push ax
    mov ah,09h
    int 21h
    pop ax
    ret

code ends
end start