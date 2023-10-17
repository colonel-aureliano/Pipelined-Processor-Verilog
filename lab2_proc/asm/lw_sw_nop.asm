csrr x1, mngr2proc < 8192
nop
csrr x3, mngr2proc < 4
nop
nop
nop
sw x3, 0(x1)
nop
nop
csrr x2, mngr2proc < 8192
csrr x3, mngr2proc < 8
nop
sw x3, 4(x2)
nop
nop
nop
csrr x2, mngr2proc < 8192
nop
nop
nop
csrr x3, mngr2proc < -1
nop
sw x3, 8(x2)
nop
csrr x2, mngr2proc < 8192
nop
nop
csrr x3, mngr2proc < 11
sw x3, 12(x2)
nop
csrr x1, mngr2proc < 8192
nop
nop
csrr x3, mngr2proc < 2147483648
nop
nop
sw x3, 16(x1)
nop
nop
nop
csrr x1, mngr2proc < 8232
csrr x3, mngr2proc < 5
sw x3, -20(x1)
nop
nop
nop
csrr x1, mngr2proc < 8232
nop
csrr x3, mngr2proc < 9
nop
sw x3, -16(x1)
nop
nop
nop
csrr x1, mngr2proc < 8196
nop
nop
nop
lw x3, 0(x1)
csrw proc2mngr, x3 > 8
nop
csrr x2, mngr2proc < 8196
nop
lw x3, -4(x2)
nop
csrw proc2mngr, x3 > 4
csrr x2, mngr2proc < 8196
nop
lw x3, 4(x2)
nop
nop
nop
csrw proc2mngr, x3 > -1
nop
csrr x2, mngr2proc < 8196
nop
lw x3, 12(x2)
csrw proc2mngr, x3 > 2147483648
nop
csrr x2, mngr2proc < 8212
nop
lw x3, 4(x2)
nop
nop
csrw proc2mngr, x3 > 9
nop
nop
nop
csrr x1, mngr2proc < 8212
nop
nop
lw x3, 0(x1)
nop
nop
nop
csrw proc2mngr, x3 > 5
csrr x1, mngr2proc < 8212
nop
lw x3, -16(x1)
nop
nop
nop
csrw proc2mngr, x3 > 8
