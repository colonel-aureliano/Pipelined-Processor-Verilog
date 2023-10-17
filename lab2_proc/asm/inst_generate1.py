# A python script to generate asm file
# that targets specific instructions one by one
import random

# This file contains code that generate tests for
# register-register arithmetic instructions
# and register-immediate instructions

# register-register arithmetic instructions

def generate_rr(
    inst, reg1, reg2, init1, init2,
    expected, random_nop_insertion = False
):
  init1 = '0x{:x}'.format(init1)
  init2 = '0x{:x}'.format(init2)
  expected = '0x{:x}'.format(expected)
  high = 3 if random_nop_insertion else 0
  inst_asm_string = 'csrr {}, mngr2proc < {}\n'.format(reg1,init1)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  inst_asm_string += 'csrr {}, mngr2proc < {}\n'.format(reg2,init2)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  inst_asm_string += '{} x3, {}, {}\n'.format(inst,reg1,reg2)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  inst_asm_string += 'csrw proc2mngr, x3 > {}\n'.format(expected)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  return inst_asm_string

neg_one = 0xffffffff
largest = 0x7fffffff
smallest = 0x80000000

r1 = 'x1'
r2 = 'x2'

def and_generate(en_nop):
  i = 'and'
  s = generate_rr(i,r1,r2,0,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,1,1,en_nop)
  s += generate_rr(i,r1,r2,0b10,0b11,0b10,en_nop)
  s += generate_rr(i,r1,r2,neg_one,31,31,en_nop)
  s += generate_rr(i,r1,r2,smallest,31,0,en_nop)
  s += generate_rr(i,r1,r2,neg_one,neg_one,neg_one,en_nop)
  s += generate_rr(i,r1,r2,smallest,neg_one,smallest,en_nop)
  s += generate_rr(i,r1,r2,largest,smallest,0,en_nop)
  s += generate_rr(i,r1,r2,largest,neg_one,largest,en_nop)
  s += generate_rr(i,r1,r2,largest,0,0,en_nop)
  return s

def and_all():
  content = and_generate(False)
  file_path = "and.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = and_generate(True)
  file_path = "and_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# and_all()

def or_generate(en_nop):
  i = 'or'
  s = generate_rr(i,r1,r2,0,0,0,en_nop)
  s += generate_rr(i,r1,r2,0,1,1,en_nop)
  s += generate_rr(i,r1,r2,1,2,3,en_nop)
  s += generate_rr(i,r1,r2,largest,neg_one,neg_one,en_nop)
  s += generate_rr(i,r1,r2,largest,smallest,neg_one,en_nop)
  s += generate_rr(i,r1,r2,neg_one,smallest,neg_one,en_nop)
  s += generate_rr(i,r1,r2,0,smallest,smallest,en_nop)
  return s

def or_all():
  content = or_generate(False)
  file_path = "or.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = or_generate(True)
  file_path = "or_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# or_all()

def xor_generate(en_nop):
  i = 'xor'
  s = generate_rr(i,r1,r2,0,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,1,0,en_nop)
  s += generate_rr(i,r1,r2,1,0,1,en_nop)
  s += generate_rr(i,r1,r2,1,2,3,en_nop)
  s += generate_rr(i,r1,r2,largest,neg_one,smallest,en_nop)
  s += generate_rr(i,r1,r2,largest,smallest,neg_one,en_nop)
  s += generate_rr(i,r1,r2,neg_one,smallest,largest,en_nop)
  s += generate_rr(i,r1,r2,0,smallest,smallest,en_nop)
  return s

def xor_all():
  content = xor_generate(False)
  file_path = "xor.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = xor_generate(True)
  file_path = "xor_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# xor_all()

def slt_generate(en_nop):
  i = 'slt'
  s = generate_rr(i,r1,r2,0,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,1,0,en_nop)
  s += generate_rr(i,r1,r2,1,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,2,1,en_nop)
  s += generate_rr(i,r1,r2,largest,neg_one,0,en_nop)
  s += generate_rr(i,r1,r2,largest,smallest,0,en_nop)
  s += generate_rr(i,r1,r2,neg_one,smallest,0,en_nop)
  s += generate_rr(i,r1,r2,neg_one,largest,1,en_nop)
  s += generate_rr(i,r1,r2,smallest,largest,1,en_nop)
  s += generate_rr(i,r1,r2,smallest,neg_one,1,en_nop)
  return s

