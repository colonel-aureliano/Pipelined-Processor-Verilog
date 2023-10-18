
csrr x3, mngr2proc < 0x208
csrr x4, mngr2proc < 0x208
csrr x5, mngr2proc < 0x209
xor x5, x5, x5
beq x3, x4, 16
addi x5, x0, 1
addi x3, x0, 4
beq x3, x4, 4
beq x3, x4, -8

csrw proc2mngr, x5 > 0
csrw proc2mngr, x3 > 4