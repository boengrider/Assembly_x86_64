;Widening unsigned conversions
;Data type muste be known
;Appropriate instructions must be used

;CONSTANTS
EXIT_SUCCESS equ 0    ; Success status
SYS_EXIT     equ 60   ; System call code for process termination

section .data
bVar1 db 50
bVar2 db -1

section .text
global _start

_start:
    jmp zeroExtendedManualUWC
   

;Unsigned widening conversion
zeroExtendedManualUWC:
    mov al, byte [bVar1]      ; Store 50 (0x32) in the lower byte of the al register
    mov rbx, 0                ; Store 0 (0x0000000000000000) in $rbx
    mov bl, al                ; Store one byte from al into the bl.  Zero extended $rbx -> 0x0000000000000032

;Usigned widening conversion using movzx
movzxUWC:
    mov rcx, -1               ; Store -1 (0xffffffffffffffff) in $rcx
    movzx rcx, al             ; $rcx -> 0x0000000000000032

;This produces garbage
;Unlike movzx, destination register is not "zero extended" and thus original value in the 
;rdx is preserved and we only store lower 8 bits
garbage:
    mov rdx, -1               ; Store -1 (0xffffffffffffffff) in $rdx
    mov dl, al                ; $rdx -> 0xffffffffffffff32

exit:
    mov rax, SYS_EXIT     ; Tell the OS/executive what we want to do 
    mov rdi, EXIT_SUCCESS ; Put the exit code in the rdi where the OS expects it
    syscall               ; Transfer control to the OS