def slt_all():
  content = slt_generate(False)
  file_path = "slt.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = slt_generate(True)
  file_path = "slt_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# slt_all()

def sltu_generate(en_nop):
  i = 'sltu'
  s = generate_rr(i,r1,r2,0,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,1,0,en_nop)
  s += generate_rr(i,r1,r2,1,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,2,1,en_nop)
  s += generate_rr(i,r1,r2,largest,neg_one,1,en_nop)
  s += generate_rr(i,r1,r2,largest,smallest,1,en_nop)
  s += generate_rr(i,r1,r2,neg_one,smallest,0,en_nop)
  s += generate_rr(i,r1,r2,neg_one,largest,0,en_nop)
  s += generate_rr(i,r1,r2,smallest,largest,0,en_nop)
  s += generate_rr(i,r1,r2,smallest,neg_one,1,en_nop)
  return s

def sltu_all():
  content = sltu_generate(False)
  file_path = "sltu.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = sltu_generate(True)
  file_path = "sltu_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# sltu_all()

def sra_generate(en_nop):
  i = 'sra'
  s = generate_rr(i,r1,r2,0,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,1,0,en_nop)
  s += generate_rr(i,r1,r2,0b100000,0b11,0b100,en_nop)
  s += generate_rr(i,r1,r2,neg_one,0b11111,neg_one,en_nop)
  s += generate_rr(i,r1,r2,smallest,0b11111,neg_one,en_nop)
  s += generate_rr(i,r1,r2,neg_one,neg_one,neg_one,en_nop)
  s += generate_rr(i,r1,r2,smallest,neg_one,neg_one,en_nop)
  s += generate_rr(i,r1,r2,0x20,smallest,0x20,en_nop)
  s += generate_rr(i,r1,r2,0b10,1,1,en_nop)
  s += generate_rr(i,r1,r2,0b1000,2,2,en_nop)
  s += generate_rr(i,r1,r2,largest,31,0,en_nop)
  return s

def sra_all():
  content = sra_generate(False)
  file_path = "sra.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = sra_generate(True)
  file_path = "sra_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# sra_all()

def srl_generate(en_nop):
  i = 'srl'
  s = generate_rr(i,r1,r2,0,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,1,0,en_nop)
  s += generate_rr(i,r1,r2,0b100000,3,0b100,en_nop)
  s += generate_rr(i,r1,r2,neg_one,31,1,en_nop)
  s += generate_rr(i,r1,r2,smallest,31,1,en_nop)
  s += generate_rr(i,r1,r2,neg_one,neg_one,1,en_nop)
  s += generate_rr(i,r1,r2,smallest,neg_one,1,en_nop)
  s += generate_rr(i,r1,r2,0x20,0x80000001,0x10,en_nop)
  s += generate_rr(i,r1,r2,0b10,1,1,en_nop)
  s += generate_rr(i,r1,r2,0x80000001,2,0x20000000,en_nop)
  s += generate_rr(i,r1,r2,largest,30,1,en_nop)
  return s

def srl_all():
  content = srl_generate(False)
  file_path = "srl.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = srl_generate(True)
  file_path = "srl_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# srl_all()

def sll_generate(en_nop):
  i = 'sll'
  s = generate_rr(i,r1,r2,0,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,1,2,en_nop)
  s += generate_rr(i,r1,r2,0b100,3,0b100000,en_nop)
  s += generate_rr(i,r1,r2,neg_one,31,smallest,en_nop)
  s += generate_rr(i,r1,r2,smallest,1,0,en_nop)
  s += generate_rr(i,r1,r2,neg_one,neg_one,smallest,en_nop)
  s += generate_rr(i,r1,r2,smallest,neg_one,0,en_nop)
  s += generate_rr(i,r1,r2,0x20,0x80000001,0x40,en_nop)
  s += generate_rr(i,r1,r2,0b10,1,0b100,en_nop)
  s += generate_rr(i,r1,r2,0x80000001,2,0x00000004,en_nop)
  s += generate_rr(i,r1,r2,largest,1,0xfffffffe,en_nop)
  return s

