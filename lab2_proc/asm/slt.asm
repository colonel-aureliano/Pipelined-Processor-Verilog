csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x0
slt x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
csrr x2, mngr2proc < 0x1
slt x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
csrr x2, mngr2proc < 0x0
slt x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
csrr x2, mngr2proc < 0x2
slt x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0xffffffff
slt x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0x80000000
slt x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x80000000
slt x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x7fffffff
slt x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0x7fffffff
slt x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0xffffffff
slt x3, x1, x2
csrw proc2mngr, x3 > 0x1
