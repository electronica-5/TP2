module predictor_execution_check (	input [15:0] 	W,
												input 			CY,
												output reg		W_zero,
												output reg		W_positive,
												output reg		carry);
												
	always begin
		W_zero <= W == 0 ? 1 : 0;
		W_positive <= W[15] == 0 ? 1 : 0;
		carry <= CY;
	end
	
endmodule