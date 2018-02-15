	.text
fibonacci:
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
	movl	-20(%rbp), %edi   # call fibonacci(n-1)
	subl	$1, %edi
	call	fibonacci
	movl	%eax, %ebx
	movl	-20(%rbp), %eax   # call fibonacci(n-2)
	subl	$2, %eax
	movl	%eax, %edi
	call	fibonacci
	addl	%ebx, %eax        # fibonacci(n-1) + fibonacci(n-2)
.L3:
	addq	$24, %rsp         # free the reserved space and return
	popq	%rbx
	popq	%rbp
	ret

	.section	.rodata
.LC0:
	.string	"%d\n"

	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp         # reserve 16 bytes for local variables
	movl	$1, -4(%rbp)      # n = 1
.L7:
    # .L7 is an infinite loop
	movl	-4(%rbp), %edi
	call	fibonacci         # m = fibonacci(n)
	movl	%eax, -8(%rbp)
	cmpl	$65535, -8(%rbp)  # break if m > 65535
	jg	.L10
	movl	-8(%rbp), %esi    # print m
	movl	$.LC0, %edi
	call	printf
	addl	$1, -4(%rbp)      # n = n + 1
	jmp	.L7
.L10:
	movl	$0, %eax
	leave
	ret
