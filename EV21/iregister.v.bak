module IRegister(
	
	PR_code, 
	enable,					// viene de hacer CLK and !HOLD
	IR_code,
	bsr_det,
	ret_det);
	
	input [21:0]PR_code;
	input enable;
	
	output reg [21:0]IR_code;
	output reg bsr_det;
	output reg ret_det;

	parameter bsr = 12'b011100000000;
	parameter ret = 22'b0000011000000000000000;
	
	always @(posedge enable)
		begin
				IR_code= PR_code;
		end

		
	always @(PR_code)
	begin
		if( PR_code == ret )
			begin
				ret_det=1;
				bsr_det=0;
					
			end
		else if (PR_code[21:10] == bsr)
			begin
					bsr_det=1;
					ret_det=0;
			end
			
		else
			begin
					bsr_det=0;
					ret_det=0;
			end
		
		
	end
		

	endmodule
	