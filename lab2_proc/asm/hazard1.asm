addi x1, x0, 260
addi x2, x0, 3250
addi x3, x0, 3422
addi x4, x0, 3509
addi x5, x0, 2031
andi x5, x4, 3567
lui x5, 610674
addi x1, x3, 1390
sra x1, x4, x1
srl x5, x1, x5
or x3, x4, x4
slli x4, x1, 18
auipc x3, 721744
auipc x1, 523192
sub x5, x1, x4
auipc x5, 136559
andi x4, x4, 1913
and x5, x5, x5
or x3, x4, x2
xor x2, x2, x2
auipc x4, 368841
xori x4, x5, 1985
mul x3, x3, x3
andi x5, x2, 3857
xori x5, x1, 4042
srai x1, x2, 15
or x4, x1, x1
ori x1, x5, 1084
slt x2, x4, x5
mul x2, x2, x2
addi x2, x2, 3945
sltiu x1, x1, 3021
or x5, x3, x4
xori x1, x5, 507
srli x5, x1, 23
lui x1, 0x0002
sw x2, 0(x1)
sw x3, 4(x1)
sw x4, 8(x1)
sw x5, 12(x1)