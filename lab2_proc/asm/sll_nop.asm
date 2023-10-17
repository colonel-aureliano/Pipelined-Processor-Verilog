csrr x1, mngr2proc < 0x0
nop
nop
nop
csrr x2, mngr2proc < 0x0
nop
sll x3, x1, x2
nop
nop
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
sll x3, x1, x2
csrw proc2mngr, x3 > 0x2
nop
csrr x1, mngr2proc < 0x4
csrr x2, mngr2proc < 0x3
sll x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x20
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
csrr x2, mngr2proc < 0x1f
nop
nop
nop
sll x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x80000000
nop
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
csrr x2, mngr2proc < 0x1
nop
nop
sll x3, x1, x2
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
csrr x2, mngr2proc < 0xffffffff
nop
sll x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x80000000
csrr x1, mngr2proc < 0x80000000
nop
nop
csrr x2, mngr2proc < 0xffffffff
nop
nop
nop
sll x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x20
nop
nop
nop
csrr x2, mngr2proc < 0x80000001
sll x3, x1, x2
nop
csrw proc2mngr, x3 > 0x40
nop
csrr x1, mngr2proc < 0x2
nop
nop
csrr x2, mngr2proc < 0x1
nop
nop
sll x3, x1, x2
csrw proc2mngr, x3 > 0x4
nop
nop
nop
csrr x1, mngr2proc < 0x80000001
nop
nop
nop
csrr x2, mngr2proc < 0x2
nop
sll x3, x1, x2
csrw proc2mngr, x3 > 0x4
nop
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
nop
csrr x2, mngr2proc < 0x1
sll x3, x1, x2
csrw proc2mngr, x3 > 0xfffffffe
nop
