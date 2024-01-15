# hello.s

.intel_syntax
.global _start
.section .text

.extern print # Defined in the util.o

_start:
    # Ask system for the 'fork' of the current process
    mov %rax, 0x39 # 'fork' system call on x64 Linux
    syscall
    cmp %rax, 0    # return value from the system in the same register as the syscall code. 0 if successfull
    je _child      # if 0 is returned, jump to the instruction pointed by _child label

_parent:
    # Print hello from the parent process utilizing 'print' procedure defined in the util.o file
    lea %rdi, [%rip + msg1] # Load effective address of msg1 (1st argument to the print procedure) into %rdi where print procedure is expecting it
    mov %rsi, OFFSET msg1len # Load the length of msg1 (2nd argument of the print procedure) into %rsi where print procedure expects it to find
    call print # Call print procedure
    jmp _exit

    # Create pipe
    # mov %rax, 0x16
    
_child:
    # Print hello from the child process utilizing 'print' procedure defined in the util.o file
    lea %rdi, [%rip + msg2] # Load effective address of msg2 (1st argument to the print procedure) into %rdi where print procedure is expecting it
    mov %rsi, OFFSET msg2len
    call print

_exit:
    # Ask system for the 'exit' syscall
    mov %rax, 0x3c # 'exit' system call on x64 Linux
    # mov %rdi, 0x0 # Our exit code. All ok
    mov %rdi, [pipeArray + 4] 
    syscall

  

.section .data
msg1:
    .ascii "Hello from the parent process\n"
    msg1len = . - msg1
msg2:
    .ascii "Hello from the child process\n"
    msg2len = . - msg2

len:
    .byte 0x1d
pipeArray:
    .int 255,128
    
    