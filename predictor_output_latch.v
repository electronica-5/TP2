module predictor_output_latch (	input [10:0]		jump_addr,
											input 				preload,
											input 				restore,
											input 				clock,
											output reg [10:0]	latched_jump_addr,
											output reg			latched_preload,
											output reg			latched_restore);
											
	always @ (posedge clock) begin
		latched_jump_addr <= jump_addr;
		latched_preload <= preload;
		latched_restore <= restore;
	end
	
endmodule