def sll_all():
  content = sll_generate(False)
  file_path = "sll.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = sll_generate(True)
  file_path = "sll_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# sll_all()

def mul_generate(en_nop):
  i = 'mul'
  s = generate_rr(i,r1,r2,0,0,0,en_nop)
  s += generate_rr(i,r1,r2,1,1,1,en_nop)
  s += generate_rr(i,r1,r2,1,0,0,en_nop)
  s += generate_rr(i,r1,r2,neg_one,0,0,en_nop)
  s += generate_rr(i,r1,r2,smallest,31,smallest,en_nop)
  s += generate_rr(i,r1,r2,neg_one,2,0xfffffffe,en_nop)
  s += generate_rr(i,r1,r2,neg_one,56,0xffffffc8,en_nop)
  s += generate_rr(i,r1,r2,40,40,1600,en_nop)
  s += generate_rr(i,r1,r2,largest,4,0xfffffffc,en_nop)
  s += generate_rr(i,r1,r2,0x80000001,2,2,en_nop)
  s += generate_rr(i,r1,r2,largest,neg_one,0x80000001,en_nop)
  s += generate_rr(i,r1,r2,neg_one,smallest,smallest,en_nop)
  s += generate_rr(i,r1,r2,largest,smallest,smallest,en_nop)
  return s

def mul_all():
  content = mul_generate(False)
  file_path = "mul.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = mul_generate(True)
  file_path = "mul_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# mul_all()

# register-immediate instructions

def generate_rimm(
    inst, reg1, init1, imm,
    expected, random_nop_insertion = False
):
  init1 = '0x{:x}'.format(init1)
  imm = '0x{:x}'.format(imm)
  expected = '0x{:x}'.format(expected)
  high = 3 if random_nop_insertion else 0
  inst_asm_string = 'csrr {}, mngr2proc < {}\n'.format(reg1,init1)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  inst_asm_string += '{} x3, {}, {}\n'.format(inst,reg1,imm)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  inst_asm_string += 'csrw proc2mngr, x3 > {}\n'.format(expected)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  return inst_asm_string

def andi_generate(en_nop):
  i = 'andi'
  s = generate_rimm(i,r1,0,0,0,en_nop)
  s += generate_rimm(i,r1,1,1,1,en_nop)
  s += generate_rimm(i,r1,0b10,0b11,0b10,en_nop)
  s += generate_rimm(i,r1,neg_one,0b11,0b11,en_nop)
  s += generate_rimm(i,r1,smallest,1,0,en_nop)
  s += generate_rimm(i,r1,neg_one,0xfff,neg_one,en_nop)
  s += generate_rimm(i,r1,smallest,0xfff,smallest,en_nop)
  s += generate_rimm(i,r1,0b10,0b1,0,en_nop)
  s += generate_rimm(i,r1,neg_one,0x7ff,0x7ff,en_nop)
  s += generate_rimm(i,r1,0x80000001,0x7ff,1,en_nop)
  return s

def andi_all():
  content = andi_generate(False)
  file_path = "andi.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = andi_generate(True)
  file_path = "andi_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# andi_all()

def ori_generate(en_nop):
  i = 'ori'
  s = generate_rimm(i,r1,0,0,0,en_nop)
  s += generate_rimm(i,r1,0,1,1,en_nop)
  s += generate_rimm(i,r1,1,2,3,en_nop)
  s += generate_rimm(i,r1,largest,0xfff,neg_one,en_nop)
  s += generate_rimm(i,r1,largest,0,largest,en_nop)
  s += generate_rimm(i,r1,neg_one,0,neg_one,en_nop)
  s += generate_rimm(i,r1,smallest,1,0x80000001,en_nop)
  return s

def ori_all():
  content = ori_generate(False)
  file_path = "ori.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = ori_generate(True)
  file_path = "ori_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# ori_all()

