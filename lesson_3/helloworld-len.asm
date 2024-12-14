; Hello World Program (Calculating string length)
; Compile with: nasm -f elf helloworld-len.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-len.o -o helloworld-len
; Run with: ./helloworld-len

SECTION .data
msg	db	'Hello, brave new world! This Hello World string is longer than usual.', 0Ah ; 
; len	db	'B'
SECTION .text
global  _start

_start:
	mov	ebx, msg	; move the address of our message string into EBX
	mov	eax, ebx	; move the address in EBX into EAX as well (Both now point to the same segment in memory)
nextchar:
	cmp	byte[eax], 0	; compare the byte pointed to by EAX at this address against zero (Zero is an end of string delimiter)
	jz	finished	; jump (if the zero flagged has been set) to the point in the code labeled 'finished'
	inc	eax		; increment the address in EAX by one byte (if the zero flagged has NOT been set)
; findlenjump:
;	jmp	findlen
	jmp	nextchar	; jump to the point in the code labeled 'nextchar'

finished:
	sub	eax, ebx	; subtract the address in EBX from the address in EAX
                            	; remember both registers started pointing to the same address (see line 15)
                            	; but EAX has been incremented one byte for each character in the message string
                            	; when you subtract one memory address from another of the same type
                            	; the result is number of segments between them - in this case the number of bytes;

	mov	edx, eax	; EAX now equals the number of bytes in our string
	mov	ecx, msg	
	mov	ebx, 1
	mov	eax, 4
	int	80h

;	mov	eax, len
;	push	eax
;	mov	ecx, esp
;	mov	edx, 1
;	mov	ebx, 1
;	mov	eax, 4
;	int	80h
;	add	esp, 4

	mov	ebx, 0
	mov	eax, 1
	int	80h
