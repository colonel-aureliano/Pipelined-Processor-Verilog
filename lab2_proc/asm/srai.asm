csrr x1, mngr2proc < 0x0
srai x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
srai x3, x1, 0x1
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x20
srai x3, x1, 0x3
csrw proc2mngr, x3 > 0x4
csrr x1, mngr2proc < 0xffffffff
srai x3, x1, 0x1f
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x80000000
srai x3, x1, 0x1f
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0xffffffff
srai x3, x1, 0x1f
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x80000000
srai x3, x1, 0x1f
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x20
srai x3, x1, 0x0
csrw proc2mngr, x3 > 0x20
csrr x1, mngr2proc < 0x2
srai x3, x1, 0x1
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x8
srai x3, x1, 0x2
csrw proc2mngr, x3 > 0x2
csrr x1, mngr2proc < 0x7fffffff
srai x3, x1, 0x1f
csrw proc2mngr, x3 > 0x0