def xori_generate(en_nop):
  i = 'xori'
  s = generate_rimm(i,r1,0,0,0,en_nop)
  s += generate_rimm(i,r1,1,1,0,en_nop)
  s += generate_rimm(i,r1,1,0,1,en_nop)
  s += generate_rimm(i,r1,1,2,3,en_nop)
  s += generate_rimm(i,r1,largest,0xfff,smallest,en_nop)
  s += generate_rimm(i,r1,largest,0,largest,en_nop)
  s += generate_rimm(i,r1,neg_one,0xf,0xfffffff0,en_nop)
  s += generate_rimm(i,r1,neg_one,0xfff,0,en_nop)
  return s

def xori_all():
  content = xori_generate(False)
  file_path = "xori.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = xori_generate(True)
  file_path = "xori_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

xori_all()

def slti_generate(en_nop):
  i = 'slti'
  s = generate_rimm(i,r1,0,0,0,en_nop)
  s += generate_rimm(i,r1,1,1,0,en_nop)
  s += generate_rimm(i,r1,1,0,0,en_nop)
  s += generate_rimm(i,r1,1,2,1,en_nop)
  s += generate_rimm(i,r1,largest,0xfff,0,en_nop)
  s += generate_rimm(i,r1,largest,0,0,en_nop)
  s += generate_rimm(i,r1,neg_one,0xfff,0,en_nop)
  s += generate_rimm(i,r1,neg_one,0x7ff,1,en_nop)
  s += generate_rimm(i,r1,smallest,0,1,en_nop)
  s += generate_rimm(i,r1,smallest,0xfff,1,en_nop)
  return s

def slti_all():
  content = slti_generate(False)
  file_path = "slti.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = slti_generate(True)
  file_path = "slti_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# slti_all()

def sltiu_generate(en_nop):
  i = 'sltiu'
  s = generate_rimm(i,r1,0,0,0,en_nop)
  s += generate_rimm(i,r1,1,1,0,en_nop)
  s += generate_rimm(i,r1,1,0,0,en_nop)
  s += generate_rimm(i,r1,1,2,1,en_nop)
  s += generate_rimm(i,r1,largest,0xfff,1,en_nop)
  s += generate_rimm(i,r1,largest,0x7ff,0,en_nop)
  s += generate_rimm(i,r1,neg_one,0,0,en_nop)
  s += generate_rimm(i,r1,neg_one,0x7ff,0,en_nop)
  s += generate_rimm(i,r1,smallest,0xfff,1,en_nop)
  s += generate_rimm(i,r1,smallest,1,0,en_nop)
  return s

def sltiu_all():
  content = sltiu_generate(False)
  file_path = "sltiu.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = sltiu_generate(True)
  file_path = "sltiu_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# sltiu_all()

def srai_generate(en_nop):
  i = 'srai'
  s = generate_rimm(i,r1,0,0,0,en_nop)
  s += generate_rimm(i,r1,1,1,0,en_nop)
  s += generate_rimm(i,r1,0b100000,0b11,0b100,en_nop)
  s += generate_rimm(i,r1,neg_one,0b11111,neg_one,en_nop)
  s += generate_rimm(i,r1,smallest,0b11111,neg_one,en_nop)
  s += generate_rimm(i,r1,neg_one,0x01f,neg_one,en_nop)
  s += generate_rimm(i,r1,smallest,0x01f,neg_one,en_nop)
  s += generate_rimm(i,r1,0x20,0,0x20,en_nop)
  s += generate_rimm(i,r1,0b10,1,1,en_nop)
  s += generate_rimm(i,r1,0b1000,2,2,en_nop)
  s += generate_rimm(i,r1,largest,31,0,en_nop)
  return s

def srai_all():
  content = srai_generate(False)
  file_path = "srai.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = srai_generate(True)
  file_path = "srai_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# srai_all()

def srli_generate(en_nop):
  i = 'srli'
  s = generate_rimm(i,r1,0,0,0,en_nop)
  s += generate_rimm(i,r1,1,1,0,en_nop)
  s += generate_rimm(i,r1,0b100000,3,0b100,en_nop)
  s += generate_rimm(i,r1,neg_one,31,1,en_nop)
  s += generate_rimm(i,r1,smallest,31,1,en_nop)
  s += generate_rimm(i,r1,neg_one,31,1,en_nop)
  s += generate_rimm(i,r1,smallest,31,1,en_nop)
  s += generate_rimm(i,r1,0x20,1,0x10,en_nop)
  s += generate_rimm(i,r1,0b10,1,1,en_nop)
  s += generate_rimm(i,r1,0x80000001,2,0x20000000,en_nop)
  s += generate_rimm(i,r1,largest,30,1,en_nop)
  return s

