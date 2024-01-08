	.file	"constructors.cpp"
	.intel_syntax noprefix
	.text
	.section	.text._ZN6PersonC2Eiiiiii,"axG",@progbits,_ZN6PersonC5Eiiiiii,comdat
	.align 2
	.weak	_ZN6PersonC2Eiiiiii
	.type	_ZN6PersonC2Eiiiiii, @function
_ZN6PersonC2Eiiiiii:
.LFB10:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -8[rbp], rdi
	mov	DWORD PTR -12[rbp], esi
	mov	DWORD PTR -16[rbp], edx
	mov	DWORD PTR -20[rbp], ecx
	mov	DWORD PTR -24[rbp], r8d
	mov	DWORD PTR -28[rbp], r9d
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -16[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -20[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -24[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -28[rbp]
	add	edx, eax
	mov	eax, DWORD PTR 16[rbp]
	add	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], edx
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	_ZN6PersonC2Eiiiiii, .-_ZN6PersonC2Eiiiiii
	.weak	_ZN6PersonC1Eiiiiii
	.set	_ZN6PersonC1Eiiiiii,_ZN6PersonC2Eiiiiii
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -12[rbp]
	sub	rsp, 8
	push	150
	mov	r9d, 125
	mov	r8d, 100
	mov	ecx, 75
	mov	edx, 50
	mov	esi, 25
	mov	rdi, rax
	call	_ZN6PersonC1Eiiiiii
	add	rsp, 16
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
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
