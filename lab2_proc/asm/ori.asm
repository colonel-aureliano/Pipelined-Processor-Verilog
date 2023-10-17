csrr x1, mngr2proc < 0x0
ori x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x0
ori x3, x1, 0x1
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x1
ori x3, x1, 0x2
csrw proc2mngr, x3 > 0x3
csrr x1, mngr2proc < 0x7fffffff
ori x3, x1, 0xfff
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x7fffffff
ori x3, x1, 0x0
csrw proc2mngr, x3 > 0x7fffffff
csrr x1, mngr2proc < 0xffffffff
ori x3, x1, 0x0
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x80000000
ori x3, x1, 0x1
csrw proc2mngr, x3 > 0x80000001
