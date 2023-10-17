csrr x1, mngr2proc < 0x0
nop
csrr x2, mngr2proc < 0x0
nop
nop
nop
or x3, x1, x2
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x0
nop
csrr x2, mngr2proc < 0x1
nop
or x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x1
nop
nop
csrr x1, mngr2proc < 0x1
nop
nop
nop
csrr x2, mngr2proc < 0x2
nop
nop
or x3, x1, x2
csrw proc2mngr, x3 > 0x3
csrr x1, mngr2proc < 0x7fffffff
nop
csrr x2, mngr2proc < 0xffffffff
nop
or x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0x80000000
or x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0xffffffff
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x80000000
nop
nop
or x3, x1, x2
nop
csrw proc2mngr, x3 > 0xffffffff
nop
csrr x1, mngr2proc < 0x0
nop
nop
csrr x2, mngr2proc < 0x80000000
nop
or x3, x1, x2
nop
csrw proc2mngr, x3 > 0x80000000
nop
