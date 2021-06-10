module predictor_trigger_control (	input 		clock,
												output reg	latch_trigger,
												output reg	update_trigger,
												output reg	predict_trigger,
												output reg	output_trigger,
												output reg 	update_enable, 
												output reg 	predict_enable,
												output reg 	output_enable);
												
												
	integer i = 0; 
	integer j = 0;											
	always @ (posedge clock) begin
		case (i)
			0: begin
				latch_trigger <= 1;
				update_trigger <= 0;
				predict_trigger <= 0;
				output_trigger <= 0;
				i = i + 1;
			end
			1 : begin
				latch_trigger <= 0;
				update_trigger <= 1;
				predict_trigger <= 0;
				output_trigger <= 0;
				i = i + 1;
			end
			2 : begin
				latch_trigger <= 0;
				update_trigger <= 0;
				predict_trigger <= 1;
				output_trigger <= 0;
				i = i + 1;
			end
			3 : begin
				latch_trigger <= 0;
				update_trigger <= 0;
				predict_trigger <= 0;
				output_trigger <= 1;
				i = 0;
			end
		endcase
	end
	
	always @ (negedge clock) begin
		case (j)
			0: begin
				update_enable <= 1;
				predict_enable <= 0;
				output_enable <= 0;
				j = j + 1;
			end
			1: begin
				update_enable <= 0;
				predict_enable <= 1;
				output_enable <= 0;
				j = j + 1;
			end
			2: begin
				update_enable <= 0;
				predict_enable <= 0;
				output_enable <= 1;
				j = j + 1;
			end
			3: begin
				update_enable <= 0;
				predict_enable <= 0;
				output_enable <= 0;
				j = 0;
			end
		endcase
	end
	
endmodule
