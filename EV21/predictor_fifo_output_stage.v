module predictor_fifo_output_stage (	input [24:0] 		data,
													output reg [10:0]	fifo_branch_addr,
													output reg [10:0] fifo_jump_addr,
													output reg [1:0]	fifo_branch_type,
													output reg			fifo_branch_taken);
													
	always begin
		fifo_branch_addr	<= data[24:14];
		fifo_jump_addr		<= data[13:3];
		fifo_branch_type	<= data[2:1];
		fifo_branch_taken	<= data[0];
	
	end
endmodule