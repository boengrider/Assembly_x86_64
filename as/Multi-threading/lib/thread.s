.intel_syntax
.section .text

# thread_run
# A function to start executing the code given on a child process   
#
# Parameters:
# rax: Pointer to the 1st instruction of a block of code we want to execute on the child thread
# rdi, rsi, rdx, rcx, r8: Argument for the function given in the rax
#
# Returns:
# rax: Child process id
#
#
.global thread_run
thread_run:
    push %rax # Save the content of rax onto the stack

    # Fork this process
    mov %rax, 0x39 # 0x39 -> Fork system call
    syscall

    cmp %rax, 0x00 # Determine if we're in the child process
    mov %r10, %rax # Temporary storage in the r10
    pop %rax       # Restore rax from the stack. It contains procedure pointer
    je _invoke     # Conditionally jump to _invoke if we're the child process

    # If this is the parent, return
    mov %rax, %r10 # Return the previously saved child process id to the caller of thread_run
    ret

_invoke:
    # Call the prcoderue passed to the thread_run via rax
    call %rax

    # Safe exit
    mov %rax, 0x3c # 0x3c -> Exit system call
    mov %rdi, 0x00 # Success code 0x00
    syscall


# thread_wait
# Wait for a process to exit
#
# Parameters:
# rax: Process id
#
# Returns:
# rax: Exit code
#
#
.global thread_wait
thread_wait:
    # Allocate space on the stack to store the exit code
    sub %rsp, 4

    mov %rdi, %rax # Move PID of a child to %rdi
    mov %rax, 0x3d # 0x3d -> wait4 syscall
    mov %rsi, %rsp # Pointer to the previously allocated space on the stack
    mov %rdx, 0x00 # Flags
    mov %r10, 0x00 # NULL pointer
    syscall

    # Store the exit code in eax
    mov %eax, [%rsp]
    add %rsp, 4

    ret
