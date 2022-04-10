global _start

section .data
	number dw 1

section .text
	_start:
		mov edx, 1
		mov ecx, number
		mov ebx, 1
		mov eax, 4
		int 0x80

		mov eax, 1
		int 0x80
