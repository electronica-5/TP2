import cocotb
from cocotb.triggers import Timer
from random import getrandbits
from alu_model import alu_model
            
N=500
            
@cocotb.test()
async def alu_test_0(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=0
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"

@cocotb.test()
async def alu_test_1(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=1
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"

@cocotb.test()
async def alu_test_2(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=2
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]} A was {A}"

@cocotb.test()
async def alu_test_3(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=3
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]} B was {B}"

@cocotb.test()
async def alu_test_4(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=4
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"
        assert dut.CY_OUT.value == alu_model(A, B, CY_IN, ALU_C)[1] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[1]}"

@cocotb.test()
async def alu_test_5(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=5
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"
        assert dut.CY_OUT.value == alu_model(A, B, CY_IN, ALU_C)[1] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[1]}"

@cocotb.test()
async def alu_test_6(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=6
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"
        
@cocotb.test()
async def alu_test_7(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=7
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"

@cocotb.test()
async def alu_test_8(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=8
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"

@cocotb.test()
async def alu_test_9(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=9
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"

@cocotb.test()
async def alu_test_10(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=10
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"

@cocotb.test()
async def alu_test_11(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=11
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.CY_OUT.value == alu_model(A, B, CY_IN, ALU_C)[1] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[1]}"

@cocotb.test()
async def alu_test_12(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=12
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.CY_OUT.value == alu_model(A, B, CY_IN, ALU_C)[1] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[1]}"

@cocotb.test()
async def alu_test_XX(dut):
    for iteration in range(N):
        A = getrandbits(16)
        B = getrandbits(16)
        CY_IN=getrandbits(1)
        ALU_C=14
        
        dut.A <= A
        dut.B <= B
        dut.CY_IN <= CY_IN
        dut.ALUC <= ALU_C
        
        await Timer(1, units='ns')

        assert dut.OUT.value == alu_model(A, B, CY_IN, ALU_C)[0] , f"ALU result is incorrect: {dut.OUT.value} != {alu_model(A, B, CY_IN, ALU_C)[0]}"
