module ALU (A, B, ALUC, CY_IN, CY_OUT, OUT);

	input CY_IN;
	input [15:0] A,B;
	input [3:0] ALUC;
	
	output reg CY_OUT;
	output reg [15:0] OUT;
	reg [16:0] AUX; //Arreglo auxiliar para las operaciones con carry

	always @ (A or B or ALUC)
	begin
	
		case (ALUC)
		
			0:	 OUT = A;
			1:	 OUT = B;
			2:  OUT = ~A;
			3:	 OUT = ~B;
			4:  begin
				 AUX = A + B;
				 OUT = AUX[15:0];
				 CY_OUT = AUX[16];
				 end	 
			5:  begin
				 AUX = A + B + CY_IN;
				 OUT = AUX[15:0];
				 CY_OUT = AUX[16];
				 end
			6:  OUT = A | B;
			7:	 OUT = A & B;
			8:  OUT = 16'd00000000000000000;
			9:  OUT = 16'd11111111111111111;
			10: OUT = 16'hFFFF;
			11: CY_OUT = 0;
			12: CY_OUT = 1;
			15:; // Si llega 1111 no se hace nada 
			default: OUT = 16'd00000000000000000;
			
		endcase
	end
		


endmodule 