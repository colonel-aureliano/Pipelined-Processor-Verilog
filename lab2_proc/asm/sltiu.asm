csrr x1, mngr2proc < 0x0
sltiu x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
sltiu x3, x1, 0x1
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
sltiu x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
sltiu x3, x1, 0x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x7fffffff
sltiu x3, x1, 0xfff
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x7fffffff
sltiu x3, x1, 0x7ff
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
sltiu x3, x1, 0x0
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
sltiu x3, x1, 0x7ff
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x80000000
sltiu x3, x1, 0xfff
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x80000000
sltiu x3, x1, 0x1
csrw proc2mngr, x3 > 0x0
