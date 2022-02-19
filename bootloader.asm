; Linux command : nasm -f bin ./bootloader.asm - o ./bootloader.bin
; Run : qemu-system-x86_64 -hda ./bootloader.bin

ORG 0x7c00 ; origin folder
BITS 16 ; set bits

start:
    mov si, message
    call print
    jmp $ ; jump function

print:
    mov bx, 0
.loop:    
    lodsb
    cmp al, 0
    je .done ; jump equal
    call print_char
    jmp .loop
.done:
    ret

print_char:
    mov ah, 0eh
    int 0x10
    ret
message: db "Simple bootloader terminal",0 ; message for printing

times 510- ($ - $$) db 0
dw 0xAA55