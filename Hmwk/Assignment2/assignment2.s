/**** Perform 11/3 and 11%3 with successive subtraction ****/ 
/**** With flag off r0 holds a/b and r1 holds a%b switched if flag is on ****/


	.global _start
_start:
	MOV R0, #0
	MOV R1, #0
	MOV R2, #11
	MOV R3, #5
	MOV R4, #0	@ counter
	MOV R5, #1	@ sets the flag
	CMP R5, #0
	BEQ switch_flag_off

switch_flag_on:
	CMP R2, R3
	SUB R2, R2, R3
	ADD R4, R4, #1
	CMP R2, R3
	SUB R2, R2, R3
	ADD R4, R4, #1
	MOV R0, R2
	MOV R1, R4
	b end

switch_flag_off:
	CMP R2, R3
	SUB R2, R2, R3
	ADD R4, R4, #1
	CMP R2, R3
	SUB R2, R2, R3
	ADD R4, R4, #1
	MOV R0, R4
	MOV R1, R2
end:
	bx lr
