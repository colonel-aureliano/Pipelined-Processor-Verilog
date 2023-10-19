addi x2, x0, 0x208  # 200
addi x3, x0, 31     # 204
jalr x0, x2, 8      # 208 
addi x3, x0, 10
xor x1, x1, x1
lui x1, 0x0002
sw x3,  label_a(x1)

   .data
   label_a:
   .word 5000