global _start

section .data
	newline db 10
section .bss
	digit resb 2
section .text
_start:
	xor eax, eax
	mov ebx, 1
	xor edx, edx

loop:
	push edx

	mov ecx, eax
	add eax, ebx
	mov ebx, ecx

	push eax
	push ecx
	mov eax, ebx
	push ebx

	xor ecx, ecx
split_digits:
	mov ebx, 10
	xor edx, edx
	div ebx
	push edx
	inc ecx
	cmp eax, 0
	jne split_digits

print_digits:
	pop edx
	push ecx
	add edx, '0'
	mov [digit], edx

	mov eax, 4
	mov ebx, 1
	mov ecx, digit
	mov edx, 1
	int 0x80

	pop ecx
	dec ecx
	cmp ecx, 0
	jne print_digits

	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 0x80

	pop ebx
	pop ecx
	pop eax

	pop edx
	inc edx
	cmp edx, 20
	jne loop

	mov eax, 1
	xor ebx, ebx
	int 0x80
