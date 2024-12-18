%include	'functions.asm'

SECTION .data
text1	db	'even', 0h
text2	db	'odd', 0h

SECTION .text
global _start

_start:
	mov	ecx, 0
	mov	edi, 0
	mov	esi, 0

nextNumber:
	mov	edx, 0
	inc	ecx
	mov	eax, ecx
	mov	ebx, 2
	div	ebx
	mov	edi, edx
	cmp	edi, 0
	je	.printEven
	jne	.printOdd
.printEven:
	mov	eax, text1
	call	sprint
	jmp	.continue
.printOdd:
	mov	eax, text2
	call	sprint
	jmp	.continue
.continue:
	mov	eax, 0Ah
	push	eax
	mov	eax, esp
	call	sprint
	pop	eax
	cmp	ecx, 10
	jne	nextNumber
	
	call	quit
