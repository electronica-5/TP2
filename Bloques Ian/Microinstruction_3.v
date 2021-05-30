//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//					Microinstruction 3					//
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

module Microinstruction_3 (
	clock,
	C_in,
	T_in,
	C_out,
	T_out,
);

/*****************************************************************
Modulo que implementa la tercera microintrucción del pipeline,
habria que chequear que en el momento inicial no flashee cualquiera.
******************************************************************/
	input clock;
	input [5:0] 		C_in;
	input [6:0] 		T_in;
	output reg [5:0] 	C_out;
	output reg [6:0] 	T_out;

	always @(posedge clock) 
	begin
		C_out	=	C_in;
		T_out	=	T_in;
	end
endmodule