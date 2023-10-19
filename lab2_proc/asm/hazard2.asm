addi x1, x0, 3447
addi x2, x0, 2865
addi x3, x0, 1721
addi x4, x0, 3123
addi x5, x0, 89
mul x3, x4, x3
slli x1, x3, 29
or x1, x1, x3
add x4, x2, x4
or x1, x2, x1
sub x3, x1, x2
sub x2, x4, x2
lui x3, 462534
xor x4, x5, x4
srl x2, x1, x1
xori x5, x1, 31
sll x5, x1, x4
auipc x5, 544798
lui x3, 669330
slti x1, x4, 2593
ori x3, x5, 1596
sltiu x3, x1, 69
sra x5, x3, x4
or x5, x4, x4
mul x1, x4, x2
lui x1, 0x0002
sw x2, 0(x1)
sw x3, 4(x1)
sw x4, 8(x1)
sw x5, 12(x1)
