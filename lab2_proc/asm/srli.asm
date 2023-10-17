csrr x1, mngr2proc < 0x0
srli x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
srli x3, x1, 0x1
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x20
srli x3, x1, 0x3
csrw proc2mngr, x3 > 0x4
csrr x1, mngr2proc < 0xffffffff
srli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
srli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0xffffffff
srli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
srli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x20
srli x3, x1, 0x1
csrw proc2mngr, x3 > 0x10
csrr x1, mngr2proc < 0x2
srli x3, x1, 0x1
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000001
srli x3, x1, 0x2
csrw proc2mngr, x3 > 0x20000000
csrr x1, mngr2proc < 0x7fffffff
srli x3, x1, 0x1e
csrw proc2mngr, x3 > 0x1
