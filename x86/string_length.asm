global _start

section .data
section .bss
	input resb 20
	result resb 1

section .text
_start:
	mov eax, 3
	mov ebx, 0
	mov ecx, input
	mov edx, 20
	int 0x80

	mov ecx, 0
loop:
	inc ecx
	cmp byte [input+ecx], 0
	jne loop
	cmp ecx, 20
	je loop

	dec ecx
	add ecx, '0'
	
	mov [result], ecx
	mov byte [result+1], 0

	mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
