global _start

section .data
	msg db "Hello World", 0
	len equ $ - msg
	newline db 10

section .text
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
