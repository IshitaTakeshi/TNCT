# suffix "l" denotes 32-bit integer
    .global fibonacci_iterative
    .text   # text section where code goes

fibonacci_iterative:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp        # reserve 32 bytes on stack for local variables
	movl	$0, -4(%rbp)     # -4(%rbp) = 0
	movl	$1, -8(%rbp)     # -8(%rbp) = 1
	jmp	.L2

.L3:
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)  # -12(%rbp) = -4(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)   # -4(%rbp) = -8(%rbp)
	movl	-12(%rbp), %eax
	addl	%eax, -8(%rbp)   # -8(%rbp) = -12(%rbp) + -8(%rbp)
.L2:
    # return if 1134903170 >= -8(%rbp)
	cmpl	$1134903170, -8(%rbp)
	jle	.L3
	nop
	leave
	ret
