section .data
	stars times 9 db '*'

section .text
	global _start

_start:
	; Print the stars array
	mov rax, 1 			; sys_write call id
	mov rdi, 1			; stdout
	mov rsi, stars	; stars array
	mov rdx, 9			; string length
	syscall					; invoke kernel

	; Exit program
	mov rax, 60			; sys_exit call id
	mov rdi, 0			; no error
	syscall					; invoke kernel
