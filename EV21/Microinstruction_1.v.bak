//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//					Microinstruction 1					//
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

module Microinstruction_1 (
	micro_instr_ROM,
	clock,
	data_address_in,
	alu,
	shifter,
	KMx,
	M,
	B,
	C,
	T,
	A,
	data_address_out
);

/*****************************************************************
Modulo que implementa la primera microintrucción del pipeline,
habria que chequear que en el momento inicial no flashee cualquiera.
******************************************************************/

	input [DEF:DEF]micro_instr_ROM;
	input clock;
	input [10:0] data_address_in;
	output reg [3:0]alu;
	output reg [1:0]shifter;
	output reg KMx;
	output reg [1:0]M;
	output reg [5:0]B;
	output reg [5:0]C;
	output reg [6:0]T;
	output reg [4:0]A;
	output reg [10:0]data_address_out;

	always @(posedge clock) 
	begin
		alu = micro_instr_ROM[32:29];
		shifter = micro_instr_ROM[28:27];
		KMx = micro_instr_ROM[26];
		M = micro_instr_ROM[25:24];
		B = micro_instr_ROM[23:18];
		C = micro_instr_ROM[17:12];
		T = micro_instr_ROM[11:5];
		A = micro_instr_ROM[4:0];
		data_address_out = data_address_in;
	end
endmodule