.data
my_array: .word 20,30,10,50,12,40,90,23,56,85,99

.text
.global_start

_start:
	la x10, my_array
	li x11, 12
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
	slli x6, x20, 2
	addi x5, zero, 0
	add x5, x10, x6
	lw x28, 0(x5)
	lw x29, 4(x5)
	blt x28, x29, incrementJ
	addi sp, sp, -4
	sw x1, 0(sp)
	jal x1, swap
	lw x1, 0(sp)
	addi sp, sp, 4
	addi x20, x20, 1
	j ndloopmain

incrementJ:
	addi x20, x20, 1
	j ndloopmain
	
innerloopdone:
	jalr zero, 0(x1)

#  v-> x10, k/j -> x20, temp -> x5	
swap:
	addi sp, sp, -8
	sw x6, 4(sp)
	sw x5, 0(sp)
	slli x6, x20, 2
	add x6, x6, x10
	addi x7, zero, 0
	lw x5, 0(x6)
	lw x7, 4(x6)
	sw x7, 0(x6)
	sw x5, 4(x6)
	lw x5, 0(sp)
	lw x6, 4(sp)
	addi sp, sp, 8
	jalr zero, 0(x1)