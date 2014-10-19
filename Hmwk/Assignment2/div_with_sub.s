/**** Perform 11/5 and 11%5 with subtraction ****/
/**** With flag off r0 holds a/b and r1 holds a%b, this is switched if flag is on ****?

	.global start: 
_start: 
	MOV R2, #11
	MOV R3, #5
	MOV R4, #0	@flag
	MOV R5, #0
	MOV R0, #0 	@counter
	MOV R1, R2
	CMP R1, R3 
	BGE divmod

divmod: 
	ADD R0, #1
	SUB R1, R1, R3
	CMP R1, R3
	BGE divmod
	CMP R4, #0
	BEQ flag

flag: 
	MOV R5, R0
	MOV R0, R1
	MOV R1, R5

exit:
	MOV R7, #1
	SWI 0

	