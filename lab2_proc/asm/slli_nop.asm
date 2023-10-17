csrr x1, mngr2proc < 0x0
nop
nop
nop
slli x3, x1, 0x0
nop
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0x1
nop
nop
slli x3, x1, 0x1
nop
nop
csrw proc2mngr, x3 > 0x2
nop
nop
csrr x1, mngr2proc < 0x4
slli x3, x1, 0x3
nop
csrw proc2mngr, x3 > 0x20
csrr x1, mngr2proc < 0xffffffff
nop
nop
slli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x80000000
nop
nop
csrr x1, mngr2proc < 0x80000000
slli x3, x1, 0x1
nop
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0xffffffff
slli x3, x1, 0x1f
nop
csrw proc2mngr, x3 > 0x80000000
nop
csrr x1, mngr2proc < 0x80000000
slli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0x20
nop
slli x3, x1, 0x1
nop
nop
nop
csrw proc2mngr, x3 > 0x40
nop
nop
nop
csrr x1, mngr2proc < 0x2
nop
slli x3, x1, 0x1
nop
nop
csrw proc2mngr, x3 > 0x4
nop
nop
nop
csrr x1, mngr2proc < 0x80000001
nop
nop
nop
slli x3, x1, 0x2
nop
nop
csrw proc2mngr, x3 > 0x4
nop
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
nop
nop
slli x3, x1, 0x1
nop
csrw proc2mngr, x3 > 0xfffffffe
nop
nop
