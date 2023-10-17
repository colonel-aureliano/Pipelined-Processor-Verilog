csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x0
sll x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
csrr x2, mngr2proc < 0x1
sll x3, x1, x2
csrw proc2mngr, x3 > 0x2
csrr x1, mngr2proc < 0x4
csrr x2, mngr2proc < 0x3
sll x3, x1, x2
csrw proc2mngr, x3 > 0x20
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x1f
sll x3, x1, x2
csrw proc2mngr, x3 > 0x80000000
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0x1
sll x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0xffffffff
sll x3, x1, x2
csrw proc2mngr, x3 > 0x80000000
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0xffffffff
sll x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x20
csrr x2, mngr2proc < 0x80000001
sll x3, x1, x2
csrw proc2mngr, x3 > 0x40
csrr x1, mngr2proc < 0x2
csrr x2, mngr2proc < 0x1
sll x3, x1, x2
csrw proc2mngr, x3 > 0x4
csrr x1, mngr2proc < 0x80000001
csrr x2, mngr2proc < 0x2
sll x3, x1, x2
csrw proc2mngr, x3 > 0x4
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0x1
sll x3, x1, x2
csrw proc2mngr, x3 > 0xfffffffe
