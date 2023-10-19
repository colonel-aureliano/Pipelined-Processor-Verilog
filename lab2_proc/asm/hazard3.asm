addi x1, x0, 597
addi x2, x0, 3089
addi x3, x0, 737
addi x4, x0, 199
addi x5, x0, 152
auipc x3, 367887
sll x4, x1, x1
sll x4, x1, x2
and x5, x4, x1
xori x5, x5, 23
and x2, x1, x5
sll x1, x1, x5
add x1, x1, x2
lui x4, 884836
add x2, x1, x2
srli x2, x1, 15
addi x3, x4, 456
sll x3, x5, x3
slti x2, x2, 674
addi x3, x2, 764
add x3, x5, x5
slti x3, x1, 960
xori x5, x5, 3300
slli x4, x1, 24
auipc x3, 306014
lui x1, 0x0002
sw x2, 0(x1)
sw x3, 4(x1)
sw x4, 8(x1)
sw x5, 12(x1)
