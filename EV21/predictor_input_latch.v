module predictor_input_latch (	input [21:0]	branch,
											input [10:0]	branch_addr,
											input [15:0]	W,
											input				CY,
											input				exec_done,
											input				clock,
											output reg [10:0] latched_jump_addr,
											output reg [21:0]	latched_branch,
											output reg [10:0] latched_branch_addr,
											output reg [15:0]	latched_W,
											output reg			latched_CY,
											output reg 			latched_exec_done);
											
	always @ (posedge clock) begin
		latched_branch <= branch;
		latched_branch_addr <= branch_addr;
		latched_W <= W;
		latched_CY <= CY;
		latched_exec_done <= exec_done;
		latched_jump_addr <= branch_addr[10:0];
	end
	
endmodule