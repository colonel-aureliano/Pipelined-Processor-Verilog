addi x1, x0, 4000
addi x2, x0, 2839
addi x3, x0, 1839
addi x4, x0, 4047
addi x5, x0, 1638
beq x1, x1, 4
beq x4, x3, 20
srli x3, x2, 16
ori x2, x1, 1213
bne x1, x3, 12
addi x3, x4, 1165
addi x2, x5, 483
add x2, x3, x1
and x5, x5, x2
sub x4, x5, x2
jal x1, 12
slli x4, x4, 23
sll x2, x1, x1
xori x1, x2, 587
sltiu x2, x2, 3814
sltu x5, x1, x2
jal x3, 12
jal x2, 12
bltu x2, x1, 16
addi x1, x2, 2949
lui x1, 0x0002
sw x2, 0(x1)
sw x3, 4(x1)
sw x4, 8(x1)
sw x5, 12(x1)
