	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	@ r3=n, r4=first, r5=second,
	@ r6= next, r7=c 
	push {r3, r4, r5, r6, r7, lr} 

	mov r4, #0
	mov r5, #1
	mov r3, r0
	@c=0
	mov r7, #0
	@next = c
	mov r6, #0

L1:	
	@if (c<=1)
	cmp r7, #1
	bgt L2 @if (c > 1)
	mov r6, r7 @if (c<=1) next = c
	b L3
L2:
	@next = first + second;
	add r6, r4, r5
	@first = second;
	mov r4, r5
	@second = next;
	mov r5, r6
L3:
	@c++
	add r7, #1
	@if c <= n
	cmp r7, r3	
	@jump to .L1 
	blt L1
	mov r0, r6

	pop {r3, r4, r5, r6, r7, pc}		@EPILOG
	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end	
