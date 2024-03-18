;Basic program format and layout

;***************************************************************
; Data section
;***************************************************************
section .data

;CONSTANTS
EXIT_SUCCESS equ 0    ; Success status
SYS_exit     equ 60   ; System call code for process termination
LIMIT        equ 30   

; VARIABLES
;=============
; Byte (8-bit)
;============= 
bVar1   db 17
bVar2   db 9
bResult db 0

;==============
; Word (16-bit)
;==============
wVar1   dw 17000
wVar2   dw 9000
wResult dw 0

;=====================
; Double-word (32-bit)
;=====================
dVar1   dd 17000000
dVar2   dd 9000000
dResult dd 0

;=====================
; Quad-word (64-bit)
;=====================
qVar1   dq 1700000000
qVar2   dq 900000000
qResult dq 0

;=====================
; Struct Person
; age: Byte
; iq: Byte
_personA:
db 25
db 120

_personB: 
db 30
db 120


;***************************************************************
; Text section
;***************************************************************
section .text
global _start ; Global entry point. Hint for the linker

; =======================
; Global procedure _start
_start:
; Add two bytes
; bResult = bVar1 + bVar2
; 1st operand = Dest
; 2nd operand = Src
mov al, byte [bVar1]
add al, byte [bVar2]
mov byte [bResult], al
push ax                     ; push the result (26) onto the stack
call _stackInspect


; Add two words
; wResult = wVar1 + wVar2
mov ax, word [wVar1]
add ax, word [wVar2]
mov word [wResult], ax

; Add two double-words
; dResult = dVar1 + dVar2
mov eax, dword [dVar1]
add eax, dword [dVar2]
mov dword [wResult], eax

; Add two quad-words
; qResult = qVar1 + qVar2
mov rax, qword [qVar1]
add rax, qword [qVar2]
mov qword [qResult], rax
push _personA
call _personInspect

; Inspect stack procedure
; We should find return address pushed by the HW onto the stack
_stackInspect:
mov rdx, qword [rsp + 8]
ret

; Compare two Person objects
_personInspect:
mov al, byte [rsp + 9]
call exit


; =======================
; Exit procedure
exit:
mov rax, SYS_exit     ; Tell the OS/executive what we want to do 
mov rdi, EXIT_SUCCESS ; Put the exit code in the rdi where the OS expects it
syscall               ; Transfer control to the OS


