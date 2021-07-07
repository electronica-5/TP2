module predictor_predict_enable_control (	input [2:0] branch_type,
														output reg predict,
														output reg unconditional_jump);
														
	always begin
		if (branch_type == 3'b100) begin
			unconditional_jump <= 1;
			predict <= 0;
		end else if (branch_type[2:0] == 3'b101 || branch_type == 3'b110 || branch_type == 3'b111) begin
			unconditional_jump <= 0;
			predict <= 1;
		end else begin
			unconditional_jump <= 0;
			predict <= 0;
		end
	end
endmodule