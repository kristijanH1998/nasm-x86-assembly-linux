; Time
; Compile with: nasm -f elf time.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 time.o -o time
; Run with: ./time

%include	'functions.asm'

SECTION .data
msg		db	'Seconds since Jan 01 1970: ', 0h	; a message string
daysMsg		db	'Days since Jan 01 1970: ', 0h
hoursMsg        db      'Hours since Jan 01 1970: ', 0h

SECTION .text
global _start

_start:
	mov	eax, msg	; move our message string into eax for printing
	call	sprint		; call our string printing function

	mov	eax, 13		; invoke SYS_TIME (kernel opcode 13)
	int	80h		; call the kernel

	call	iprintLF	; call our integer printing function with linefeed

	push	eax		; pushing eax which now has number of seconds on the stack
	
	mov	ebx, 86400
	div	ebx
	push	eax
	mov	eax, daysMsg
	call	sprint
	pop	eax
	call	iprintLF

	pop	eax
	xor	edx, edx
	mov	ebx, 3600
	div	ebx
	push	eax
	mov	eax, hoursMsg
	call	sprint
	pop	eax
	call	iprintLF

	call	quit		; call our quit function
