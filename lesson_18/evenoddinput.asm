%include	'functions.asm'

SECTION .data
msg1		db	'Please enter any integer greater than 0: ', 0h
answer		db	'The number is ', 0h
evenStr		db	'even', 0h
oddStr		db	'odd', 0h
tryAgainStr	db	'Try another number? Press 1 for yes, 0 for no.', 0h

SECTION .bss
userInput:	resb	255

SECTION .text
global _start

_start:
	mov	eax, msg1
	call	sprint
	mov	edx, 255
	mov	ecx, userInput
	mov	ebx, 0
	mov	eax, 3
	int	80h
	mov	eax, answer
	call	sprint
.checkEven:
	mov	edx, 0
	mov	ebx, 2
	pop	eax
	mov	eax, userInput
	call	atoi	
	div	ebx
	cmp	edx, 0
	jne	.checkOdd
	mov     eax, evenStr
        call    sprint
        mov     eax, 0Ah
        push    eax
        mov     eax, esp
        call    sprint
 	jmp	.tryAgain
.checkOdd:
	mov	eax, oddStr
	call	sprint
	mov	eax, 0Ah
	push	eax
	mov	eax, esp
	call	sprint
.tryAgain:
	mov	eax, tryAgainStr
	call	sprint
	mov     edx, 255
	mov     ecx, userInput
	mov     ebx, 0
	mov     eax, 3
	int     80h
	mov	eax, userInput
	call	atoi
	cmp	eax, 1
	je	_start
.quit:
	call	quit
