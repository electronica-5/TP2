module predictor_prediction_check (	input [10:0]			branch_addr,
												input [10:0]			jump_addr,
												input [1:0]				branch_type,
												input						branch_taken,
												input						W_zero,
												input						W_negative,
												input						carry,
												output reg				branch_successful,
												output reg				branch_result,
												output reg [10:0]		failback_addr);
												
	always begin
		case (branch_type)
			2'b01 : begin
				branch_successful <= W_zero == branch_taken ? 1 : 0;
				branch_result <= W_zero ? 1 : 0;
			end
			2'b10 : begin
				branch_successful <= W_negative == branch_taken ? 1 : 0;
				branch_result <= W_negative ? 1 : 0;
			end
			2'b11 : begin 
				branch_successful <= carry == branch_taken ? 1 : 0;
				branch_result <= carry ? 1 : 0;
			end
		endcase
		failback_addr <= branch_taken == 1 ? branch_addr : jump_addr;
	end
	
endmodule