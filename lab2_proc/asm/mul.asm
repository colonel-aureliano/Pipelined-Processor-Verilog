csrr x1, mngr2proc < 0x0
csrr x2, mngr2proc < 0x0
mul x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x1
csrr x2, mngr2proc < 0x1
mul x3, x1, x2
csrw proc2mngr, x3 > 0x1
csrr x1, mngr2proc < 0x1
csrr x2, mngr2proc < 0x0
mul x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x0
mul x3, x1, x2
csrw proc2mngr, x3 > 0x0
csrr x1, mngr2proc < 0x80000000
csrr x2, mngr2proc < 0x1f
mul x3, x1, x2
csrw proc2mngr, x3 > 0x80000000
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x2
mul x3, x1, x2
csrw proc2mngr, x3 > 0xfffffffe
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x38
mul x3, x1, x2
csrw proc2mngr, x3 > 0xffffffc8
csrr x1, mngr2proc < 0x28
csrr x2, mngr2proc < 0x28
mul x3, x1, x2
csrw proc2mngr, x3 > 0x640
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0x4
mul x3, x1, x2
csrw proc2mngr, x3 > 0xfffffffc
csrr x1, mngr2proc < 0x80000001
csrr x2, mngr2proc < 0x2
mul x3, x1, x2
csrw proc2mngr, x3 > 0x2
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0xffffffff
mul x3, x1, x2
csrw proc2mngr, x3 > 0x80000001
csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 0x80000000
mul x3, x1, x2
csrw proc2mngr, x3 > 0x80000000
csrr x1, mngr2proc < 0x7fffffff
csrr x2, mngr2proc < 0x80000000
mul x3, x1, x2
csrw proc2mngr, x3 > 0x80000000
