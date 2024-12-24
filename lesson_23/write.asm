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
	mov	ecx, 0777o
	mov	ebx, filename1
	mov	eax, 8
	int	80h

	mov	edx, 12
	mov	ecx, contents1
	mov	ebx, eax
	push	eax
	mov	eax, msg
	call	sprintLF
	pop	eax
	call	iprintLF
	mov	eax, 4
	int	80h

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
	
	call	quit

