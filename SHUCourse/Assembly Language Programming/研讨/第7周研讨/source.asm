data segment
    ; 在数据段声明并初始化一些数据
    message db 'Hello World!$'

data ends

code1 segment
    assume cs:code1, ds:data

start1:
    mov ax, data
    mov ds, ax

    xor ax,ax

    test ax,ax
    je goto_e

goto_e:
    jmp far ptr print_message
    ; 结束程序
    mov ah, 4ch
    int 21h

code1 ends

code2 segment
    assume cs:code2, ds:data

start2:
    mov ax, data
    mov ds, ax
print_message:
    lea dx,message
    mov ah,09h
    int 21h

    ;结束程序
    mov ah, 4Ch
    int 21h

code2 ends

end start1