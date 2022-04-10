global _start

.data
    msg db "Hello World",0xa
    len equ $-msg

.text

_start:
    mov eax, 0x4                     
    mov ebx, 0x1       
    mov ecx, msg     
    mov edx, len        
    int 0x80               

exit:
    mov eax, 0x1
    mov ebx, 0x1
    int 0x80
