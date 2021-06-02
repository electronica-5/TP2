module predictor_fifo_input_data (	input [10:0] 		branch_addr,
												input [10:0]		jump_addr,
												input [2:0]			branch_type,
												input 				prediction,
												output reg [24:0] packed_data);
												
	always begin
		packed_data <= {branch_addr, jump_addr, branch_type, prediction};
	end
endmodule