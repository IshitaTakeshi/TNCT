	.text
fibonacci_recursive_:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$24, %rsp         # reserve 24 bytes for local variables
	movl	%edi, -20(%rbp)
	cmpl	$1, -20(%rbp)     # jump to .L2 if n > 1
	jg	.L2
	movl	-20(%rbp), %eax   # return otherwise
	jmp	.L3
.L2:
	movl	-20(%rbp), %edi   # call fibonacci_recursive_(n-1)
	subl	$1, %edi
	call	fibonacci_recursive_
	movl	%eax, %ebx
	movl	-20(%rbp), %eax   # call fibonacci_recursive_(n-2)
	subl	$2, %eax
	movl	%eax, %edi
	call	fibonacci_recursive_
	addl	%ebx, %eax        # fibonacci_recursive_(n-1) + fibonacci_recursive_(n-2)
.L3:
	addq	$24, %rsp         # free the reserved space and return
	popq	%rbx
	popq	%rbp
	ret

	.text
	.globl	fibonacci_recursive
fibonacci_recursive:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$45, %edi
	call	fibonacci_recursive_         # m = fibonacci_recursive_(n)
	leave
	ret
