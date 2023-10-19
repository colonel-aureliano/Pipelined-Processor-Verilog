# csrr x1, mngr2proc < 5
# addi x3, x1, 4
# csrw proc2mngr, x3 > 9
addi x2, x0, 1863
addi x3, x0, 2337
xor x1, x1, x1
xori x1, x1, 0x0200
xor x1, x1, x1
lui x1, 0x0002
sw x3,  label_a(x1)

   .data
   label_a:
   .word 5000