addi x1, x0, 3145
addi x2, x0, 3221
addi x3, x0, 720
srli x1, x1, 15
sltiu x3, x2, 2441
xori x3, x2, 1269
andi x3, x1, 2044
xor x3, x2, x1
srli x3, x3, 11
slti x2, x3, 1101
mul x2, x3, x1
andi x2, x1, 1068
addi x2, x3, 401
sra x3, x2, x2
add x1, x3, x1
slli x3, x1, 30
mul x2, x3, x3
srli x1, x3, 1
slli x1, x2, 28
slli x1, x3, 5
mul x3, x3, x1
ori x2, x1, 2243
addi x1, x3, 2726
sltiu x3, x2, 2063
auipc x1, 662505
srai x2, x2, 0
ori x2, x1, 714
sub x1, x2, x2
slti x2, x2, 433
xor x1, x2, x1
slti x2, x3, 3311
slli x3, x2, 5
and x2, x3, x1
srli x3, x1, 4
andi x2, x2, 3649
srli x1, x1, 19
sra x3, x1, x2
add x3, x1, x2
slti x3, x1, 908
xor x2, x1, x1
slli x2, x2, 19
ori x2, x2, 968
sltiu x3, x3, 284
lui x1, 0x0002
sw x2, 0(x1)
sw x3, 4(x1)
