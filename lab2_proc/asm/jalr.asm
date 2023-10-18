addi x1, x0, 0x200
jalr x3, x1, 8
nop
csrw proc2mngr, x3 > 0x208
xor x4, x4, x4
addi x1, x1, 24
jalr x3, x1, 8
addi x4, x0, 1
csrw proc2mngr, x4 > 0
csrw proc2mngr, x3 > 0x21c