from cocotb.binary import BinaryValue 
def alu_model (A, B, CY_IN, ALUC):
    out=BinaryValue('x')
    cy_out=BinaryValue('x')
    if (ALUC==0):
        out=A    
    elif(ALUC==1):
        out=B    
    elif(ALUC==2):
        out=~A    
    elif(ALUC==3):
        out=~B
    elif(ALUC==4):
        out=(A+B) & 0b1111111111111111
        cy=(A+B)>>16
    elif(ALUC==5):
        out=(A+B+CY_IN) & 0b1111111111111111
        cy_out=(A+B+CY_IN)>>16
    elif(ALUC==6):
        out=A|B
    elif(ALUC==7):
        out=A&B
    elif(ALUC==8):
        out=0
    elif(ALUC==9):
        out=1
    elif(ALUC==10):
        out=0xFFFF
    elif(ALUC==11):
        cy_out=0
    elif(ALUC==12):
        cy_out=1
    elif(ALUC==15):
        out=B
    else:
        out=0
    
    return out, cy_out