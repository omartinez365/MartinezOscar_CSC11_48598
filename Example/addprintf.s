/**** Learning to add ****/

.data 

message1: .asciz "Type two numbers to add: "
format:	  .asciz "%d %d"
message2: .asciz "The inputs are %d and %d\n"
message3: .asciz "The output is: %d\n"

.text
.global main
main:
	push {lr}
	sub, sp, sp, #8

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
	ldr r1, [sp]
	ldr r2, [sp]
	add r3, r2, r1
	mov r3, r1
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
