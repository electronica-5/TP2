//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//					Microinstruction 1					//
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

module Decode_micro (
	micro_instr_ROM,
	data_address_in,
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

	input [32:0]micro_instr_ROM;
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

	always @* 
	begin
		ALU2 = micro_instr_ROM[32:29];
		SH2 = micro_instr_ROM[28:27];
		KMx2 = micro_instr_ROM[26];
		M2 = micro_instr_ROM[25:24];
		B2 = micro_instr_ROM[23:18];
		C2 = micro_instr_ROM[17:12];
		T2 = micro_instr_ROM[11:5];
		A2 = micro_instr_ROM[4:0];
		data_address_out = data_address_in;
	end
	
endmodule