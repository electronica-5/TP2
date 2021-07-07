module predictor_prediction_check (	input [10:0]			branch_addr,
												input [10:0]			jump_addr,
												input [1:0]				branch_type,
												input						branch_taken,
												input						W_zero,
												input						W_positive,
												input						carry,
												output reg				prediction_failed,
												output reg				branch_result,
												output reg [10:0]		failback_addr);
				
	initial begin
		prediction_failed = 0;
	end
	always begin
		case (branch_type)
			2'b01 : begin
				prediction_failed <= W_zero == branch_taken ? 0 : 1;
				branch_result <= W_zero ? 1 : 0;
			end
			2'b10 : begin
				prediction_failed <= W_positive == branch_taken ? 0 : 1;
				branch_result <= W_positive ? 1 : 0;
			end
			2'b11 : begin 
				prediction_failed <= carry == branch_taken ? 0 : 1;
				branch_result <= carry ? 1 : 0;
			end
		endcase
		failback_addr <= branch_taken == 1 ? branch_addr + 1 : jump_addr;
	end
	
endmodule