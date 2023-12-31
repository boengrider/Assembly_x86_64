	.file	"branching.cpp"
	.text
	.globl	_Z15actionIncrementi
	.type	_Z15actionIncrementi, @function
_Z15actionIncrementi:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z15actionIncrementi, .-_Z15actionIncrementi
	.globl	_Z15actionDecrementi
	.type	_Z15actionDecrementi, @function
_Z15actionDecrementi:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	subl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z15actionDecrementi, .-_Z15actionDecrementi
	.globl	_Z12actionDecidei
	.type	_Z12actionDecidei, @function
_Z12actionDecidei:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp //%rbp -> stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp //%rsp -> %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp //%rsp - 8 -> %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L6
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	_Z15actionIncrementi
	jmp	.L8
.L6:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	_Z15actionDecrementi
.L8:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z12actionDecidei, .-_Z12actionDecidei
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$10, %edi //move 1st argument to the register 
	call	_Z12actionDecidei
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
