%include	'functions.asm'

SECTION .data
child1Msg	db	'This is the first child process', 0h
child2Msg	db	'This is the second child process', 0h
child3Msg       db      'This is the third child process', 0h
parentMsg	db	'This is the parent process', 0h

SECTION .text
global _start
_start:
	mov	eax, 2
	int	80h

	cmp	eax, 0
	jz	child1

	int	80h
	cmp	eax, 0
	jz	child2

	int	80h
	cmp	eax, 0
	jz	child3

parent:
	mov	eax, parentMsg
	call	sprintLF
	call	quit

child1:
	mov	eax, child1Msg
	call	sprintLF

child2:
	mov	eax, child2Msg
	call	sprintLF

child3:
	mov	eax, child3Msg
	call	sprintLF

	call	quit
