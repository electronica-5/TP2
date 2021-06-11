module IRegister(
	
	PR_code, 
	enable,					// viene de hacer CLK and !HOLD
	IR_code,
	relative_jump,
	bsr_det,
	ret_det,
	enable_current,
	enable_next);
	
	input enable_current;
	input enable_next;
	input [21:0]PR_code;
	input enable;
	
	output reg [21:0]IR_code;
	output reg bsr_det;
	output reg ret_det;
	output reg [9:0] relative_jump;

	parameter bsr = 12'b011100000000;
	parameter ret = 22'b0000011000000000000000;
	
	always @(*)
		begin
				IR_code= PR_code;
		end

		
	always @(posedge enable_current)	begin
		if( PR_code == ret) begin
			ret_det=1;
			bsr_det=0;
		end
		else if (PR_code[21:10] == bsr) begin
			bsr_det=1;
			ret_det=0;
			relative_jump = PR_code[9:0];
		end else begin
			bsr_det=0;
			ret_det=0;
		end
	end
	
endmodule