module predictor_aux_counter (	input clock,
											output reg [1:0] count);
	
	initial begin
		count <= 0;
	end
	always @ (posedge clock) begin
		count <= count + 1;
	end
	
endmodule