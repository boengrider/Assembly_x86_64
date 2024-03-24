; Reserver 64 bytes of space.
; Keep filling the reserved space

;CONSTANTS
EXIT_SUCCESS equ 0    ; Success status
SYS_exit     equ 60   ; System call code for process termination
BUFFER_SIZE        equ 64 ; Reserve 

;***************************************************************
; Data section
;***************************************************************
section .bss
buffer: resb BUFFER_SIZE




;***************************************************************
; Text section
;***************************************************************
section .text
global _start

_start: 
    jmp incrAndStore
;===============================
; Increment and store procedure
;===============================
incrAndStore:
mov al, 1
mov byte [buffer], al       ; store 1 as the first byte in the buffer
mov bl, byte [buffer]       ; load 1st byte in the buffer into the bl (1)
mov al, byte [buffer + 1]   ; load 2nd byte in the buffer into the al (0)

;Move pointer to the first byte in the buffer
lea rax, byte [buffer]             ; store pointer to the begining of the buffer in rax
mov rbx, buffer







; Exit procedure
;=======================
exit:
mov rax, SYS_exit     ; Tell the OS/executive what we want to do 
mov rdi, EXIT_SUCCESS ; Put the exit code in the rdi where the OS expects it
syscall               ; Transfer control to the OS

