	.file	"driver.cpp"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	_Z4testIhEvv
	call	_Z4testIjEvv
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
.LC0:
	.string	"%u  %u\n"
.LC1:
	.string	"--------"
	.section	.text._Z4testIhEvv,"axG",@progbits,_Z4testIhEvv,comdat
	.weak	_Z4testIhEvv
	.type	_Z4testIhEvv, @function
_Z4testIhEvv:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movb	$1, -18(%rbp)
	movb	$127, -17(%rbp)
	movzbl	-17(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	_Z6rotatehi@PLT
	movzbl	%al, %ebx
	movzbl	-18(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	_Z6rotatehi@PLT
	movzbl	%al, %eax
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movzbl	-17(%rbp), %eax
	movl	$8, %esi
	movl	%eax, %edi
	call	_Z6rotatehi@PLT
	movzbl	%al, %ebx
	movzbl	-18(%rbp), %eax
	movl	$8, %esi
	movl	%eax, %edi
	call	_Z6rotatehi@PLT
	movzbl	%al, %eax
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movzbl	-17(%rbp), %eax
	movl	$31, %esi
	movl	%eax, %edi
	call	_Z6rotatehi@PLT
	movzbl	%al, %ebx
	movzbl	-18(%rbp), %eax
	movl	$31, %esi
	movl	%eax, %edi
	call	_Z6rotatehi@PLT
	movzbl	%al, %eax
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z4testIhEvv, .-_Z4testIhEvv
	.section	.text._Z4testIjEvv,"axG",@progbits,_Z4testIjEvv,comdat
	.weak	_Z4testIjEvv
	.type	_Z4testIjEvv, @function
_Z4testIjEvv:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movl	$1, -24(%rbp)
	movl	$127, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	_Z6rotateji@PLT
	movl	%eax, %ebx
	movl	-24(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	_Z6rotateji@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-20(%rbp), %eax
	movl	$8, %esi
	movl	%eax, %edi
	call	_Z6rotateji@PLT
	movl	%eax, %ebx
	movl	-24(%rbp), %eax
	movl	$8, %esi
	movl	%eax, %edi
	call	_Z6rotateji@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-20(%rbp), %eax
	movl	$31, %esi
	movl	%eax, %edi
	call	_Z6rotateji@PLT
	movl	%eax, %ebx
	movl	-24(%rbp), %eax
	movl	$31, %esi
	movl	%eax, %edi
	call	_Z6rotateji@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	nop
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z4testIjEvv, .-_Z4testIjEvv
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
