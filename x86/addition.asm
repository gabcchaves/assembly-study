global _start

section .data
	prompt1 db "Entre com o primeiro número: ", 0
	len_prompt1 equ $ - prompt1
	prompt2 db "Entre com o segundo número: ", 0
	len_prompt2 equ $ - prompt2
	newline db 10

section .bss
	a resb 2
	b resb 2
	sum resb 1

section .text
_start:
	; Prompt user to enter first number.
	mov eax, 4
	mov ebx, 1
	mov ecx, prompt1
	mov edx, len_prompt1
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, a
	mov edx, 2
	int 0x80

	; Prompt user to enter the second number.
	mov eax, 4
	mov ebx, 1
	mov ecx, prompt2
	mov edx, len_prompt2
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, b
	mov edx, 2
	int 0x80

	sub byte [a], '0'
	sub byte [b], '0'

	mov eax, [a]
	add eax, [b]
	add eax, '0'
	mov [sum], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 1
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
