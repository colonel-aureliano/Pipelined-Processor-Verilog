# A python script to generate asm file
# that targets specific instructions one by one
import random

# This file contains code that generate tests for
# memory instructions

# memory instructions

r1 = 'x1'
r2 = 'x2'

def generate_sw(
    base_reg, base_reg_init, value_to_store, imm, random_nop_insertion = False
):
  base_reg_init = str(base_reg_init)
  value_to_store = str(value_to_store)
  imm = str(imm)
  high = 3 if random_nop_insertion else 0
  inst_asm_string = 'csrr {}, mngr2proc < {}\n'.format(base_reg,base_reg_init)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  inst_asm_string += 'csrr x3, mngr2proc < {}\n'.format(value_to_store)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  inst_asm_string += 'sw x3, {}({})\n'.format(imm,base_reg)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  return inst_asm_string

d = 8192

# 2000: 4
#       8
#       -1
#       11
# 2016: 0x80000000
#       5
#       9

c = 8192+40

def generate_lw_csrw(
    base_reg, base_reg_init, imm, expected, random_nop_insertion = False
):
  base_reg_init = str(base_reg_init)
  imm = str(imm)
  expected = str(expected)
  high = 3 if random_nop_insertion else 0
  inst_asm_string = 'csrr {}, mngr2proc < {}\n'.format(base_reg,base_reg_init)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  inst_asm_string += 'lw x3, {}({})\n'.format(imm,base_reg)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  inst_asm_string += 'csrw proc2mngr, x3 > {}\n'.format(expected)
  inst_asm_string += 'nop\n'*random.randint(0,high)
  return inst_asm_string

# 8192: 4
#       8
#       -1
#       11
# 8192+16: 0x80000000
#       5
#       9

e = 8192+4
f = 8192+20

def load_store_generate(en_nop):
  s = generate_sw(r1,d,4,0,en_nop)
  s += generate_sw(r2,d,8,4,en_nop)
  s += generate_sw(r2,d,-1,8,en_nop)
  s += generate_sw(r2,d,11,12,en_nop)
  s += generate_sw(r1,d,2147483648,16,en_nop)
  s += generate_sw(r1,c,5,-20,en_nop)
  s += generate_sw(r1,c,9,-16,en_nop)

  s += generate_lw_csrw(r1,e,0,8,en_nop)
  s += generate_lw_csrw(r2,e,-4,4,en_nop)
  s += generate_lw_csrw(r2,e,4,-1,en_nop)
  s += generate_lw_csrw(r2,e,12,0x80000000,en_nop)
  s += generate_lw_csrw(r2,f,4,9,en_nop)
  s += generate_lw_csrw(r1,f,0,5,en_nop)
  s += generate_lw_csrw(r1,f,-16,8,en_nop)
  return s

def load_store_all():
  content = load_store_generate(False)
  file_path = "lw_sw.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()
  content = load_store_generate(True)
  file_path = "lw_sw_nop.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# load_store_all()

# jump instructions

def generate_jal_jalr(
    imm1, expected1, reg2, init2, imm2,
    expected2):
  init2 = '0x{:x}'.format(init2)
  expected1 = '0x{:x}'.format(expected1)
  expected2 = '0x{:x}'.format(expected2)
  inst_asm_string = 'jal x3, {}\n'.format(imm1)
  inst_asm_string += 'nop\n'*int(imm1/4-1)
  inst_asm_string += 'csrw proc2mngr, x3 > {}\n'.format(expected1)
  inst_asm_string += 'csrr {}, mngr2proc < {}\n'.format(reg2,init2)
  inst_asm_string += 'jalr x3, {}, {}\n'.format(reg2,imm2)
  inst_asm_string += 'csrw proc2mngr, x3 > {}\n'.format(expected2)
  return inst_asm_string

def jal_jalr_generate():
  s = generate_jal_jalr(8,0x204,r1,0x20c,8,0x214)
  s += generate_jal_jalr(16,0x21c,r1,0x214,8,0x234)
  return s

def jal_jalr_all():
  content = jal_jalr_generate()
  file_path = "jal_jalr.asm"
  with open(file_path, 'w') as file:
    file.write(content)
  file.close()

# jal_jalr_all()

# branch instructions

# def generate_rimm(
#     inst, reg1, init1, imm,
#     expected, random_nop_insertion = False
# ):
#   init1 = '0x{:x}'.format(init1)
#   imm = '0x{:x}'.format(imm)
#   expected = '0x{:x}'.format(expected)
#   high = 3 if random_nop_insertion else 0
#   inst_asm_string = 'csrr {}, mngr2proc < {}\n'.format(reg1,init1)
#   inst_asm_string += 'nop\n'*random.randint(0,high)
#   inst_asm_string += '{} x3, {}, {}\n'.format(inst,reg1,imm)
#   inst_asm_string += 'nop\n'*random.randint(0,high)
#   inst_asm_string += 'csrw proc2mngr, x3 > {}\n'.format(expected)
#   inst_asm_string += 'nop\n'*random.randint(0,high)
#   return inst_asm_string

# neg_one = 0xffffffff
# largest = 0x7fffffff
# smallest = 0x80000000

# def beq_generate(en_nop):
#   i = 'beq'
#   s = generate_rimm(i,r1,0,0,0,en_nop)
#   s += generate_rimm(i,r1,1,1,1,en_nop)
#   s += generate_rimm(i,r1,0b10,0b11,0b10,en_nop)
#   s += generate_rimm(i,r1,neg_one,0b11,0b11,en_nop)
#   s += generate_rimm(i,r1,smallest,1,0,en_nop)
#   s += generate_rimm(i,r1,neg_one,0xfff,neg_one,en_nop)
#   s += generate_rimm(i,r1,smallest,0xfff,smallest,en_nop)
#   s += generate_rimm(i,r1,0b10,0b1,0,en_nop)
#   s += generate_rimm(i,r1,neg_one,0x7ff,0x7ff,en_nop)
#   s += generate_rimm(i,r1,0x80000001,0x7ff,1,en_nop)
#   return s

# def beq_all():
#   content = beq_generate(False)
#   file_path = "beq.asm"
#   with open(file_path, 'w') as file:
#     file.write(content)
#   file.close()
#   content = beq_generate(True)
#   file_path = "beq_nop.asm"
#   with open(file_path, 'w') as file:
#     file.write(content)
#   file.close()