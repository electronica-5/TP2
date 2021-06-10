//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//					Microinstruction 3					//
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

module Microinstruction_3 (clock,
	C4,
	T4,
	C5,
	T5,
	DATA_ADDR_4,
	DATA_ADDR_5,
	M4,
	M5
);

/*****************************************************************
Modulo que implementa la tercera microintrucción del pipeline,
habria que chequear que en el momento inicial no flashee cualquiera.
******************************************************************/
	input clock;
	input [5:0] 		C4;
	input [6:0] 		T4;
	input [10:0]		DATA_ADDR_4;
	input [1:0] 		M4;
	output reg [5:0] 	C5;
	output reg [6:0] 	T5;
	output reg [10:0]	DATA_ADDR_5;
	output reg [1:0] 	M5;

	always @(posedge clock) 
	begin
		C5	=	C4;
		T5	=	T4;
		DATA_ADDR_5 = DATA_ADDR_4;
		M5 = M4;
	end
endmodule