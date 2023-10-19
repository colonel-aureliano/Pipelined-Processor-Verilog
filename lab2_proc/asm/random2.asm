addi x1, x0, 1889
addi x2, x0, 3529
addi x3, x0, 2929
addi x4, x0, 1525
addi x5, x0, 52
addi x6, x0, 811
addi x7, x0, 874
addi x8, x0, 3181
addi x9, x0, 3601
addi x10, x0, 1934
addi x11, x0, 2359
addi x12, x0, 3795
addi x13, x0, 3750
addi x14, x0, 1059
addi x15, x0, 1205
xori x6, x5, 3908
jal x1, 16
auipc x3, 966526
jal x7, 4
srai x8, x7, 9
srl x11, x11, x9
blt x11, x14, 0
ori x6, x15, 3821
jal x4, 4
mul x6, x8, x12
lui x10, 574288
sltu x10, x5, x12
auipc x14, 216155
lui x3, 999957
jal x15, 4
auipc x8, 800781
bgeu x12, x1, 20
add x5, x3, x15
bne x12, x15, 16
srl x9, x8, x11
lui x1, 0x2000
sw x2, 0(x1)
sw x3, 4(x1)
sw x4, 8(x1)
sw x5, 12(x1)
sw x6, 16(x1)
sw x7, 20(x1)
sw x8, 24(x1)
sw x9, 28(x1)
sw x10, 32(x1)
sw x11, 36(x1)
sw x12, 40(x1)
sw x13, 44(x1)
sw x14, 48(x1)
sw x15, 52(x1)
