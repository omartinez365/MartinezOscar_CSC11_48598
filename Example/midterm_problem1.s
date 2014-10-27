/**** CSC 11 Midterm Problem 1 ****/

.data 

message1: .asciz "Enter the number of hours and the base rate: "
format:	  .asciz "%d %d"
message2: .asciz "The inputs are %d and %d\n"
message3: .asciz "The Gross Pay is: %d\n"

.text
.global main
main:
	push {lr}
	sub sp, sp, #8

	ldr r0, addr_message1
	bl printf

	ldr r0, addr_format
	mov r2, sp
	add r1, r2, #4
	bl scanf

	add r1, sp, #4
	ldr r1, [r1]
	ldr r2, [sp]
	ldr r0, addr_message2
	bl printf

	add r1, sp, #4	
	ldr r1, [r1]	/* hours */
	ldr r2, [sp]	/* base rate */
	mov r3, #0	/* gross pay */
	cmp r1, #40
	blt double_time
	sub r4, r1, #39	/* hours-39 */
	mov r6, #3
	mul r5, r2, r6	/* 3*rate */ 
	mul r6, r5, r4	/* 3*rate*(hours-39) */
	add r3, r3, r6	/* grossPay += 3*rate*(hours-39) */ 
	sub r1, r1, r4	/* hours = hours - (hours - 39) */ 

double_time: 
	cmp r1, #20
	ble regular_time
	sub r4, r1, #20	/* hours-20 */
	mov r6, #2
	mul r5, r2, r6	/* 2*rate */ 
	mul r6, r5, r4	/* 2*rate*(hours-20) */
	add r3, r3, r6	/* grossPay += 2*rate*(hours-20) */ 
	sub r1, r1, r4	/* hours = hours - (hours - 20) */

regular_time: 
	mul r5, r1, r2
	add r3, r3, r5

	mov r1, r3

	ldr r0, addr_message3
	bl printf

	add sp, sp, #8
	pop {pc}

_exit:
	mov pc, lr

addr_message1: .word message1
addr_message2: .word message2
addr_message3: .word message3
addr_format:   .word format
