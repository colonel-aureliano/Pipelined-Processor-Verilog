csrr x3, mngr2proc < 0x208
csrr x4, mngr2proc < 0x208
csrr x5, mngr2proc < 0xffffffff
xor x9, x9, x9
bltu x3, x5, 12
addi x9, x0, 1
addi x4, x0, 0xfff
bltu x4, x5, -4


csrw proc2mngr, x9 > 0
csrw proc2mngr, x4 > 0xffffffff