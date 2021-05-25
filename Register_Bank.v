module Register_Bank(TO_W, MR, IN_0, IN_1, FROM_C, CK5, A_CTRL, B_CTRL, C_CTRL, CLK, OUT_0, OUT_1, FROM_W, TO_A, TO_B);
	input wire [15:0] TO_W, IN_0, IN_1, FROM_C;
	input wire [4:0] A_CTRL, B_CTRL, C_CTRL;
	input wire MR, CK5, CLK;
	
	output wire [15:0] OUT_0, OUT_1, FROM_W, TO_A, TO_B;

	reg[15:0] registers[34:0];
	reg [15:0] R_TO_A, R_TO_B;
	
	assign FROM_W = registers[34];
	assign OUT_1 = registers[31];
	assign OUT_0 = registers[30];
	
	always @ (*) begin
		assign registers[29]=IN_1;
		assign registers[28]=IN_0;
	end
	
	always @ (*) begin
		if (to_integer($unsigned(A_CTRL)) < 35) begin
			R_TO_A = registers[A_CTRL];
		end else begin
			R_TO_A = "0000000000000000";
		end
		
		if (to_integer($unsigned(B_CTRL)) < 35) begin
			R_TO_B = registers[B_CTRL];
		end else begin
			R_TO_B = "0000000000000000";
		end
	end

	always @(posedge CLK) begin
		if (MR==1) begin
			registers[34] <= TO_W;
		end
		if (to_integer($unsigned(C_CTRL)) < 35) begin
			registers[to_integer($unsigned(C_CTRL))] <= FROM_C;
		end
	end
	
	assign TO_A = R_TO_A;
	assign TO_B = R_TO_B;
	
endmodule