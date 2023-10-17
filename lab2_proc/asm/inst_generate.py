# A python file to generate asm file
# that targets specific instructions one by one
import random

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

# register-immediate instructions
# memory instructions
# jump instructions
# branch instructions