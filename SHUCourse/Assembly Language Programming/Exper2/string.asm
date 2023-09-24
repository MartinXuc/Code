data segment
    mess db 'sentence please: $'
    error_OF db 'Error: Input string length exceeds 50! $'
    stor db 50 dup(?)
data ends
code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
    lea dx,mess
    mov ah,9
    int 21h
    lea di,stor
    mov cx,0
rotate:
    mov ah,1
    int 21h
    cmp al,0dh
    jz output
    cmp al,61h
    jb return
    cmp al,7ah
    ja return
    sub al,20h
return:
    mov [di],al
    inc di
    inc cx
    cmp cx,50
    ja error_overflow
    jmp rotate
output:
    mov dl,0dh
    mov ah,2
    int 21h
    mov dl,0ah
    mov ah,2
    int 21h
    lea di,stor
again:
    mov dl,[di]
    mov ah,2
    int 21h
    inc di
    loop again
    mov ah,4ch
    int 21h
error_overflow:
    mov dl,0dh
    mov ah,2
    int 21h
    mov dl,0ah
    mov ah,2
    int 21h
    lea dx,error_OF
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
code ends
    end start