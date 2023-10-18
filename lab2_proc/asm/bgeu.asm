csrr x3, mngr2proc < 0x208
csrr x4, mngr2proc < 0x208
csrr x5, mngr2proc < 0xfffffffe
xor x9, x9, x9
bgeu x5, x3, 12
addi x9, x0, 1
addi x4, x0, 0xfff
bgeu x5, x4, -4


csrw proc2mngr, x9 > 0
csrw proc2mngr, x4 > 0xffffffff