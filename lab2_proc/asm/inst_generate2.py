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
# branch instructions