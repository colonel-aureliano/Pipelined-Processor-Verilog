csrr x1, mngr2proc < 0x0
nop
nop
srai x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
nop
nop
srai x3, x1, 0x1
nop
nop
nop
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x20
srai x3, x1, 0x3
nop
nop
nop
csrw proc2mngr, x3 > 0x4
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
srai x3, x1, 0x1f
nop
nop
csrw proc2mngr, x3 > 0xffffffff
nop
csrr x1, mngr2proc < 0x80000000
nop
srai x3, x1, 0x1f
nop
nop
csrw proc2mngr, x3 > 0xffffffff
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
nop
srai x3, x1, 0x1f
nop
nop
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x80000000
nop
nop
srai x3, x1, 0x1f
nop
nop
nop
csrw proc2mngr, x3 > 0xffffffff
nop
nop
csrr x1, mngr2proc < 0x20
nop
srai x3, x1, 0x0
csrw proc2mngr, x3 > 0x20
nop
csrr x1, mngr2proc < 0x2
nop
nop
srai x3, x1, 0x1
nop
nop
csrw proc2mngr, x3 > 0x1
nop
csrr x1, mngr2proc < 0x8
nop
nop
srai x3, x1, 0x2
nop
csrw proc2mngr, x3 > 0x2
csrr x1, mngr2proc < 0x7fffffff
nop
nop
nop
srai x3, x1, 0x1f
csrw proc2mngr, x3 > 0x0
