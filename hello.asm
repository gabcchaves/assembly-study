section .data
	text db "Hello, World!", 10 ; db stands for define bytes

section .text
	global _start

_start:
	mov rax, 1 				; sys_write call id
	mov rdi, 1				; stdout code (stdin = 0, stdout = 1, stderr = 2)
	mov rsi, text			; buffer to be written (text to be printed)
	mov rdx, 14				; length of the string
	syscall						; invoke the kernel

	mov rax, 60				; sys_exit call id
	mov rdi, 0				; means no error code
	syscall						; invoke the kernel
