module MI_ROM (
    instruction,
    micro_instruction,
	 test,
	 test2
);
    input [21:0] instruction;
    output reg [32:0] micro_instruction;

    reg [3:0] ALU=4'b0000;
    reg [1:0] SH= 2'b00;
    reg Kmx =1'b0;
    reg MW=1'b0;
    reg MR=1'b0;
    reg [5:0] Bus_B =0;
    reg [5:0] Bus_C=0;
    reg [6:0] T_word=0;
    reg [4:0] Bus_A;
	
	 output reg [10:0]test; 
	 output reg [10:0]test2;
    always @(instruction)
        begin
           if(instruction[21:11] == 11'b10000000000) //jUMP X   linea 3
            begin
                ALU=0;
                SH=0;
                Kmx=0;
                MR=0;
                MW=0;
                Bus_B= 6'b100010;
                Bus_C= 6'b100011;
                T_word=7'b1000000;
                Bus_A=5'b00000;
                micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
					 
            end
			else if(instruction[21:11] == 11'b10100000000) //jze X   linea 4
                begin
                    
                    ALU=0;
                    SH=0;
                    Kmx=0;
                    MR=0;
                    MW=0;
                    Bus_B= 6'b100010;
                    Bus_C= 6'b100011;
                    T_word=7'b1000001;
                    Bus_A=5'b00000;
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end
			else if(instruction[21:11] == 11'b11000000000) //jne X      linea 5
                begin
                    
                    ALU=0;
                    SH=0;
                    Kmx=0;
                    MR=0;
                    MW=0;
                    Bus_B= 6'b100010;
                    Bus_C= 6'b100011;
                    T_word=7'b1000001;
                    Bus_A=5'b00000;
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end
            else if(instruction[21:11] == 11'b11100000000) //jCY X       linea 6
                begin
                    
                    ALU=0;
                    SH=0;
                    Kmx=0;
                    MR=0;
                    MW=0;
                    Bus_B= 6'b100010;
                    Bus_C= 6'b100011;
                    T_word=7'b1010000;
                    Bus_A=5'b00000;
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end
            else if(instruction[21:10] == 12'b010000000000) //MOM Y,W   M(y)=W      linea 7
                begin
                    
                    ALU=0;
                    SH=0;
                    Kmx=0;
                    MR=0;
                    MW=1;
                    Bus_B= 6'b100010;
                    Bus_C= 6'b100011;
                    T_word=7'b0000001;
                    Bus_A=5'b00000;
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end
            else if(instruction[21:10] == 12'b010100000000) //MOM W,Y   W=M(y)      linea 8
                begin
                    
                    ALU=0;
                    SH=0;
                    Kmx=0;
                    MR=1;
                    MW=0;
                    Bus_B= 6'b100010;
                    Bus_C= 6'b100011;
                    T_word=7'b0000010;
                    Bus_A=5'b00000;
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end
            else if(instruction[21:10] == 12'b011000000000) //ADW RI,RJ       linea 9
                begin
                    
                    ALU=4'b0101;
                    SH=0;
                    Kmx=0;
                    MR=0;
                    MW=0;
                    Bus_B= 6'b100010;
                    Bus_C= instruction[9:5];
                    T_word=7'b0111101;
                    Bus_A=instruction[4:0];
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end    
            else if(instruction[21:10] == 12'b011100000000) //BSR S     linea 10
                begin
                    
                    ALU=0;
                    SH=0;
                    Kmx=0;
                    MR=0;
                    MW=0;
                    Bus_B= 6'b100010;
                    Bus_C= 6'b100011;
                    T_word=7'b1000000;
                    Bus_A=0;
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end  
            else if(instruction[21:10] == 12'b001000000000) //MOV Ri,Rj Ri=Rj    linea 11
                begin
                    
                    ALU=0;
                    SH=0;
                    Kmx=0;
                    MR=0;
                    MW=0;
                    Bus_B= 6'b100010;
                    Bus_C=instruction[9:5] ;
                    T_word=7'b0001100;
                    Bus_A=instruction[4:0];
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end         
            else if(instruction[21:10] == 12'b001000000000) //MOV POi,Rj Ri=Rj    linea 12
                begin
                    
                    ALU=0;
                    SH=0;
                    Kmx=0;
                    MR=0;
                    MW=0;
                    Bus_B= 6'b100010;
                    Bus_C= instruction[9:5];
                    T_word=7'b0001100;
                    Bus_A=instruction[4:0];
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end    
            else if(instruction[21:10] == 12'b001000000000) //MOV RI,PIj Ri=PIj    linea 13
                begin
                    
                    ALU=0;
                    SH=0;
                    Kmx=0;
                    MR=0;
                    MW=0;
                    Bus_B= 6'b100010;
                    Bus_C= instruction[9:5];
                    T_word=7'b0001100;
                    Bus_A=instruction[4:0];
                    micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
                end    

        end

endmodule