def srli_all():
  content = srli_generate(False)
  file_path = "srli.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = srli_generate(True)
  file_path = "srli_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# srli_all()

def slli_generate(en_nop):
  i = 'slli'
  s = generate_rimm(i,r1,0,0,0,en_nop)
  s += generate_rimm(i,r1,1,1,2,en_nop)
  s += generate_rimm(i,r1,0b100,3,0b100000,en_nop)
  s += generate_rimm(i,r1,neg_one,31,smallest,en_nop)
  s += generate_rimm(i,r1,smallest,1,0,en_nop)
  s += generate_rimm(i,r1,neg_one,31,smallest,en_nop)
  s += generate_rimm(i,r1,smallest,31,0,en_nop)
  s += generate_rimm(i,r1,0x20,1,0x40,en_nop)
  s += generate_rimm(i,r1,0b10,1,0b100,en_nop)
  s += generate_rimm(i,r1,0x80000001,2,0x00000004,en_nop)
  s += generate_rimm(i,r1,largest,1,0xfffffffe,en_nop)
  return s

def slli_all():
  content = slli_generate(False)
  file_path = "slli.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = slli_generate(True)
  file_path = "slli_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# slli_all()

def generate_imm(
    inst, imm,
    expected, random_nop_insertion = False
):
  imm = '0x{:x}'.format(imm)
  expected = '0x{:x}'.format(expected)
  high = 3 if random_nop_insertion else 0
  inst_asm_string = '{} x3, {}\n'.format(inst,imm)
  n = random.randint(0,high)
  inst_asm_string += 'nop\n'*n
  inst_asm_string += 'csrw proc2mngr, x3 > {}\n'.format(expected)
  return inst_asm_string

def lui_generate(en_nop):
  i = 'lui'
  s = generate_imm(i,0,0,en_nop)
  s += generate_imm(i,1,0x1000,en_nop)
  s += generate_imm(i,0xfffff,0xfffff000,en_nop)
  s += generate_imm(i,0x80000,smallest,en_nop)
  s += generate_imm(i,0x7ffff,0x7ffff000,en_nop)
  s += generate_imm(i,0b10,0x2000,en_nop)
  return s

def lui_all():
  content = lui_generate(False)
  file_path = "lui.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = lui_generate(True)
  file_path = "lui_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# lui_all()

def auipc_generate():
  en_nop = False
  i = 'auipc'
  s = generate_imm(i,0,0x200,en_nop)
  s += generate_imm(i,1,0x1208,en_nop)
  s += generate_imm(i,0xfffff,0xfffff210,en_nop)
  s += generate_imm(i,0x80000,0x80000218,en_nop)
  s += generate_imm(i,0x7ffff,0x7ffff220,en_nop)
  s += generate_imm(i,0b10,0x2228,en_nop)
  return s

def auipc_randomnop_generate():
  i = 'auipc'
  en_nop = False
  s = generate_imm(i,0,0x200,en_nop)
  high = 3
  n = random.randint(0,3)
  accum = n
  s += "nop\n"*n
  s += generate_imm(i,1,0x1208+accum*4,en_nop)
  n = random.randint(0,3)
  accum += n
  s += "nop\n"*n
  s += generate_imm(i,0xfffff,0xfffff210+accum*4,en_nop)
  n = random.randint(0,3)
  accum += n
  s += "nop\n"*n
  s += generate_imm(i,0x80000,0x80000218+accum*4,en_nop)
  n = random.randint(0,3)
  accum += n
  s += "nop\n"*n
  s += generate_imm(i,0x7ffff,0x7ffff220+accum*4,en_nop)
  n = random.randint(0,3)
  accum += n
  s += "nop\n"*n
  s += generate_imm(i,0b10,0x2228+accum*4,en_nop)
  return s

def auipc_all():
  content = auipc_generate()
  file_path = "auipc.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = auipc_randomnop_generate()
  file_path = "auipc_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# auipc_all()