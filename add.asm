; Program to add two numbers
; read from stdin

; Constants
SYS_WRITE equ 4
SYS_READ equ 3

; Initialized variables
section .data
	msg1 db "Enter an integer: ", 0xA, 0xD
	len1 equ $- msg1

	msg2 db "Enter another integer: ", 0xA, 0xD
	len2 equ $- msg2

	msg3 db "The sum is: "
	len3 equ $- msg3

	newLine db "", 0xA, 0xD

; Uninitialized variables
section .bss
	x resb 2					; First integer
	y resb 2					; Second integer
	sum resb 4				; Result

section .text
	global _start

_start:
	; Get first integer
	mov ecx, msg1		; str
	mov edx, len1		; str length
	call _print
	
	mov ecx, x
	mov edx, 2
	call _read

	; Get second integer
	mov ecx, msg2
	mov edx, len2
	call _print

	mov ecx, y
	mov edx, 2
	call _read

	; Add both integers
	mov eax, [x]
	mov ebx, [y]
	sub eax, '0'
	sub ebx, '0'
	add eax, ebx
	add eax, '0'
	mov [sum], eax

	; Print result
	mov ecx, msg3
	mov edx, len3
	call _print
	mov ecx, sum
	mov edx, 1
	call _print
	mov ecx, newLine
	mov edx, 1
	call _print

	; End program
	mov eax, 1
	mov ebx, 0
	int 0x80

	
_print:
	mov eax, SYS_WRITE
	mov ebx, 1
	int 0x80
	ret

_read:
	mov eax, SYS_READ
	mov ebx, 0
	int 0x80
	ret
