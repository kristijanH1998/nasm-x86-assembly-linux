; In this program parent process is forked into a child process, and both 
; write a string into a newly created file called 'textfile.txt'

%include	'functions.asm'

SECTION .data
childText	db 	'This is child process writing.', 0h
parentText	db	'This is parent process writing.', 0h
filename	db	'textfile.txt', 0h

SECTION .text
global _start

_start:
	mov	ecx, 0777o	; creating the file
	mov	ebx, filename
	mov	eax, 8
	int	80h
	push	eax		; saving the file descriptor of the file on the stack for the parent process
	push	eax		; saving the file descriptor of the file on the stack for the child process

	mov	eax, 2		; process forking
	int	80h
	
	cmp	eax, 0		; control flow based on value in eax after forking
	jz	child
parent:
	mov	edx, 31		; writing to the file 'filename.txt'
	mov	ecx, parentText
	pop	eax		; taking the file descriptor of 'filename.txt' back from the stack 
	mov	ebx, eax
	mov	eax, 4
	int	80h

	call	quit
child:
	mov	edx, 30		; writing to the file 'filename.txt'
	mov	ecx, childText
	pop	eax		; taking the file descriptor of 'filename.txt' back from the stack
	mov	ebx, eax
	mov	eax, 4
	int	80h

	call	quit
