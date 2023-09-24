data segment
    
data ends

code segment
    assume cs:code,ds:data

start:
    mov ax,data       ; 将数据段的段地址加载到AX寄存器
    mov ds,ax         ; 将AX中的值复制到DS寄存器，设置DS为数据段

    mov dl,10h        ; 将字符'10h'（ASCII码中的换行符）加载到DL寄存器
    xor cx,cx         ; 将CX寄存器清零，用作计数器

loopout:
    push cx           ; 保存CX寄存器的值到栈中
    xor cx,cx         ; 将CX寄存器清零，用作内层循环的计数器

loopin:
    ; 输出DL内字符
    mov ah,2          ; 设置功能号为2：显示字符
    int 21h           ; 调用DOS系统调用显示字符

    ; 输出数字6
    push dx           ; 保存DX寄存器的值到栈中
    mov dl,0          ; 清零DL寄存器，显示数字6
    int 21h           ; 调用DOS系统调用显示字符
    pop dx            ; 从栈中弹出之前保存的DX寄存器的值

    inc dl            ; DL寄存器的值加1
    inc cx            ; 内层循环计数器加1
    cmp cx,16         ; 比较CX寄存器的值与16
    jb loopin         ; 如果CX小于16，则跳转到loopin标签处

    ; 输出回车
    push dx           ; 保存DX寄存器的值到栈中
    mov dl,0dh        ; 将字符'0dh'（ASCII码中的回车符）加载到DL寄存器
    mov ah,2          ; 设置功能号为2：显示字符
    int 21h           ; 调用DOS系统调用显示字符
    mov dl,0ah        ; 将字符'0ah'（ASCII码中的换行符）加载到DL寄存器
    int 21h           ; 调用DOS系统调用显示字符
    pop dx            ; 从栈中弹出之前保存的DX寄存器的值
    pop cx            ; 从栈中弹出之前保存的CX寄存器的值

    inc cx            ; 外层循环计数器加1
    cmp cx,7          ; 比较CX寄存器的值与7
    jb loopout        ; 如果CX小于7，则跳转到loopout标签处

    inc dl            ; DL寄存器的值加1
    mov ah,2          ; 设置功能号为2：显示字符
    int 21h           ; 调用DOS系统调用显示字符

    mov ah,4ch        ; 设置功能号为4cH：程序返回
    int 21h           ; 调用DOS系统调用

code ends

end start