module Register_Bank(TO_W, MR, IN_0, IN_1, FROM_C, A_CTRL, B_CTRL, C_CTRL, CLK, OUT_0, OUT_1, FROM_W, TO_A, TO_B);
	input wire [15:0] TO_W, IN_0, IN_1, FROM_C;
	input wire [4:0] A_CTRL;
	input wire [5:0] B_CTRL, C_CTRL;
	input wire MR, CLK;
	
	output wire [15:0] OUT_0, OUT_1, FROM_W, TO_A, TO_B;

	reg[15:0] registers[34:0];
	reg [15:0] R_TO_A, R_TO_B;
	
	assign FROM_W = registers[34];
	assign OUT_1 = registers[31];
	assign OUT_0 = registers[30];
	
	always @ (*) begin
		if (A_CTRL < 6'd35) begin
			R_TO_A = registers[A_CTRL];
		end else begin
			R_TO_A = 16'd0;
		end
		
		if (B_CTRL < 6'd35) begin
			R_TO_B = registers[B_CTRL];
		end else begin
			R_TO_B = 16'd0;
		end
	end

	
	
	always @(posedge CLK) begin
		if (MR==1) begin
			registers[34] <= TO_W;
		end
		if (C_CTRL < 6'd35) begin
			registers[C_CTRL] <= FROM_C;
		end
		registers[29]<=IN_1;
		registers[28]<=IN_0;
	end
	
	assign TO_A = R_TO_A;
	assign TO_B = R_TO_B;
	
endmodule