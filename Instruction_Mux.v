


module Instruction_Mux (
    Q,
    instruction,
    micro_instr_out,
	clk
);

	input [32:0] Q;
	input [21:0] instruction;
	input clk;
	output reg [32:0] micro_instr_out;

	always @(negedge clk) begin
		micro_instr_out = Q;
		micro_instr_out[4:0] = instruction[4:0]; // Pongo lo que tiene que ir en A
		micro_instr_out[23:18] = 6'b100010;
		if (instruction[21:18] == 4'b0110 || instruction[21:18] == 4'b0010 || instruction[21:18] == 4'b0011) begin
			micro_instr_out[17:12] = instruction[9:5]; // Pongo C
		end
	end
endmodule