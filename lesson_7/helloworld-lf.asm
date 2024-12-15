; Hello World Program (Print with line feed)
; Compile with: nasm -f elf helloworld-lf.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-lf.o -o helloworld-lf
; Run with: ./helloworld-lf

%include	'functions.asm'

SECTION	.data
msg1	db	'Hello, brave new world!', 0h		; NOTE we have removed the line feed character 0Ah
msg2	db	'This is how we recycle in NASM.', 0h	; NOTE we have removed the line feed character 0Ah

SECTION .text
global _start

_start:
	mov	eax, msg1
	call	sprintLF

	mov 	eax, msg2
	call	sprintLF

	call	quit
