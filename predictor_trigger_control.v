module predictor_trigger_control (	input 		clock,
												output reg	latch_trigger,
												output reg	update_trigger,
												output reg	predict_trigger,
												output reg	output_trigger);
	reg [1:0] c = 3;
	always @ (posedge clock) begin
		c <= c + 1;
	end
	

	latch_trigger <= c == 0 ? clock : 0;
	update_trigger <= c == 1 ? clock : 0;
	predict_trigger <= c == 2 ? clock : 0;
	output_trigger <= c == 3 ? clock : 0;

	
endmodule
