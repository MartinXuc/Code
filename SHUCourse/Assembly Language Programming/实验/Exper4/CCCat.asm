data segment
    input_buffer db 81 dup(?) ; 输入缓冲区，用于存储输入的字符
    letter dw ? ; 用于存储字母个数
    digit dw ? ; 用于存储数字个数
    other dw ? ; 用于存储其他字符个数
data ends

code segment
    assume cs:code, ds:data

start:
    mov ax,data ; 将数据段的起始地址存入寄存器 AX
    mov ds,ax ; 将数据段寄存器 DS 设置为数据段的起始地址
    mov si,offset input_buffer ; 将输入缓冲区的地址存入寄存器 SI
    mov letter,0 ; 初始化字母个数为 0
    mov digit,0 ; 初始化数字个数为 0
    mov other,0 ; 初始化其他字符个数为 0

input:
    ; 输入一个字符
    mov ah,1 ; 设置功能号为 1，表示读取一个字符
    int 21h ; 调用 DOS 中断 21h，等待用户输入一个字符，结果存储在 AL 中
    ; 是回车吗？
    cmp al,0dh ; 将 AL 中的字符与回车符的 ASCII 值进行比较
    je end_input ; 如果相等，则跳转到 end_input 标签，结束输入过程
    ; 比‘0’小吗
    cmp al,'0' ; 将 AL 中的字符与 '0' 的 ASCII 值进行比较
    jb inc_other ; 如果小于 '0'，则跳转到 inc_other 标签，增加其他字符计数
    ; 比‘9’小吗
    cmp al,'9' ; 将 AL 中的字符与 '9' 的 ASCII 值进行比较
    jbe inc_digit ; 如果小于等于 '9'，则跳转到 inc_digit 标签，增加数字计数
    ; 比'A'小吗
    cmp al,'A' ; 将 AL 中的字符与 'A' 的 ASCII 值进行比较
    jb inc_other ; 如果小于 'A'，则跳转到 inc_other 标签，增加其他字符计数
    ; 比‘Z’小吗
    cmp al,'Z' ; 将 AL 中的字符与 'Z' 的 ASCII 值进行比较
    jbe inc_letter ; 如果小于等于 'Z'，则跳转到 inc_letter 标签，增加字母计数
    ; 比‘a’小吗
    cmp al,'a' ; 将 AL 中的字符与 'a' 的 ASCII 值进行比较
    jb inc_other ; 如果小于 'a'，则跳转到 inc_other 标签，增加其他字符计数
    ; 比‘z’小吗
    cmp al,'z' ; 将 AL 中的字符与 'z' 的 ASCII 值进行比较
    jbe inc_letter ; 如果小于等于 'z'，则跳转到 inc_letter 标签，增加字母计数
    jmp inc_other ; 否则，跳转到 inc_other 标签，增加其他字符计数

inc_digit:
    inc digit ; 增加数字计数
    jmp next_input ; 跳转到 next_input 标签，处理下一个字符

inc_letter:
    inc letter ; 增加字母计数
    jmp next_input ; 跳转到 next_input 标签，处理下一个字符

inc_other:
    inc other ; 增加其他字符计数
    jmp next_input ; 跳转到 next_input 标签，处理下一个字符

next_input:
    inc si ; 移动输入缓冲区的指针，指向下一个字符
    jmp input ; 跳转到 input 标签，继续输入下一个字符

end_input:
    call print_result ; 调用 print_result 过程，打印结果
    mov ah,4ch ; 设置功能号为 4Ch，表示程序终止
    int 21h ; 调用 DOS 中断 21h，终止程序运行

print_result:
    mov ax,letter ; 将字母个数存入寄存器 AX
    call print_num ; 调用 print_num 过程，打印字母个数
    call print_newline ; 调用 print_newline 过程，打印新行
    call print_newline ; 调用 print_newline 过程，打印新行
    mov ax,digit ; 将数字个数存入寄存器 AX
    call print_num ; 调用 print_num 过程，打印数字个数
    call print_newline ; 调用 print_newline 过程，打印新行
    call print_newline ; 调用 print_newline 过程，打印新行
    mov ax,other ; 将其他字符个数存入寄存器 AX
    call print_num ; 调用 print_num 过程，打印其他字符个数
    call print_newline ; 调用 print_newline 过程，打印新行
    call print_newline ; 调用 print_newline 过程，打印新行
    ret ; 返回到调用者

print_num:
    xor cx,cx ; 清零寄存器 CX，用于计数
    mov bx,10 ; 将立即数 10 存入寄存器 BX，将用于除法运算
loop_depart:
    cwd ; 将 AX 中的有符号数扩展到 DX:AX
    div bx ; 将 DX:AX 除以 BX，商存放在 AX 中，余数存放在 DX 中
    push dx ; 将余数压入堆栈，保存起来
    inc cx ; 计数加一
    test ax,ax ; 将 AX 与自身进行逻辑与运算
    jnz loop_depart ; 如果 AX 不为零，则跳转到 loop_depart 标签，继续循环
output_num:
    pop ax ; 弹出堆栈顶部的值到寄存器 AX，获取保存的余数
    add al,'0' ; 将余数加上 '0' 的 ASCII 值，得到数字的 ASCII 值
    mov dl,al ; 将数字的 ASCII 值移动到寄存器 DL
    mov ah,2 ; 设置功能号为 2，表示打印一个字符
    int 21h ; 调用 DOS 中断 21h，打印字符
    loop output_num ; 循环，直到所有的数字都打印完毕
ret ; 返回到调用者

print_newline:
    mov dl,0dh ; 将回车符的 ASCII 值移动到寄存器 DL
    mov ah,2 ; 设置功能号为 2，表示打印一个字符
    int 21h ; 调用 DOS 中断 21h，打印字符
    mov dl,0ah ; 将换行符的 ASCII 值移动到寄存器 DL
    mov ah,2 ; 设置功能号为 2，表示打印一个字符
    int 21h ; 调用 DOS 中断 21h，打印字符
    ret ; 返回到调用者

code ends
end start ; 标识程序结束点，将程序的入口点设置为 start