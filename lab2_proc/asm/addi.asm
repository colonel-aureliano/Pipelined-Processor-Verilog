
   xor x1, x1, x1
   xori x1, x1, 0x0200

   addi x3, x1, 0x0004
   addi x4, x0, 0xfff
   addi x5, x4, 1
   addi x6, x0, 0x7ff

   xor x1, x1, x1
   #Loading Data section
   lui x1, 0x0002
   # label_a is 0x000, it's true location is 0x0002000 
   # but sw only takes lower 12-bits
   sw x3,  label_a(x1)
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
