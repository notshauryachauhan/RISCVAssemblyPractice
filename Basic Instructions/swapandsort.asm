.data
my_array: .word 20,30,10,50,12,40,90,23,56,85,99

.text
.global_start

_start:
	la x10, my_array
	li x11, 11
	jal x1, sort
	
exit:
	lw x11, 0(sp)
	addi sp, sp, 4
	addi a7, zero, 10
	ecall
	
# i-> x19, j-> x20, v-> x10, n -> x11
sort:
	addi sp, sp, -4
	sw x11, 0(sp)
	addi x19, zero, 0
	add x30, zero, x11
	j firstloop
	
firstloop:
	bgt x19, x30, exit
	addi x20, zero, 0
	addi x31, x19, 1
	sub x7, x11, x31
	jal x1, ndloopmain
	addi x19, x19, 1
	j firstloop
	
ndloopmain:
	bge x20, x7, innerloopdone
	addi x6, zero, 0
	slli x6, x20, 2
	add x5, x10, x6
	lw x28, 0(x5)
	lw x29, 4(x5)
	blt x28, x29, incrementJ
	sw x29, 0(x5)
	sw x28, 4(x5)
	addi x20, x20, 1
	j ndloopmain

incrementJ:
	addi x20, x20, 1
	j ndloopmain
	
innerloopdone:
	jalr zero, 0(x1)