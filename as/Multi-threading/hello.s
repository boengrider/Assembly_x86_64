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

    lea %rdi, [%rip + greetingsA]
    mov %rsi, 0x0c # Print 12 bytes
    call print 

    jmp _exit
    
_child:
    # 'set-up' the execution environment for 'print' utility procedure by loading apropriate registers
    # Print hello from the child process utilizing 'print' procedure defined in the util.o file
    lea %rdi, [%rip + msg2] # Load effective address of msg2 (1st argument to the print procedure) into %rdi where print procedure is expecting it
    mov %rsi, OFFSET msg2len # Load string length (2nd argument) into the %rdi register
    call print # Finally call the 'print' procedure

_exit:
    # Ask the system to exit process
    mov %rax, 0x3c # 'exit' system call on x64 Linux
    mov %rdi, 0x0 # Our exit code. All ok
    syscall

  

.section .data
msg1:
    .ascii "Hello from the parent process\n"
    msg1len = . - msg1
msg2:
    .ascii "Hello from the child process\n"
    msg2len = . - msg2
greetingsA:
    .int 0x6c65480a # \nHel
greetingsB:
    .int 0x77206f6c # lo W
greetingsC:
    .int 0x646c726f # orld

