jal x3, 8
nop
csrw proc2mngr, x3 > 0x204
xor x4, x4, x4
jal x3, 8
addi x4, x0, 1
csrw proc2mngr, x4 > 0
csrw proc2mngr, x3 > 0x214