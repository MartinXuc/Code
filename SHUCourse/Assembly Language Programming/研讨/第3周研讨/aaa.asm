data segment
    input db 10 dup(?)  ; 存储输入数据的数组，共10个数据
    count db 0          ; 已输入数据的数量
data ends

code segment
    assume cs:code, ds:data

start:
    mov ax, data  ; 将数据段的段地址加载到AX寄存器
    mov ds, ax    ; 将AX中的值复制到DS寄存器，设置DS为数据段

    ; 读取十个数据
    mov cx, 10  ; 循环10次
    lea di, input ; 将输入数据的地址加载到DI寄存器
    input_loop:
        mov ah, 1    ; 设置功能号为1：读取字符
        int 21h      ; 调用DOS系统调用读取字符
        cmp al, 0Dh  ; 比较AL寄存器的值与回车符的ASCII码
        je sort_and_output  ; 如果输入回车，则跳转到sort_and_output标签处
        mov [di], al  ; 将输入的字符保存到input数组中
        inc di       ; DI寄存器加1，指向下一个位置
        inc byte ptr [count]  ; 已输入数据的数量加1
        loop input_loop  ; 继续下一轮循环

    sort_and_output:
    ; 对输入的数据进行升序排序
        mov cx, byte ptr [count]  ; 循环[count]次
        lea si, input   ; 将输入数据的地址加载到SI寄存器
        outer_loop:
            mov di, si   ; 将SI寄存器的值复制到DI寄存器
            inc si       ; 指向下一个位置
            mov al, [si] ; 将当前位置的数据保存到AL寄存器
            inner_loop:
                cmp al, [di]  ; 比较AL寄存器的值与DI寄存器指向的数据
                jl swap   ; 如果AL寄存器的值小于DI寄存器指向的数据，跳转到swap标签处
                inc di    ; DI寄存器指向下一个位置
                loop inner_loop  ; 继续下一轮内层循环
            mov bl, [si]   ; 将当前位置的数据保存到BL寄存器
            mov byte ptr [di], bl  ; 将BL寄存器的值保存到DI寄存器指向的位置
            jmp next_outer  ; 跳转到next_outer标签处

        swap:
            mov dl, [di]   ; 将DI寄存器指向的数据保存到DL寄存器
            mov byte ptr [si], dl  ; 将DL寄存器的值保存到SI寄存器指向的位置
            mov byte ptr [di], al  ; 将AL寄存器的值保存到DI寄存器指向的位置
        next_outer:
            loop outer_loop  ; 继续下一轮外层循环

    ; 输出排序后的数据
    mov cx, byte ptr [count]  ; 循环[count]次
    lea si, input   ; 将输入数据的地址加载到SI寄存器
    output_loop:
        mov dl, [si]  ; 将SI寄存器指向的数据保存到DL寄存器
        mov ah, 2    ; 设置功能号为2：显示字符
        int 21h      ; 调用DOS系统调用显示字符
        inc si       ; SI寄存器指向下一个位置
        loop output_loop  ; 继续下一轮循环

    mov ah, 4Ch  ; 设置功能号为4cH：程序返回
    int 21h   ; 调用DOS系统调用

code ends

end start