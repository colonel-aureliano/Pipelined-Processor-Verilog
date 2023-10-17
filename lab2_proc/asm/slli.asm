csrr x1, mngr2proc < 0x0
slli x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
slli x3, x1, 0x1
csrw proc2mngr, x3 > 0x2
csrr x1, mngr2proc < 0x4
slli x3, x1, 0x3
csrw proc2mngr, x3 > 0x20
csrr x1, mngr2proc < 0xffffffff
slli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x80000000
csrr x1, mngr2proc < 0x80000000
slli x3, x1, 0x1
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
slli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x80000000
csrr x1, mngr2proc < 0x80000000
slli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x20
slli x3, x1, 0x1
csrw proc2mngr, x3 > 0x40
csrr x1, mngr2proc < 0x2
slli x3, x1, 0x1
csrw proc2mngr, x3 > 0x4
csrr x1, mngr2proc < 0x80000001
slli x3, x1, 0x2
csrw proc2mngr, x3 > 0x4
csrr x1, mngr2proc < 0x7fffffff
slli x3, x1, 0x1
csrw proc2mngr, x3 > 0xfffffffe
