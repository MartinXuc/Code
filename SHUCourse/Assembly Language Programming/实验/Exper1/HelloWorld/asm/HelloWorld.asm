data segment
    message db 'HelloWorld$', 0
data ends

code segment
main proc far
    assume cs:code, ds:data

    mov ax, data
    mov ds, ax

    mov ah, 09h
    mov dx, offset message
    int 21h

    mov ah, 4Ch
    int 21h
main endp
code ends

end main