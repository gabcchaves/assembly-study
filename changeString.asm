section .data
	name db "prog "

section .text
	global _start

_start:
	; Print name
	mov eax, 4
	mov ebx, 1
	mov ecx, name
	mov edx, 5
	int 0x80

	; Change name
	mov [name], dword "Nasm"
	
	; Print changed name
	mov eax, 4
	mov ebx, 1
	mov ecx, name
	mov edx, 5
	int 0x80

	; End program
	mov eax, 1
	mov ebx, 0
	int 0x80
