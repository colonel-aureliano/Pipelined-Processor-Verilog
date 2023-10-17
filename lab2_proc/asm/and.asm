csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x0
and x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
csrr x2, mngr2proc < 0x1
and x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x2
csrr x2, mngr2proc < 0x3
and x3, x1, x2
csrw proc2mngr, x3 > 0x2
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x1f
and x3, x1, x2
csrw proc2mngr, x3 > 0x1f
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0x1f
and x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0xffffffff
and x3, x1, x2
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0xffffffff
and x3, x1, x2
csrw proc2mngr, x3 > 0x80000000
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0x80000000
and x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0xffffffff
and x3, x1, x2
csrw proc2mngr, x3 > 0x7fffffff
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0x0
and x3, x1, x2
csrw proc2mngr, x3 > 0x0
