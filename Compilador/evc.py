import sys

def print_comp_error(ins,data,line):
	print(f"Compilation Error! Intruction {ins} has wrong data: {data} Line: {line}")
	return

def decode_instr(instruction, data, instruction_line):
	output = 0b0
	if instr == 'JMP':
		output |= 0b1000000000000000000000
		try:
			output |= int(data)
		except :
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'JZE':
		output |= 0b1010000000000000000000
		try:
			output |= int(data)
		except :
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'JNE':
		output |= 0b1100000000000000000000
		try:
			output |= int(data)
		except :
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'JCY':
		output |= 0b1110000000000000000000
		try:
			output |= int(data)
		except :
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'MOM':
		if data.split(',')[1] == 'W':  
			output |= 0b0100000000000000000000
			try:
				output |= int(data.split(',')[0])
			except :
				print_comp_error(instruction, data, instruction_line)
		elif data.split(',')[0] == 'W':
			output |= 0b0101000000000000000000
			try:
				output |= int(data.split(',')[1])
			except :
				print_comp_error(instruction, data, instruction_line)
		else:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'ADW':
		output |= 0b0110000000000000000000
		try:
			output |= int(data.split(',')[0])<<5
			output |= int(data.split(',')[1])
		except:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'BSR':
		output |= 0b0111000000000000000000
		try:
			output |= int(data)
		except:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'MOV' :
		if data.split(',')[1] != 'W' and data.split(',')[0] != 'W':
			output |= 0b0010000000000000000000
			try:
				output |= int(data.split(',')[0])<<5
				output |= int(data.split(',')[1])
			except:
				print_comp_error(instruction, data, instruction_line)
		elif data.split(',')[1] == 'W' and data.split(',')[0] != 'W':
			output |= 0b0011000000000000000000
			try:
				output |= int(data.split(',')[0])<<5
			except:
				print_comp_error(instruction, data, instruction_line)
		elif data.split(',')[0] == 'W':
			output |= 0b0000100000000000000000
			try:
				output |= int(data.split(',')[1])
			except:
				print_comp_error(instruction, data, instruction_line)
		else:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'MOK':
		if data.split(',')[1][0] == '#':
			output |= 0b0001000000000000000000
			try:
				output |= int(data.split(',')[1][1:])
			except:
				print_comp_error(instruction, data, instruction_line)
		else :
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'ANK':
		output |= 0b0001010000000000000000
		try:
			output |= int(data.split(',')[1][1:])
		except:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'ORK':
		output |= 0b0001100000000000000000
		try:
			output |= int(data.split(',')[1][1:])
		except:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'ADK':
		output |= 0b0001110000000000000000
		try:
			output |= int(data.split(',')[1][1:])
		except:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'ANR':
		output |= 0b0000101000000000000000
		try:
			output |= int(data.split(',')[1])
		except:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'ORR':
		output |= 0b0000110000000000000000
		try:
			output |= int(data.split(',')[1])
		except:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'ADR':
		output |= 0b0000111000000000000000
		try:
			output |= int(data.split(',')[1])
		except:
			print_comp_error(instruction, data, instruction_line)

	elif instr == 'CPL':
		output |= 0b0000000000000000000000

	elif instr == 'CLR':
		output |= 0b0000001000000000000000

	elif instr == 'SET':
		output |= 0b0000010000000000000000

	elif instr == 'RET':
		output |= 0b0000011000000000000000

	else:
		print(f"Compilation Error! Instruccion {instruction} no exists! Line {instruction_line}")

	return output

if __name__ == "__main__":
	f = open(f"{sys.argv[1]}.ev", "r")
	string = f.read()
	instructions = string.splitlines()
	f.close()
	out_file = open(f"Program_memory.mif", "w")
	out_file.write("""-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporations design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- Quartus Prime generated Memory Initialization File (.mif)

WIDTH=22;
DEPTH=2048;

ADDRESS_RADIX=UNS;
DATA_RADIX=BIN;

CONTENT BEGIN
""")
	lines = []
	if len(instructions) < 2047:
		for i, instruction in enumerate(instructions):
			line = instruction.split()
			if (len(line) >= 2 or (len(line) == 1 and line[0] == 'RET')) and line[0][0] != '/' and line[0][1] != '/': 
				if line[0] == 'RET' :
					instr = line[0]
				else:
					instr, data = [line[0], line[1]]
				
				if len(line) > 2 and line[2][0] != '/' and line[2][1] != '/':
					print(f"Compilation error at line {i+1}. Comments begin with '//'")

				
				temp_string = bin(decode_instr(instr, data, i+1))[2:]
				temp_string = temp_string.rjust(22,'0')
				if i != len(instructions) - 1 :
					line = f"		{i}	:	{temp_string};\n"
					out_file.write(line)
				else:
					line = f"		{i}	:	{temp_string};\n"
					out_file.write(line)
					line = f"		[{i+1}..2047]	:	0000000000000000000000;\n"
					out_file.write(line)
			else:
				if len(line) >= 1:
					if line[0][0] != '/' or line[0][1] != '/':
						print(f"Compilation error at line {i+1}. Intruction no exists, comments begin with '//'")

		out_file.write("END;")
		out_file.close()
		print("Compilation Success!")
	else:
		out_file.close()
		print(f"The actual Program is too long for the EV21, it supports a maximum of 2047 instructions and the current program is {len(instructions)}!")