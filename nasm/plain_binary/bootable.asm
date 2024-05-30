BITS 16


;Jump past string definitions
jmp short bootloader_start

;These strings/byte sequences
;are defined at the very begining
;We need to jmp past them
OsName db 'COOLOS',0
FileSystem db 'FAT12',0


;Entry point
bootloader_start:
    mov ax, 07c0h       ; This is where we're loaded by BIOS
    add ax, 288
    mov ss, ax
    mov sp, 4096

    mov ax, 07c0h
    mov ds, ax
    mov si, OsName
    mov ah, 0Eh         ; BIOS code for print-char routine
    
    .repeat:
        lodsb           ; Load one byte from string. Uses SI as a pointer. Increments after each load
        cmp al, 0
        je .done        ; Since null terminated string, we stop when byte is '0'
        int 10h         ; Otherwise invoke BIOS to print char
        jmp .repeat     ; If byte is not '0' jump to sublabel and repeat the whole process

    .done:
        ret             ; Return

times 510-($-$$) db 0	; Pad remainder of boot sector with zeros
dw 0AA55h		        ; Boot signature (DO NOT CHANGE!)
