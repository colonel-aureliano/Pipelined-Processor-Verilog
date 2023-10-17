csrr x1, mngr2proc < 0x0
nop
nop
nop
slti x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
nop
slti x3, x1, 0x1
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x1
slti x3, x1, 0x0
nop
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0x1
nop
slti x3, x1, 0x2
nop
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x7fffffff
nop
nop
slti x3, x1, 0xfff
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x7fffffff
nop
nop
nop
slti x3, x1, 0x0
nop
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
nop
slti x3, x1, 0xfff
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0xffffffff
nop
slti x3, x1, 0x7ff
nop
nop
nop
csrw proc2mngr, x3 > 0x1
nop
nop
nop
csrr x1, mngr2proc < 0x80000000
nop
slti x3, x1, 0x0
nop
nop
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
nop
slti x3, x1, 0xfff
csrw proc2mngr, x3 > 0x1
