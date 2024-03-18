	.file	"alloc.cpp"
	.text
	.globl	oneByte
	.data
	.type	oneByte, @object
	.size	oneByte, 1
oneByte:
	.byte	-1
	.globl	twoBytes
	.align 2
	.type	twoBytes, @object
	.size	twoBytes, 2
twoBytes:
	.value	-1
	.globl	fourBytes
	.align 4
	.type	fourBytes, @object
	.size	fourBytes, 4
fourBytes:
	.long	-1
	.globl	eightBytes
	.align 8
	.type	eightBytes, @object
	.size	eightBytes, 8
eightBytes:
	.quad	8294967296



	
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
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
