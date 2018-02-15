    .globl	main

    .section	.rodata  # read-only data
.LC0:
	.string	"%d\n"

# suffix "l" denotes 32-bit integer
    .text   # text section where code goes

fibonacci:
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
	movl	-4(%rbp), %esi   # argument of printf. this prints -4(%rbp)
	movl	$.LC0, %edi      # "%d\n"
	call	printf

.L2:
    # return if 65536 > -8(%rbp)
	cmpl	$65536, -8(%rbp)
	jl	.L3
	nop
	leave
	ret

main:
	pushq	%rbp            # function prologue
	movq	%rsp, %rbp
	call	fibonacci       # call fibonacci
	movl	$0, %eax
	popq	%rbp
	ret
