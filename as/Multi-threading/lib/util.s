# util.s


.intel_syntax
.section .text

# Print function
# Make use of linux 'write' system call
# 2 params: ptr and len
.global print
print:
    mov %rdx, %rsi # move the length to rdx
    mov %rsi, %rdi # move the pointer to the buffer to rsi
    mov %rax, 0x01 # 'write' system call code 0x01
    mov %rdi, 0x01 # STDOUT file descriptor
    syscall
    ret
