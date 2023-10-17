
csrr x1, mngr2proc < 5
csrr x2, mngr2proc < 4
add x3, x1, x2
csrw proc2mngr, x3 > 9
csrr x4, mngr2proc < 1
csrr x6, mngr2proc < 0x7fffffff
add x6, x6, x4
csrw proc2mngr, x6 > 0x80000000
add x6, x6, x4
csrw proc2mngr, x6 > 0x80000001

csrr x1, mngr2proc < 0xffffffff
csrr x2, mngr2proc < 1
add x3, x1, x2
csrw proc2mngr, x3 > 0

csrr x1, mngr2proc < 0
csrr x2, mngr2proc < 0
add x3, x1, x2
csrw proc2mngr, x3 > 0

csrr x1, mngr2proc < 0
csrr x2, mngr2proc < 0xffffffff
add x3, x1, x2
csrw proc2mngr, x3 > 0xffffffff