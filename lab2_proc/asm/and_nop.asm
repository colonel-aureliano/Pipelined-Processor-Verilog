csrr x1, mngr2proc < 0x0
nop
nop
nop
csrr x2, mngr2proc < 0x0
nop
nop
nop
and x3, x1, x2
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x1
nop
nop
csrr x2, mngr2proc < 0x1
and x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x1
nop
nop
csrr x1, mngr2proc < 0x2
nop
csrr x2, mngr2proc < 0x3
nop
and x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x2
csrr x1, mngr2proc < 0xffffffff
nop
csrr x2, mngr2proc < 0x1f
nop
nop
nop
and x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x1f
csrr x1, mngr2proc < 0x80000000
nop
nop
nop
csrr x2, mngr2proc < 0x1f
nop
nop
and x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0xffffffff
nop
csrr x2, mngr2proc < 0xffffffff
nop
and x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0xffffffff
nop
nop
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
nop
csrr x2, mngr2proc < 0xffffffff
nop
nop
nop
and x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x80000000
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
nop
nop
csrr x2, mngr2proc < 0x80000000
nop
and x3, x1, x2
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0xffffffff
and x3, x1, x2
csrw proc2mngr, x3 > 0x7fffffff
csrr x1, mngr2proc < 0x7fffffff
nop
csrr x2, mngr2proc < 0x0
nop
and x3, x1, x2
nop
csrw proc2mngr, x3 > 0x0
nop
nop
nop
