jal x3, 8
nop
csrw proc2mngr, x3 > 0x204
csrr x1, mngr2proc < 0x20c
jalr x3, x1, 8
csrw proc2mngr, x3 > 0x214
jal x3, 16
nop
nop
nop
csrw proc2mngr, x3 > 0x21c
csrr x1, mngr2proc < 0x214
jalr x3, x1, 8
csrw proc2mngr, x3 > 0x234
