	.file	"constructors.cpp"
	.text
	.section	.text._ZN6PersonC2Ev,"axG",@progbits,_ZN6PersonC5Ev,comdat
	.align 2
	.weak	_ZN6PersonC2Ev
	.type	_ZN6PersonC2Ev, @function
_ZN6PersonC2Ev:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$99, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_ZN6PersonC2Ev, .-_ZN6PersonC2Ev
	.weak	_ZN6PersonC1Ev
	.set	_ZN6PersonC1Ev,_ZN6PersonC2Ev
	.section	.text._ZN6PersonC2Ei,"axG",@progbits,_ZN6PersonC5Ei,comdat
	.align 2
	.weak	_ZN6PersonC2Ei
	.type	_ZN6PersonC2Ei, @function
_ZN6PersonC2Ei:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_ZN6PersonC2Ei, .-_ZN6PersonC2Ei
	.weak	_ZN6PersonC1Ei
	.set	_ZN6PersonC1Ei,_ZN6PersonC2Ei
	.section	.text._ZN6PersonC2Eii,"axG",@progbits,_ZN6PersonC5Eii,comdat
	.align 2
	.weak	_ZN6PersonC2Eii
	.type	_ZN6PersonC2Eii, @function
_ZN6PersonC2Eii:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-12(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_ZN6PersonC2Eii, .-_ZN6PersonC2Eii
	.weak	_ZN6PersonC1Eii
	.set	_ZN6PersonC1Eii,_ZN6PersonC2Eii
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6PersonC1Ev
	leaq	-44(%rbp), %rax
	movl	$2, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	call	_ZN6PersonC1Eii
	movl	$4, %edi
	call	_Znwm@PLT
	movq	%rax, %rbx
	movl	$5, %edx
	movl	$10, %esi
	movq	%rbx, %rdi
	call	_ZN6PersonC1Eii
	movq	%rbx, -40(%rbp)
	movl	$4, %edi
	call	_Znwm@PLT
	movq	%rax, %rbx
	movl	$30, %esi
	movq	%rbx, %rdi
	call	_ZN6PersonC1Ei
	movq	%rbx, -32(%rbp)
	movl	$4, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
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
