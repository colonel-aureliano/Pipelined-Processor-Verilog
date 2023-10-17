csrr x1, mngr2proc < 0x0
nop
nop
nop
csrr x2, mngr2proc < 0x0
nop
nop
mul x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
nop
nop
nop
csrr x2, mngr2proc < 0x1
nop
mul x3, x1, x2
csrw proc2mngr, x3 > 0x1
nop
nop
nop
csrr x1, mngr2proc < 0x1
nop
nop
csrr x2, mngr2proc < 0x0
mul x3, x1, x2
nop
csrw proc2mngr, x3 > 0x0
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x0
nop
nop
mul x3, x1, x2
nop
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x80000000
nop
nop
csrr x2, mngr2proc < 0x1f
mul x3, x1, x2
nop
csrw proc2mngr, x3 > 0x80000000
nop
nop
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
csrr x2, mngr2proc < 0x2
nop
nop
nop
mul x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0xfffffffe
nop
csrr x1, mngr2proc < 0xffffffff
nop
nop
nop
csrr x2, mngr2proc < 0x38
mul x3, x1, x2
nop
csrw proc2mngr, x3 > 0xffffffc8
nop
nop
csrr x1, mngr2proc < 0x28
nop
nop
csrr x2, mngr2proc < 0x28
nop
nop
mul x3, x1, x2
nop
nop
csrw proc2mngr, x3 > 0x640
nop
csrr x1, mngr2proc < 0x7fffffff
nop
csrr x2, mngr2proc < 0x4
nop
nop
mul x3, x1, x2
nop
csrw proc2mngr, x3 > 0xfffffffc
nop
nop
csrr x1, mngr2proc < 0x80000001
nop
nop
nop
csrr x2, mngr2proc < 0x2
nop
nop
mul x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x2
csrr x1, mngr2proc < 0x7fffffff
nop
nop
csrr x2, mngr2proc < 0xffffffff
mul x3, x1, x2
nop
nop
nop
csrw proc2mngr, x3 > 0x80000001
csrr x1, mngr2proc < 0xffffffff
nop
nop
csrr x2, mngr2proc < 0x80000000
mul x3, x1, x2
csrw proc2mngr, x3 > 0x80000000
nop
nop
csrr x1, mngr2proc < 0x7fffffff
nop
nop
csrr x2, mngr2proc < 0x80000000
mul x3, x1, x2
nop
csrw proc2mngr, x3 > 0x80000000
nop
nop
nop
