; Write
; Compile with: nasm -f elf write.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 write.o -o write
; Run with: ./write

%include	'functions.asm'

SECTION .data
filename1	db	'readme.txt', 0h
filename2	db	'readme2.txt', 0h
contents1	db	'Hello World!', 0h
contents2	db	'This is Kristijan!', 0h
msg		db	'File descriptor: ', 0h

SECTION .text
global	_start

_start:
	mov	ecx, 0777o	; code continues from lesson 22
	mov	ebx, filename1
	mov	eax, 8
	int	80h

	mov	edx, 12		 ; number of bytes to write - one for each letter of our contents string
	mov	ecx, contents1	; move the memory address of our contents1 string into ecx
	mov	ebx, eax	; move the file descriptor of the file we created into ebx
	push	eax
	mov	eax, msg
	call	sprintLF
	pop	eax
	call	iprintLF
	mov	eax, 4		; invoke SYS_WRITE (kernel opcode 4)
	int	80h		; call the kernel

	mov	ecx, 0777o
	mov	ebx, filename2
	mov	eax, 8
	int	80h

	mov	edx, 18
	mov	ecx, contents2
	mov	ebx, eax
	push	eax
	mov	eax, msg
	call	sprintLF
	pop	eax
	call	iprintLF
	mov	eax, 4
	int	80h
	
	call	quit		; call our quit function

