//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//					Microinstruction 2					//
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

module Microinstruction_2 (
	clock,
	ALU_in,
	SH_in,
	C_in,
	T_in,
	ALU_out,
	SH_out,
	C_out,
	T_out
);

/*****************************************************************
Modulo que implementa la segunda microintrucción del pipeline,
habria que chequear que en el momento inicial no flashee cualquiera.
******************************************************************/
	input clock;
	input [3:0] 		ALU_in;
	input [1:0] 		SH_in;
	input [5:0] 		C_in;
	input [6:0] 		T_in;
	output reg [3:0] 	ALU_out;
	output reg [1:0] 	SH_out;
	output reg [5:0] 	C_out;
	output reg [6:0] 	T_out;
	

	always @* 
	begin
		ALU_out	=	ALU_in;
		SH_out	=	SH_in;
		C_out	=	C_in;
		T_out	=	T_in;
	end
endmodule