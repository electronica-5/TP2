module MI_ROM (
	instruction,
	micro_instruction,
	clk,
	HOLD,
	DATA_ADDR
);
    
	input [21:0] instruction;
	input clk;
	input HOLD;

	output reg [10:0] DATA_ADDR;
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
	

   always @(negedge clk)
	begin
		DATA_ADDR = instruction;
		if(HOLD == 0) 
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
			else if(instruction[21:11] == 11'b11000000000) //JP0 X      linea 5
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
			else if(instruction[21:10] == 12'b001000000000) //MOV PO,PIj Linea 14 Excel
				begin
					ALU=4'b0000;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= instruction[9:5];
					T_word=7'b0001100;
					Bus_A= instruction[4:0];
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:10] == 12'b001100000000) //MOV Ri,W Linea 15 Excel
				begin
					ALU=4'b0001;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= instruction[9:5];
					T_word=7'b0001001;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:10] == 12'b001100000000) //MOV POi,W Linea 16 Excel
				begin
					ALU=4'b0001;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= instruction[9:5];
					T_word=7'b0001001;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:16] == 6'b000100) //MOV W,#K Linea 17 Excel
				begin
					ALU=4'b0000;
					SH=2'b00;
					Kmx=1'b1;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0000010;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:16] == 6'b000110) //ORK W,#K Linea 18 Excel
				begin
					ALU=4'b0110;
					SH=2'b00;
					Kmx=1'b1;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0000011;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:16] == 6'b000101) //ANK W,#K Linea 19 Excel
				begin
					ALU=4'b0111;
					SH=2'b00;
					Kmx=1'b1;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0000011;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:16] == 6'b000111) //ADK W,#K Linea 20 Excel
				begin
					ALU=4'b0101;
					SH=2'b00;
					Kmx=1'b1;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0110011;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:5] == 17'b00001000000000000) //MOV W,Rj Linea 21 Excel
				begin
					ALU=4'b0000;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0000110;
					Bus_A= instruction[4:0];
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:5] == 17'b00001000000000000) //MOV W,PIj Linea 22 Excel IGUAL A LA 21
				begin
					ALU=4'b0000;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0000110;
					Bus_A= instruction[4:0];
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:5] == 17'b00001010000000000) //ANR W,Rj Linea 23 Excel 
				begin
					ALU=4'b0111;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0000111;
					Bus_A= instruction[4:0];
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:5] == 17'b00001100000000000) //ORR W,Rj Linea 24 Excel 
				begin
					ALU=4'b0110;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0000111;
					Bus_A= instruction[4:0];
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction[21:5] == 17'b00001110000000000) //ADR W,Rj Linea 25 Excel 
				begin
					ALU=4'b0101;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0110111;
					Bus_A= instruction[4:0];
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction == 22'b0000000000000000000000) //CPL W Linea 26 Excel 
				begin
					ALU=4'b0011;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100010;
					T_word=7'b0000011;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction == 22'b0000001000000000000000) //CLR CY Linea 27 Excel 
				begin
					ALU=4'b1011;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100011;
					T_word=7'b0100000;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction == 22'b0000010000000000000000) //SET CY Linea 28 Excel 
				begin
					ALU=4'b1100;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100011;
					T_word=7'b0100000;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
			else if(instruction == 22'b0000011000000000000000) //RET Linea 29 Excel 
				begin
					ALU=4'b0000;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100010;
					Bus_C= 6'b100011;
					T_word=7'b1000000;
					Bus_A= 5'b00000;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
            else if(instruction == 22'b1111110000000000000000) //NOP Linea 30 Excel 
				begin
					ALU=4'b1111;
					SH=2'b00;
					Kmx=1'b0;
					MR=1'b0;
					MW=1'b0;
					Bus_B= 6'b100011;
					Bus_C= 6'b100011;
					T_word=7'b0000000;
					Bus_A= 5'b100011;
					micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};		
				end
		end
	end
endmodule