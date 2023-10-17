csrr x1, mngr2proc < 0x0
nop
nop
andi x3, x1, 0x0
nop
nop
nop
csrw proc2mngr, x3 > 0x0
nop
csrr x1, mngr2proc < 0x1
andi x3, x1, 0x1
nop
nop
csrw proc2mngr, x3 > 0x1
nop
csrr x1, mngr2proc < 0x2
andi x3, x1, 0x3
nop
nop
csrw proc2mngr, x3 > 0x2
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
nop
andi x3, x1, 0x3
nop
nop
csrw proc2mngr, x3 > 0x3
nop
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
nop
andi x3, x1, 0x1
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
andi x3, x1, 0xfff
csrw proc2mngr, x3 > 0xffffffff
nop
csrr x1, mngr2proc < 0x80000000
nop
nop
nop
andi x3, x1, 0xfff
nop
nop
nop
csrw proc2mngr, x3 > 0x80000000
nop
nop
nop
csrr x1, mngr2proc < 0x2
nop
nop
nop
andi x3, x1, 0x1
nop
nop
nop
csrw proc2mngr, x3 > 0x0
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
andi x3, x1, 0x7ff
nop
nop
csrw proc2mngr, x3 > 0x7ff
nop
nop
nop
csrr x1, mngr2proc < 0x80000001
nop
nop
nop
andi x3, x1, 0x7ff
nop
csrw proc2mngr, x3 > 0x1
nop
