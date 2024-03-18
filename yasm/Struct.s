;Simple structure representing person
;Declare structure
;Push address of the structure onto the stack
;Call procedure and load member of the structure into the register
;Exit

;********************************************
; Data section
;********************************************
section .data

;CONSTANTS
EXIT_SUCCESS equ 0  ; Success exit code
SYS_exit     equ 60 ; System call code for process termination

;VARIABLES
;===============
; Struct Person
;===============
_personA:
    db 25  ; 1st member (age)
    db 120 ; 2nd member (iq)


;**********************************************
; Text section
;**********************************************
section .text
global _start

;PROCEDURES
;==================
; _start procedure
;==================
_start:
    mov rax, _personA
    call _exit



;==================
; _exit procedure
;==================
_exit:
    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall
