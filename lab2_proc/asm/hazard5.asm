addi x1, x0, 1100
addi x2, x0, 3089
addi x3, x0, 3908
addi x4, x0, 897
addi x5, x0, 2155
slli x2, x2, 0
xor x4, x3, x1
srli x1, x1, 30
addi x5, x5, 1894
auipc x5, 734048
lui x5, 875779
srai x2, x5, 2
slti x1, x4, 3200
sltiu x2, x4, 1805
slt x3, x1, x4
auipc x1, 11415
xori x5, x4, 1036
addi x5, x5, 904
sra x2, x5, x4
sll x5, x5, x2
slli x5, x4, 20
xori x2, x4, 3695
sub x5, x4, x3
sltiu x1, x3, 3355
slti x2, x2, 706
lui x1, 0x0002
sw x2, 0(x1)
sw x3, 4(x1)
sw x4, 8(x1)
sw x5, 12(x1)
