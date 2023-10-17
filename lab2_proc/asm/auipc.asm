auipc x3, 0x0
csrw proc2mngr, x3 > 0x200
auipc x3, 0x1
csrw proc2mngr, x3 > 0x1208
auipc x3, 0xfffff
csrw proc2mngr, x3 > 0xfffff210
auipc x3, 0x80000
csrw proc2mngr, x3 > 0x80000218
auipc x3, 0x7ffff
csrw proc2mngr, x3 > 0x7ffff220
auipc x3, 0x2
csrw proc2mngr, x3 > 0x2228
