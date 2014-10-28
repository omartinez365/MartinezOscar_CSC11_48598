/**** CSC 11 Midterm Problem 1 ****/

.data 

message1: .asciz "Enter the plan and hours of usage: "
format:	  .asciz "%d %d"
message2: .asciz "The inputs are %d and %d\n"
message3: .asciz "The total bill is: %d\n"

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
	ldr r1, [r1]	/* package */
	ldr r2, [sp]	/* hours */
	mov r3, #0	/* total bill */
	cmp r1, #97
	beq package_a
	cmp r1, #98
	beq package_b
	cmp r1, #99
	beq package_c

package_a:
	mov r3, #30
	cmp r2, #22
	ble additional_hours_a
	sub r4, r1, #22	/* hours-22 */
	mov r6, #6
	mul r5, r4, r6	/* 6*(hours - 22) */ 
	add r3, r3, r5	/* total += 6*(hours-22) */ 
	sub r1, r1, r4	/* hours = hours - (hours - 22) */

additional_hours_a: 
	sub r4, r1, #11	/* hours-11 */
	mov r6, #3
	mul r5, r4, r6	/* 3*(hours - 11) */ 
	add r3, r3, r5	/* total += 3*(hours-11) */ 
	b output

package_b:
	mov r3, #35
	cmp r2, #44
	ble additional_hours_b
	sub r4, r1, #44	/* hours-44 */
	mov r6, #4
	mul r5, r4, r6	/* 4*(hours - 44) */ 
	add r3, r3, r5	/* total += 4*(hours-44) */ 
	sub r1, r1, r4	/* hours = hours - (hours - 44) */

additional_hours_b: 
	sub r4, r1, #22	/* hours-22 */
	mov r6, #2
	mul r5, r4, r6	/* 2*(hours - 22) */ 
	add r3, r3, r5	/* total += 2*(hours-22) */ 
	b output

package_c:
	mov r3, #40
	cmp r2, #66
	ble additional_hours_c
	sub r4, r1, #66	/* hours-66 */
	mov r6, #2
	mul r5, r4, r6	/* 2*(hours - 66) */ 
	add r3, r3, r5	/* total += 2*(hours-66) */ 
	sub r1, r1, r4	/* hours = hours - (hours - 66) */

additional_hours_c: 
	sub r4, r1, #33	/* hours-33 */
	mov r6, #1
	mul r5, r4, r6	/* 1*(hours - 33) */ 
	add r3, r3, r5	/* total += 1*(hours-33) */ 

output:
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
