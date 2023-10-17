csrr x1, mngr2proc < 8192
csrr x3, mngr2proc < 4
sw x3, 0(x1)
csrr x2, mngr2proc < 8192
csrr x3, mngr2proc < 8
sw x3, 4(x2)
csrr x2, mngr2proc < 8192
csrr x3, mngr2proc < -1
sw x3, 8(x2)
csrr x2, mngr2proc < 8192
csrr x3, mngr2proc < 11
sw x3, 12(x2)
csrr x1, mngr2proc < 8192
csrr x3, mngr2proc < 2147483648
sw x3, 16(x1)
csrr x1, mngr2proc < 8232
csrr x3, mngr2proc < 5
sw x3, -20(x1)
csrr x1, mngr2proc < 8232
csrr x3, mngr2proc < 9
sw x3, -16(x1)
csrr x1, mngr2proc < 8196
lw x3, 0(x1)
csrw proc2mngr, x3 > 8
csrr x2, mngr2proc < 8196
lw x3, -4(x2)
csrw proc2mngr, x3 > 4
csrr x2, mngr2proc < 8196
lw x3, 4(x2)
csrw proc2mngr, x3 > -1
csrr x2, mngr2proc < 8196
lw x3, 12(x2)
csrw proc2mngr, x3 > 2147483648
csrr x2, mngr2proc < 8212
lw x3, 4(x2)
csrw proc2mngr, x3 > 9
csrr x1, mngr2proc < 8212
lw x3, 0(x1)
csrw proc2mngr, x3 > 5
csrr x1, mngr2proc < 8212
lw x3, -16(x1)
csrw proc2mngr, x3 > 8
