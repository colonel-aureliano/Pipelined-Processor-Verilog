import random

# Define the list of instructions and their formats
instruction_formats = {
    "r": ["add", "sub", "mul", "and", "or", "xor", "slt", "sltu", "sra", "srl", "sll"],
    "i": ["addi", "ori", "andi", "xori", "slti", "sltiu"],
    # "jump": ["jal"],
    # "branch": ["bne", "beq", "blt", "bltu", "bge", "bgeu"],
    "immediate": ["lui", "auipc", "srai", "srli", "slli"]
}

num_reg = 3

# Define the list of available registers
registers = [f'x{i}' for i in range(1, num_reg+1)]

# Function to generate a random instruction
def generate_random_instruction():
    format = random.choice(list(instruction_formats.keys()))
    return random.choice(instruction_formats[format]), format

# Function to generate a random register name
def generate_random_register():
    return random.choice(registers)

# Function to generate a random 12-bit immediate value
def generate_random_12bit_immediate():
    return random.randint(0, 4095)

# Function to generate a random 5-bit immediate value
def generate_random_5bit_immediate():
    return random.randint(0, 31)  # 31 is 2^5 - 1

def generate_random_address():
    return random.choice(range(0,24,4))

# Function to generate a random 20-bit immediate value
def generate_random_20bit_immediate():
    return random.randint(0, 1048575)  # 1048575 is 2^20 - 1

# Function to initialize registers with nonzero values using "addi"
def initialize_registers_with_addi():
    register_initializations = []
    for i in range(num_reg):
        value = random.randint(1, 4095)  # Generate a random nonzero value
        register_initializations.append(f"addi {registers[i]}, x0, {value}")
    return register_initializations

initialize = True

# Function to generate n lines of random instructions and save to a text file
def generate_instructions_to_file(n, filename):
    with open(filename, 'w') as file:
        if initialize:
          register_initializations = initialize_registers_with_addi()
          file.write('\n'.join(register_initializations) + '\n')
        
        for _ in range(n):
            random_instruction, format = generate_random_instruction()
            if format == "r":
                register1 = generate_random_register()
                register2 = generate_random_register()
                file.write(f"{random_instruction} {register1}, {register2}, {generate_random_register()}\n")
            elif format == "i":
                register1 = generate_random_register()
                register2 = generate_random_register()
                immediate = generate_random_12bit_immediate()
                file.write(f"{random_instruction} {register1}, {register2}, {immediate}\n")
            elif format == "mem":
                register1 = generate_random_register()
                register2 = generate_random_register()
                immediate = generate_random_address()
                file.write(f"addi {register2}, x0, 0\n")
                file.write(f"{random_instruction} {register1}, {immediate}({register2})\n")
            elif format == "jump":
                register1 = generate_random_register()
                immediate = generate_random_address()
                file.write(f"{random_instruction} {register1}, {immediate}\n")
            elif format == "branch":
                register1 = generate_random_register()
                register2 = generate_random_register()
                immediate = generate_random_address()
                file.write(f"{random_instruction} {register1}, {register2}, {immediate}\n")
            elif format == "immediate":
                if random_instruction == "lui" or random_instruction == "auipc":
                    register = generate_random_register()
                    immediate = generate_random_20bit_immediate()
                    file.write(f"{random_instruction} {register}, {immediate}\n")
                elif random_instruction == "jal":
                    register = generate_random_register()
                    immediate = generate_random_20bit_immediate()
                    file.write(f"{random_instruction} {register}, {immediate}\n")
                elif random_instruction in ["srai", "srli", "slli"]:
                    register1 = generate_random_register()
                    register2 = generate_random_register()
                    immediate = generate_random_5bit_immediate()
                    file.write(f"{random_instruction} {register1}, {register2}, {immediate}\n")
        file.write("lui x1, 0x0002\n")
        for i in range(2,num_reg+1):
            file.write("sw x"+str(i)+", "+str((i-2)*4)+"(x1)\n")

# Generate and save n lines of random instructions to a text file
n = 40
filename = "lab2_proc/asm/hazard10.asm"  # Specify the filename
generate_instructions_to_file(n, filename)
