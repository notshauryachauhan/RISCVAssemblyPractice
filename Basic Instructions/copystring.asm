.data
source_string:  .asciz "Hello, RARS environment!"
dest_string:    .space 32

.text
.global_start

_start:
	la x11, source_string
	la x10, dest_string
	jal x1, Strcpy
	la x10, dest_string
        addi x17, zero, 4
        ecall
	jal x0, Exit	
Exit:
	addi x17, zero, 10
	ecall	
Strcpy:
	lbu x5, 0(x11)
	sb x5, 0(x10)
	addi x11, x11, 1
	addi x10, x10, 1
	beq x5, zero, Copied
	jal x0, Strcpy
	
Copied:
	jalr x0,0(x1)