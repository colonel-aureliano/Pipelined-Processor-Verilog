auipc x3, 0x0
csrw proc2mngr, x3 > 0x200
nop
nop
nop
auipc x3, 0x1
csrw proc2mngr, x3 > 0x1214
nop
nop
nop
auipc x3, 0xfffff
csrw proc2mngr, x3 > 0xfffff228
nop
nop
nop
auipc x3, 0x80000
csrw proc2mngr, x3 > 0x8000023c
auipc x3, 0x7ffff
csrw proc2mngr, x3 > 0x7ffff244
nop
nop
nop
auipc x3, 0x2
csrw proc2mngr, x3 > 0x2258
