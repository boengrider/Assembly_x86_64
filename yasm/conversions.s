; Narrowing and Widening coversions
; ************************************************************
; Some basic data declarations
section .data
; -----
; Define constants
EXIT_SUCCESS equ 0
 ; successful operation
SYS_exit equ 60
 ; call code for terminate
 ; -----
; Byte (8-bit) variable declarations
bVar1 db 17
bVar2 db 9
bResult db 0
; Word (16-bit) variable declarations
wVar1 dw 17000
wVar2 dw 257
wResult dw 0
; Double-word (32-bit) variable declarations
dVar1 dd 17000000
dVar2 dd 9000000
dResult dd 0
; quadword (64-bit) variable declarations
qVar1 dq 170000000
qVar2 dq 257
qResult dq 0
; ************************************************************
; *                     Code Section                         *
; ************************************************************
section .text
global _start
_start:


mov ax, 257
mov bl, al
mov rdi, 0
mov dl, bl 

last:
mov rax, SYS_exit ; Code for exit
syscall