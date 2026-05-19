addi x10, zero, 5
jal x1, fact

Exit:
	jal x0, Exit

fact:
	addi sp, sp, -8
	sw x10, 4(sp)
	sw x1, 0(sp)
	addi x5, x10, -1
	bge x5, zero, L1
	addi x10, zero, 1
	addi sp, sp, 8
	jalr x0, 0(x1)
	
L1: 
	addi x10, x10, -1
	jal x1, fact
	addi x6, x10, 0
	lw x1, 0(sp)
	lw x10, 4(sp)
	mul x10, x10, x6
	addi sp, sp, 8
	jalr x0, 0(x1)