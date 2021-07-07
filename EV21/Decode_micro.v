//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//					Microinstruction 1					//
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

module Decode_micro (
	micro_instr_ROM,
	data_address_in,
	ALU_IN,
	SH_IN,
	KMx_IN,
	M_IN,
	B_IN,
	C_IN,
	T_IN,
	A_IN,
	data_address_out
);

/*****************************************************************
Modulo que implementa la primera microintrucción del pipeline,
habria que chequear que en el momento inicial no flashee cualquiera.
******************************************************************/

	input [32:0]micro_instr_ROM;
	input [10:0] data_address_in;
	output reg [3:0]ALU_IN;
	output reg [1:0]SH_IN;
	output reg KMx_IN;
	output reg [1:0]M_IN;
	output reg [5:0]B_IN;
	output reg [5:0]C_IN;
	output reg [6:0]T_IN;
	output reg [4:0]A_IN;
	output reg [10:0]data_address_out;

	always @* 
	begin
		ALU_IN = micro_instr_ROM[32:29];
		SH_IN = micro_instr_ROM[28:27];
		KMx_IN = micro_instr_ROM[26];
		M_IN = micro_instr_ROM[25:24];
		B_IN = micro_instr_ROM[23:18];
		C_IN = micro_instr_ROM[17:12];
		T_IN = micro_instr_ROM[11:5];
		A_IN = micro_instr_ROM[4:0];
		data_address_out = data_address_in;
	end
	
endmodule