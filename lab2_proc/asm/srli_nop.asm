csrr x1, mngr2proc < 0x0
nop
nop
nop
srli x3, x1, 0x0
nop
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0x1
nop
srli x3, x1, 0x1
nop
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0x20
nop
srli x3, x1, 0x3
nop
nop
csrw proc2mngr, x3 > 0x4
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
nop
srli x3, x1, 0x1f
nop
nop
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
nop
nop
nop
srli x3, x1, 0x1f
csrw proc2mngr, x3 > 0x1
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
srli x3, x1, 0x1f
nop
csrw proc2mngr, x3 > 0x1
nop
nop
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
srli x3, x1, 0x1f
nop
csrw proc2mngr, x3 > 0x1
nop
nop
nop
csrr x1, mngr2proc < 0x20
nop
nop
srli x3, x1, 0x1
nop
csrw proc2mngr, x3 > 0x10
nop
csrr x1, mngr2proc < 0x2
srli x3, x1, 0x1
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000001
srli x3, x1, 0x2
nop
csrw proc2mngr, x3 > 0x20000000
nop
csrr x1, mngr2proc < 0x7fffffff
srli x3, x1, 0x1e
nop
nop
csrw proc2mngr, x3 > 0x1
nop
nop
