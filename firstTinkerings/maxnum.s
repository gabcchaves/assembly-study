# Program to find the maxim number in a list
# VARIABLES:
#		%edi 				- stores the current position in the list
#		%ebx 			  - stores the current highest value in the list
# 	%eax 			  - stores the current element being examined
#		data_items  - contains the item data. A 0 is used to terminate the program

.section .data
	data_item:
		.long 1, 3, 7, 19, 5, 8, 4, 10

.section .text

.globl _start		# set which part of the code starts the program

_start:
	movl $0, %edi								# set the current list position to 0
	movl data_items(, %edi, 4) 	# load the first byte of data
	movl %eax, %ebx							# as this is the first element, it's the largest

start_loop:
	
