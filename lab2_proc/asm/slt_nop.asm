csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x0
slt x3, x1, x2
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0x1
nop
nop
nop
csrr x2, mngr2proc < 0x1
nop
nop
nop
slt x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x1
nop
nop
nop
csrr x2, mngr2proc < 0x0
nop
nop
slt x3, x1, x2
nop
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0x1
nop
csrr x2, mngr2proc < 0x2
nop
nop
slt x3, x1, x2
csrw proc2mngr, x3 > 0x1
nop
csrr x1, mngr2proc < 0x7fffffff
nop
csrr x2, mngr2proc < 0xffffffff
nop
slt x3, x1, x2
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
nop
nop
csrr x2, mngr2proc < 0x80000000
nop
nop
nop
slt x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
csrr x2, mngr2proc < 0x80000000
slt x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x7fffffff
slt x3, x1, x2
nop
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
nop
csrr x2, mngr2proc < 0x7fffffff
nop
nop
nop
slt x3, x1, x2
nop
csrw proc2mngr, x3 > 0x1
nop
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
csrr x2, mngr2proc < 0xffffffff
nop
nop
slt x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x1
nop
