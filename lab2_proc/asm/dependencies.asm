csrr x1, mngr2proc < 0x2000
addi x3, x0, 4
sw x3, 0(x1)
addi x4, x3, 4
lw x5, 0(x1)
addi x4, x4, -4
add x6, x4, x5
csrw proc2mngr, x3 > 4
csrw proc2mngr, x4 > 4
csrw proc2mngr, x5 > 4
csrw proc2mngr, x6 > 8