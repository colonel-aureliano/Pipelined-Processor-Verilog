
   xor x1, x1, x1
   xori x1, x1, 0x0200

   add x3, x1, x1
   addi x1, x0, 0xfff
   addi x2, x0, 1
   add x4, x2, x1
   add x5, x1, x4
   addi x1, x0, 0x7ff
   add x6, x0, x1

   xor x1, x1, x1
   #Loading Data section
   lui x1, 0x0002
   sw x3,  0(x1)
   sw x4,  4(x1)
   sw x5,  8(x1)
   sw x6,  12(x1)

   #data section
   .data
   label_a:
   .word 5000
   .word 5000
   .word 5000
   .word 5000

