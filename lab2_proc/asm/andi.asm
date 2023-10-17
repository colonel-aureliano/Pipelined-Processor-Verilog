csrr x1, mngr2proc < 0x0
andi x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
andi x3, x1, 0x1
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x2
andi x3, x1, 0x3
csrw proc2mngr, x3 > 0x2
csrr x1, mngr2proc < 0xffffffff
andi x3, x1, 0x3
csrw proc2mngr, x3 > 0x3
csrr x1, mngr2proc < 0x80000000
andi x3, x1, 0x1
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
andi x3, x1, 0xfff
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x80000000
andi x3, x1, 0xfff
csrw proc2mngr, x3 > 0x80000000
csrr x1, mngr2proc < 0x2
andi x3, x1, 0x1
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
andi x3, x1, 0x7ff
csrw proc2mngr, x3 > 0x7ff
csrr x1, mngr2proc < 0x80000001
andi x3, x1, 0x7ff
csrw proc2mngr, x3 > 0x1
