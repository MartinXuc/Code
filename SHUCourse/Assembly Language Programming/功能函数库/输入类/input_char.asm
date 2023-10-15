;从键盘中读取一个字符，传入AL寄存器中
input_char proc near
    mov ah,01h
    int 21h
input_char endp