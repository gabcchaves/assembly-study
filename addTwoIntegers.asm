; Program to add 3 to 4
; (From now on, using 32bit registers)

section .bss
	sum resb 1

section .text
	global _start

_start:
	; Sum 4 to 3
	mov eax, 3				; put 3 on eax
	mov ebx, 4				; put 4 on ebx
	mov eax, ebx			; add ebx to eax
	
	; Print the result
	mov esi, eax
	mov eax, 1
	mov edi, 1
	add esi, '0'
	mov edx, 1
	syscall

	; Exit program
	mov eax, 60				; sys_exit
	mov edi, 0				; no error
	syscall						; invoke kernel
