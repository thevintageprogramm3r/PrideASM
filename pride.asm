; theVintage Programm3r
; pride.asm
; Programming a bootable sector that will produce a Pride Flag
; VGA at 320x200x256
; Works on i386+

[org 0x7c00]
jmp _start

_start:

    mov     al, 0x13 		; AL = 0x13
    mov     ah, 0x00 		; AH = 0x00
    int     0x10	 		; Set Video Mode 0x13 - 320x200x256

	push	0xA000   		; Video Memory starts at Address 0xA000
	pop		es		 		; ES = 0xA000
	xor		di,di	 		; DI = 0
	xor		si,si	 		; SI = 0
	mov     bx, p_colors	; Point BX to the color array

choose_color:
	cmp		di, 0x2940 		; Red delimiter
	je		increment
	cmp		di, 0x5280 		; Orange delimiter
	je		increment
	cmp		di,	0x7BC0 		; Yellow delimiter
	je		increment
	cmp		di,	0xA500 		; Green delimiter
	je		increment
	cmp		di, 0xCE40 		; Blue delimiter
	je		increment
	cmp		di,	0xF780 		; Purple delimiter
	je		increment
	jmp		plot

increment:
	inc		bx				; If delimiter reached, increment bx to point to the next color
		
plot:
	mov		al, [bx]		; Get value BX is pointing to (one byte)
	mov		[es:di], al		; Put the value in the video memory 

continue:
	inc		di				; Move to the next pixel
	cmp		di, 0xFA00		; Compare value to 0xFA00, 320*200
	jb		choose_color	; Jump to color value if end is not reached

boot_loop:
    jmp 	boot_loop		; Boot Loop

p_colors   db      40,42,44,119,55,107,0

times 510 - ($-$$)  db  0	; Set the 511th and 512th bytes to 0x55 and 0xaa respective to be bootable
dw  0xaa55

times 1474560 - ($-$$)	db 0




