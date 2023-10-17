csrr x1, mngr2proc < 0x0
nop
nop
sltiu x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x1
nop
nop
nop
sltiu x3, x1, 0x1
nop
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0x1
sltiu x3, x1, 0x0
nop
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0x1
nop
nop
sltiu x3, x1, 0x2
nop
nop
csrw proc2mngr, x3 > 0x1
nop
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
nop
sltiu x3, x1, 0xfff
csrw proc2mngr, x3 > 0x1
nop
csrr x1, mngr2proc < 0x7fffffff
sltiu x3, x1, 0x7ff
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
sltiu x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
sltiu x3, x1, 0x7ff
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
sltiu x3, x1, 0xfff
nop
nop
nop
csrw proc2mngr, x3 > 0x1
nop
nop
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
sltiu x3, x1, 0x1
nop
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
