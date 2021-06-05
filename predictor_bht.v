module predictor_bht	 (	input [10:0]	latched_branch_addr,
								input [10:0]	fifo_branch_addr,
								input				predict_clock,
								input				update_clock,
								input 			branch_result,
								output reg		prediction,
								output reg [1:0] updated_state);
								
	reg [12:0] mem [255:0];
	integer i;
	
	initial begin
		for (i = 0; i < 256; i = i + 1) begin
			mem[i] = 13'b0000000000001;
		end
	end
	
	// Asegurarse que desde afuera no se enciendan update y predict a la vez
	
	
	always @ (posedge predict_clock) begin
		// si hay hit saco la prediccion
		if (mem[latched_branch_addr[7:0]][12:2] == latched_branch_addr) begin
			prediction <= mem[latched_branch_addr[7:0]][1];
		// si no hay hit. cargo la nueva address y le doy state default
		end else begin
			prediction <= 1'b1;
		end
	end
	
	always @ (posedge update_clock) begin
		case (mem[fifo_branch_addr[7:0]][1:0])
			2'b00 : mem[fifo_branch_addr[7:0]][1:0] = branch_result ? 2'b01 : 2'b00;
			2'b01 : mem[fifo_branch_addr[7:0]][1:0] = branch_result ? 2'b10 : 2'b00;
			2'b10 : mem[fifo_branch_addr[7:0]][1:0] = branch_result ? 2'b11 : 2'b01;
			2'b11 : mem[fifo_branch_addr[7:0]][1:0] = branch_result ? 2'b11 : 2'b10;
		endcase
		mem[fifo_branch_addr[7:0]][12:2] = fifo_branch_addr;
		updated_state = mem[fifo_branch_addr[7:0]][1:0];
	end
endmodule