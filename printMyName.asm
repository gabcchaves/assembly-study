; Program to print my name.
section .data
	name db "Gabriel", 10
	len equ $ - name

section .text
	global _start

_start:
	; Print my name
	mov rax, 1		; sys_write call id
	mov	rdi, 1		; stdout
	mov rsi, name	; name address
	mov rdx, len	; name length 
	syscall				; invoke kernel

	; Exit program
	mov rax, 60		; sys_exit call id
	mov rdi, 0		; error code
	syscall				; invoke kernel
