global _start

section .data
	msg db "Hello, ", 0
	len equ $ - msg
	newline db 10

section .bss
	username resb 7

section .text
_start:
	mov eax, 3
	mov ebx, 0
	mov ecx, username
	mov edx, 7
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	sub byte [username + 7], 10

	mov eax, 4
	mov ebx, 1
	mov ecx, username
	mov edx, 7
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
