csrr x1, mngr2proc < 5
addi x3, x1, 4
csrw proc2mngr, x3 > 9
nop
xor x2, x2, x2
addi x4, x2, 0xfff
csrw proc2mngr, x4 > -1
nop
csrr x5, mngr2proc < -1
addi x5, x5, 1
csrw proc2mngr, x5 > 0
nop
csrr x6, mngr2proc < 0x7fffffff
addi x6, x6, 1
csrw proc2mngr, x6 > 0x80000000
nop
addi x6, x6, 1
csrw proc2mngr, x6 > 0x80000001