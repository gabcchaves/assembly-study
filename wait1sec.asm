section .data
	delay dq 1, 100000000

section .text
	global _start

_start:
	mov eax, 35
	mov edi, delay
	xor esi, 0
	syscall

	mov eax, 60
	mov edi, 0
	syscall
