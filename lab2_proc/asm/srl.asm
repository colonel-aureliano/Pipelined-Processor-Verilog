csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x0
srl x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
csrr x2, mngr2proc < 0x1
srl x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x20
csrr x2, mngr2proc < 0x3
srl x3, x1, x2
csrw proc2mngr, x3 > 0x4
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x1f
srl x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0x1f
srl x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0xffffffff
srl x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0xffffffff
srl x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x20
csrr x2, mngr2proc < 0x80000001
srl x3, x1, x2
csrw proc2mngr, x3 > 0x10
csrr x1, mngr2proc < 0x2
csrr x2, mngr2proc < 0x1
srl x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000001
csrr x2, mngr2proc < 0x2
srl x3, x1, x2
csrw proc2mngr, x3 > 0x20000000
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0x1e
srl x3, x1, x2
csrw proc2mngr, x3 > 0x1
