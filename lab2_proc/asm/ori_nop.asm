csrr x1, mngr2proc < 0x0
nop
ori x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x0
nop
ori x3, x1, 0x1
nop
nop
nop
csrw proc2mngr, x3 > 0x1
nop
csrr x1, mngr2proc < 0x1
nop
nop
nop
ori x3, x1, 0x2
nop
csrw proc2mngr, x3 > 0x3
nop
nop
csrr x1, mngr2proc < 0x7fffffff
ori x3, x1, 0xfff
nop
nop
nop
csrw proc2mngr, x3 > 0xffffffff
nop
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
ori x3, x1, 0x0
nop
nop
nop
csrw proc2mngr, x3 > 0x7fffffff
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
ori x3, x1, 0x0
nop
nop
nop
csrw proc2mngr, x3 > 0xffffffff
csrr x1, mngr2proc < 0x80000000
ori x3, x1, 0x1
nop
nop
nop
csrw proc2mngr, x3 > 0x80000001
nop
nop
nop
