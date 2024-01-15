.global _start
.intel_syntax
.section .text

# External functions. We will link against the library containing them
.extern thread_run
.extern thread_wait
.extern print

_start: 
    # Create a thread
    call _log
    lea %rax, [%rip + print]         # rax: Store the pointer to the procedure executed on the child process
    lea %rdi, [%rip + thread_msg]    # rdi: 1st argument to the 'print' procedure (data buffer)
    mov %rsi, OFFSET thread_msg_len  # rsi: 2nd argument to the 'print' procedure (buffer len)
    call thread_run

    # Wait for the child 
    call thread_wait
    call _pmsg

    # Create a thread
    call _log
    lea %rax, [%rip + print]         # rax: Store the pointer to the procedure executed on the child process
    lea %rdi, [%rip + thread2_msg]   # rdi: 1st argument to the 'print' procedure (data buffer)
    mov %rsi, OFFSET thread2_msg_len # rsi: 2nd argument to the 'print' procedure (buffer len)
    call thread_run

    # Do not wait for the child
    call _pmsg

    # Exit
    jmp _exit


_pmsg:
    # Print 'parent_msg'
    lea %rdi, [%rip + parent_msg]   # rdi: Store the pointer to the data buffer parent_msg
    mov %rsi, OFFSET parent_msg_len
    call print
    ret

_log:
    # Print 'log_msg'
    lea %rdi, [%rip + log_msg]      # rdi: Store the pointer to the data buffer log_msg
    mov %rsi, OFFSET log_msg_len
    call print
    ret

_exit:
    # Exit safely with status code 0
    mov %rax, 0x3c # 0x3c -> Exit system call
    mov %rdi, 0x00 # Status code 0x00
    syscall


.section .data
    log_msg:
        .ascii "\nCreating a thread...\n" # 21 bytes
        log_msg_len = . - log_msg
    thread_msg:
        .ascii "Hello from the thread 1!\n" # 19 bytes
        thread_msg_len = . - thread_msg
    thread2_msg:
        .ascii "Hello from thread 2!\n"     # 19 bytes
        thread2_msg_len = . - thread2_msg
    parent_msg:
        .ascii "Hello from the parent!!\n"  # 20 bytes
        parent_msg_len = . - parent_msg
