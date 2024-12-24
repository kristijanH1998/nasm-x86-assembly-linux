; Create
; Compile with: nasm -f elf create.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 create.o -o create
; Run with: ./create

%include	'functions.asm'

SECTION .data
filename	db	'readme.txt', 0h	; the filename to create

SECTION .text
global	_start

_start:
	mov	ecx, 0777o
	mov	ebx, filename
	mov	eax, 8
	int	80h
	call	quit

