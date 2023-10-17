csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x0
nop
sra x3, x1, x2
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0x1
nop
nop
csrr x2, mngr2proc < 0x1
nop
nop
sra x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0x20
csrr x2, mngr2proc < 0x3
nop
nop
sra x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x4
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
csrr x2, mngr2proc < 0x1f
nop
sra x3, x1, x2
nop
csrw proc2mngr, x3 > 0xffffffff
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
nop
csrr x2, mngr2proc < 0x1f
nop
sra x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0xffffffff
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
csrr x2, mngr2proc < 0xffffffff
nop
nop
nop
sra x3, x1, x2
csrw proc2mngr, x3 > 0xffffffff
nop
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
csrr x2, mngr2proc < 0xffffffff
nop
sra x3, x1, x2
csrw proc2mngr, x3 > 0xffffffff
nop
csrr x1, mngr2proc < 0x20
csrr x2, mngr2proc < 0x80000000
nop
sra x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x20
csrr x1, mngr2proc < 0x2
nop
nop
csrr x2, mngr2proc < 0x1
nop
nop
sra x3, x1, x2
csrw proc2mngr, x3 > 0x1
nop
csrr x1, mngr2proc < 0x8
nop
nop
nop
csrr x2, mngr2proc < 0x2
nop
nop
sra x3, x1, x2
nop
csrw proc2mngr, x3 > 0x2
nop
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
csrr x2, mngr2proc < 0x1f
nop
nop
sra x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x0
