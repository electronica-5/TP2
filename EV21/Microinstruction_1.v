//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//					Microinstruction 1					//
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

module Microinstruction_1 (
	clock,
	data_address_in,
	ALU_IN,
	SH_IN,
	KMx_IN,
	M_IN,
	B_IN,
	C_IN,
	T_IN,
	A_IN,
	ALU2,
	SH2,
	KMx2,
	M2,
	B2,
	C2,
	T2,
	A2,
	data_address_out
);

/*****************************************************************
Modulo que implementa la primera microintrucción del pipeline,
habria que chequear que en el momento inicial no flashee cualquiera.
******************************************************************/

	input [3:0]ALU_IN;
	input [1:0]SH_IN;
	input KMx_IN;
	input [1:0]M_IN;
	input [5:0]B_IN;
	input [5:0]C_IN;
	input [6:0]T_IN;
	input [4:0]A_IN;
	input clock;
	input [10:0] data_address_in;

	output reg [3:0]ALU2;
	output reg [1:0]SH2;
	output reg KMx2;
	output reg [1:0]M2;
	output reg [5:0]B2;
	output reg [5:0]C2;
	output reg [6:0]T2;
	output reg [4:0]A2;
	output reg [10:0]data_address_out;

	always @(posedge clock) 
	begin
		ALU2 = ALU_IN;
		SH2 = SH_IN;
		KMx2 = KMx_IN;
		M2 = M_IN;
		B2 = B_IN;
		C2 = C_IN;
		T2 = T_IN;
		A2 = A_IN;
		data_address_out = data_address_in;
	end

endmodule