	.file	"check_context.c"
	.section .rdata,"dr"
.LC0:
	.ascii "%s/context\0"
	.text
	.globl	security_check_context
	.def	security_check_context;	.scl	2;	.type	32;	.endef
	.seh_proc	security_check_context
security_check_context:
	pushq	%rbp
	.seh_pushreg	%rbp
	movl	$4144, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	4144
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 4032(%rbp)
	movq	.refptr.selinux_mnt(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L2
	call	__errno
	movl	$2, (%rax)
	movl	$-1, %eax
	jmp	.L6
.L2:
	movq	.refptr.selinux_mnt(%rip), %rax
	movq	(%rax), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %r9
	leaq	.LC0(%rip), %r8
	movl	$4096, %edx
	movq	%rax, %rcx
	call	snprintf
	leaq	-96(%rbp), %rax
	movl	$2, %edx
	movq	%rax, %rcx
	call	open
	movl	%eax, 4012(%rbp)
	cmpl	$0, 4012(%rbp)
	jns	.L4
	movl	$-1, %eax
	jmp	.L6
.L4:
	movq	4032(%rbp), %rcx
	call	strlen
	leaq	1(%rax), %rdx
	movl	4012(%rbp), %eax
	movq	%rdx, %r8
	movq	4032(%rbp), %rdx
	movl	%eax, %ecx
	call	write
	movl	%eax, 4008(%rbp)
	movl	4012(%rbp), %eax
	movl	%eax, %ecx
	call	close
	cmpl	$0, 4008(%rbp)
	jns	.L5
	movl	$-1, %eax
	jmp	.L6
.L5:
	movl	$0, %eax
.L6:
	addq	$4144, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 5.4.0"
	.def	__errno;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	open;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	write;	.scl	2;	.type	32;	.endef
	.def	close;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.selinux_mnt, "dr"
	.globl	.refptr.selinux_mnt
	.linkonce	discard
.refptr.selinux_mnt:
	.quad	selinux_mnt
