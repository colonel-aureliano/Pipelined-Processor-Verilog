lui x3, 0x0
csrw proc2mngr, x3 > 0x0
lui x3, 0x1
csrw proc2mngr, x3 > 0x1000
lui x3, 0xfffff
nop
csrw proc2mngr, x3 > 0xfffff000
lui x3, 0x80000
csrw proc2mngr, x3 > 0x80000000
lui x3, 0x7ffff
csrw proc2mngr, x3 > 0x7ffff000
lui x3, 0x2
csrw proc2mngr, x3 > 0x2000
