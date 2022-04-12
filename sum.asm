; System calls codes
SYS_EXIT		equ 1
SYS_READ		equ 3
SYS_WRITE		equ 4
STDIN				equ 0
STDOUT			equ 1

; Not initialized variables
section .bss
	x resb 2
	y resb 2
	sum resb 1

section .text
	global _start

_start:
	; Read x
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, x
	mov edx, 2
	int 0x80

	; Read y
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, y
	mov edx, 2
	int 0x80

	; Add y to x
	mov eax, [x]
	sub eax, '0'
	mov ebx, [y]
	sub ebx, '0'
	add eax, ebx
	add eax, '0'
	mov [sum], eax
	int 0x80

	call _print 	; Print sum
	call _exit		; End program

; Print subroutine
_print:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, sum
	mov edx, 1
	int 0x80

; End program subroutine
_exit:
	mov eax, SYS_EXIT
	mov ebx, 0
	int 0x80
