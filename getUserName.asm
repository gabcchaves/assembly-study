section .data
	text1 db "What is your name? "
	lenText1 equ $ - text1
	text2 db "Hello, "
	lenText2 equ $ - text2

section .bss
	name resb 16

section .text
	global _start

_start:
	call _printText1
	call _getName
	call _printText2
	call _printName

	mov eax, 60
	mov edi, 0
	syscall

_getName:
	mov eax, 0
	mov edi, 0
	mov esi, name
	mov rdx, 16
	syscall
	ret

_printText1:
	mov eax, 1
	mov edi, 1
	mov esi, text1
	mov edx, lenText1
	syscall
	ret

_printText2:
	mov eax, 1
	mov edi, 1
	mov esi, text2
	mov edx, lenText2
	syscall
	ret

_printName:
	mov eax, 1
	mov edi, 1
	mov esi, name
	mov edx, 16
	syscall
	ret
