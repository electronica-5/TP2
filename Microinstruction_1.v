//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//					Microinstruction 1					//
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

module Microinstruction_1 (
	clock,
	data_address_in,
	ALU2,
	SH2,
	KMx2,
	M2,
	B2,
	C2,
	T2,
	A2,
	ALU3,
	SH3,
	KMx3,
	M3,
	B3,
	C3,
	T3,
	A3,
	data_address_out
);

/*****************************************************************
Modulo que implementa la primera microintrucción del pipeline,
habria que chequear que en el momento inicial no flashee cualquiera.
******************************************************************/

	input [3:0]ALU2;
	input [1:0]SH2;
	input KMx2;
	input [1:0]M2;
	input [5:0]B2;
	input [5:0]C2;
	input [6:0]T2;
	input [4:0]A2;
	input clock;
	input [10:0] data_address_in;

	output reg [3:0]ALU3;
	output reg [1:0]SH3;
	output reg KMx3;
	output reg [1:0]M3;
	output reg [5:0]B3;
	output reg [5:0]C3;
	output reg [6:0]T3;
	output reg [4:0]A3;
	output reg [10:0]data_address_out;

	always @(posedge clock) 
	begin
		ALU3 = ALU2;
		SH3 = SH2;
		KMx3 = KMx2;
		M3 = M2;
		B3 = B2;
		C3 = C2;
		T3 = T2;
		A3 = A2;
		data_address_out = data_address_in;
	end

endmodule