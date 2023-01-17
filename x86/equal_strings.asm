global _start

section .data
	prompt1 db "1ª string > ", 0
	len_prompt1 equ $ - prompt1
	prompt2 db "2ª string > ", 0
	len_prompt2 equ $ - prompt2
	eq_msg db "Iguais.", 0
	len_eq_msg equ $ - eq_msg
	diff_msg db "Diferentes.", 0
	len_diff_msg equ $ - diff_msg
	newline db 10
section .bss
	input1 resb 20
	input2 resb 20
section .text
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, prompt1
	mov edx, len_prompt1
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, input1
	mov edx, 20
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, prompt2
	mov edx, len_prompt2
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, input2
	mov edx, 20
	int 0x80

	mov ecx, 0
loop:
	cmp ecx, 20
	je equal
	movsx eax, byte [input1+ecx]
	movsx edx, byte [input2+ecx]
	cmp eax, edx
	jne unequal
	inc ecx
	cmp edx, 0
	je equal
	jne loop
unequal:
	mov eax, 4
	mov ebx, 1
	mov ecx, diff_msg
	mov edx, len_diff_msg
	int 0x80
	jmp end_program
equal:
	mov eax, 4
	mov ebx, 1
	mov ecx, eq_msg
	mov edx, len_eq_msg
	int 0x80
	jmp end_program

end_program:
	mov eax, 4
	mov ebx, 1
	mov ecx, newline
	mov edx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
