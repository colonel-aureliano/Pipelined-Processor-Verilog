csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x0
or x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x1
or x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x1
csrr x2, mngr2proc < 0x2
or x3, x1, x2
csrw proc2mngr, x3 > 0x3
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0xffffffff
or x3, x1, x2
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0x80000000
or x3, x1, x2
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x80000000
or x3, x1, x2
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x80000000
or x3, x1, x2
csrw proc2mngr, x3 > 0x80000000