data segment
a db ?
b db ?
ans db ?
string db 'the sum of a and b is : $'
data ends

code segment
main proc far
assume cs:code, ds:data, es:data
start:
    push ds
    sub ax,ax
    push ax
    mov ax,data
    mov ds,ax
    mov es,ax
    mov a,1
    mov b,2
    mov al,a
    add al,b
    mov ans,al
    lea dx,string
    mov ah,09
    int 21h
    add ans,30h
    mov dl,ans
    mov ah,2
    int 21h
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    ret
main endp
code ends
end start