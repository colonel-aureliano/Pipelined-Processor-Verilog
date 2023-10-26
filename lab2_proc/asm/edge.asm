csrr x1, mngr2proc < 0x1 
bne x1, x0, skip

backtrack: 
csrr x2, mngr2proc < 0x10
bne x1, x0, end
nop

skip:
bne x1, x0, backtrack
nop

end:
csrw proc2mngr, x2 > 0x10