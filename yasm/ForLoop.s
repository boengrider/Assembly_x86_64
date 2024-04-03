;CONSTANTS
EXIT_SUCCESS equ 0    ; Success status
SYS_EXIT     equ 60   ; System call code for process termination


section .data 
bVar db 0

section .bss
resb bVar2

section .text

global _start

_start:
mov rdi, EXIT_SUCCESS
mov rdx, SYS_EXIT
syscall