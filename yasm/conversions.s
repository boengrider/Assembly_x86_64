; Narrowing and Widening coversions
; ************************************************************
; Some basic data declarations
section .data
; -----
; Define constants
SYS_exit equ 60
; call code for terminate
; -----
; Word (16-bit) variable declarations
wVar1 dw 258
wVar2 dw 257
wResult dw 0
; Quad-word (64-bit) variable declarations
qLast dq last


; ************************************************************
; *                     Code Section                         *
; ************************************************************
section .text
global _start
_start:

mov al, 0             ; Condition 1 -> Perform conversion using movexz instruction, manual otherwise
cmp al, 1             ; ZF set to 1 if al == 1, set to 0 otherwise
jz movezx_convert     ; Jump if ZF is True i.e al == 1

;*************************
;Perform manual conversion
;*************************
manual_convert:
mov dil, 0           ; Store 0 in the lowest 8 bits of %rdi
mov al, byte [wVar1] ; Fetch one byte at wVar1
                     ; 0b00000001 00000010 == 258
                     ;   ******** ^^^^^^^^
                     ;      256       2
mov dil, al          ; Returned value should be 2
jmp qword [qLast]    ; Exit


;******************************
;Do the conversion 
;using zeroing move instruction
;******************************
movezx_convert:
;mov rdi, byte [wVar2]   ; 'invalid size for operand 2' hence the need for the insruction below
movzx rdi, byte [wVar2] ; Returned value should be 1

;******
;Exit
;******
last:
mov rax, SYS_exit ; Code for exit
syscall