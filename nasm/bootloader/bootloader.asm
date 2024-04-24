BITS 16

start: 
    mov ax, 07C0h       
    add ax, 288         ; (4096 + 512) / 16
    mov ss, ax          ; Place stack segment at location stored in ax
    mov sp, 4096        ; Move stack pointer 4096 bytes

    mov ax, 07C0h
    mov ds, ax          ; Set up data segment

    ;Switch to 256 color VGA mode
    mov ax,13h
    int 10h     ;enter 256 color VGA mode
    mov ax,0A000h
    mov es,ax  ;you can't MOV a constant directly into ES so you need to use another register first.
    mov di,0    ;when combined together, [es:di] aliases address 0xA0000
    mov al,0Fh  ;white
    stosb       ;mov [es:di],al

    mov si, text_string ; Put location of the 1st byte of the string into si register
    call print_string   ; Call print_string procedure
    


    jmp $               ; Infinite loop

    text_string db 'This is my cool new OS!', 0


print_string:           ; Routine: output string in SI to screen
    mov ah, 0Eh         ; BIOS code for print-char routine
    
    .repeat:
        lodsb           ; Load one byte from string. Uses SI as a pointer. Increments after each load
        cmp al, 0
        je .done        ; Since null terminated string, we stop when byte is '0'
        int 10h         ; Otherwise invoke BIOS to print char
        jmp .repeat     ; If byte is not '0' jump to sublabel and repeat the whole process

    .done:
        ret             ; Return


print_bios_data_byte:   ; Print content of the first byte of physical memory at 0x0
    mov al, [0x0000]
    mov ah, 0Eh
    int 10h
    .done:
        ret

write_byte_to_frame_buffer: ; VGA Display starts at 0xA0000
    mov si, text_string
    lodsb
    mov [0xA000], al
    mov ah, 0Eh
    int 10h
    ret    


times 510-($-$$) db 0   ; Zero padded to fill 510 bytes
dw 0xAA55               ; Bootable signature fills the last two bytes 