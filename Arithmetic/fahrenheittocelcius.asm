.data
const5: .float 5.0
const9: .float 9.0
const32: .float 32.0
consttemp: .float 98.6

.text

_start:

	la x5, const5
	la x6, const9
	la x7, const32
	la x8, consttemp
	flw f5, 0(x5)
	flw f9, 0(x6)
	flw f0, 0(x7)
	flw f10, 0(x8)
	jal x1, f2c
	addi x17, zero, 10
	ecall

f2c:
	fdiv.s f2, f5, f9
	fsub.s f10, f10, f0
	fmul.s f10, f10, f2
	ret