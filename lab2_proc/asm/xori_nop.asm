csrr x1, mngr2proc < 0x0
xori x3, x1, 0x0
nop
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0x1
nop
nop
xori x3, x1, 0x1
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0x1
nop
xori x3, x1, 0x0
csrw proc2mngr, x3 > 0x1
nop
csrr x1, mngr2proc < 0x1
nop
nop
xori x3, x1, 0x2
nop
csrw proc2mngr, x3 > 0x3
nop
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
xori x3, x1, 0xfff
csrw proc2mngr, x3 > 0x80000000
nop
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
nop
nop
xori x3, x1, 0x0
csrw proc2mngr, x3 > 0x7fffffff
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
nop
xori x3, x1, 0xf
nop
csrw proc2mngr, x3 > 0xfffffff0
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
xori x3, x1, 0xfff
nop
csrw proc2mngr, x3 > 0x0
nop
