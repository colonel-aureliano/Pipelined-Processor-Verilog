csrr x1, mngr2proc < 0x0
nop
csrr x2, mngr2proc < 0x0
nop
nop
srl x3, x1, x2
nop
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0x1
nop
csrr x2, mngr2proc < 0x1
srl x3, x1, x2
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x20
nop
nop
csrr x2, mngr2proc < 0x3
nop
nop
nop
srl x3, x1, x2
nop
csrw proc2mngr, x3 > 0x4
csrr x1, mngr2proc < 0xffffffff
nop
csrr x2, mngr2proc < 0x1f
nop
srl x3, x1, x2
csrw proc2mngr, x3 > 0x1
nop
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0x1f
nop
srl x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x1
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
csrr x2, mngr2proc < 0xffffffff
srl x3, x1, x2
csrw proc2mngr, x3 > 0x1
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
srl x3, x1, x2
csrw proc2mngr, x3 > 0x1
nop
csrr x1, mngr2proc < 0x20
csrr x2, mngr2proc < 0x80000001
srl x3, x1, x2
nop
csrw proc2mngr, x3 > 0x10
csrr x1, mngr2proc < 0x2
nop
csrr x2, mngr2proc < 0x1
srl x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000001
nop
nop
nop
csrr x2, mngr2proc < 0x2
nop
srl x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x20000000
nop
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
csrr x2, mngr2proc < 0x1e
nop
nop
nop
srl x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x1
nop
nop
