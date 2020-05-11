;"F:\Operating System\nasm\nasm.exe" "F:\Operating System\MIMEOS0.0.1A\MIME.asm" -o "F:\Operating System\MIMEOS0.0.1A\MIME.img"
BITS 16 ;for nasm
start:
	mov ax,07c0h
	add ax,288
	mov ss,ax
	mov sp,4096
	mov ax,07c0h
	mov ds,ax
	
	mov si,text_string
	call print_string
	jmp $
	
	
	text_string DB 'This is Mime OS!',0
print_string:
	mov ah,0Eh
.repeat:
	lodsb
	cmp al,0
	je .done
	int 10h
	jmp .repeat
.done:
	ret
	
	
	times 510-($-$$) DB 0
	DW 0xAA55