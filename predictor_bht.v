module predictor_bht (	input [10:0] 	branch_addr,
								input				predict,
								input				update,
								input 			branch_result,
								input 			clock,
								output reg			prediction,
								output reg [1:0]	prediction_state_debug,
								output reg [10:0] prediction_addr_debug);
								
	reg [12:0] mem [255:0];
	integer i;
	
	initial begin
		for (i = 0; i < 256; i = i + 1) begin
			mem[i] = 0;
		end
	end
	
	// Asegurarse que desde afuera no se enciendan update y predict a la vez
	
	always @ (posedge clock) begin
		// hacer prediccion
		if (predict) begin
			// si hay hit saco la prediccion
			if (mem[branch_addr[7:0]][12:2] == branch_addr) begin
				prediction <= mem[branch_addr[7:0]][1];
				
				prediction_state_debug <= mem[branch_addr[7:0]][1:0];
				prediction_addr_debug <= mem[branch_addr[7:0]][12:2];
			// si no hay hit. cargo la nueva address y le doy state default
			end else begin
				mem[branch_addr[7:0]][12:2] <= branch_addr;
				mem[branch_addr[7:0]][1:0] <= 2'b10;
				prediction <= 1'b1;
			end
		end
		
		//actualizar bht
		if (update) begin
			// si hay hit le shifteo el resultado al state
			if (mem[branch_addr[7:0]][12:2] == branch_addr) begin
				mem[branch_addr[7:0]][1:0] <= (branch_result << 1) + prediction;
			// si no hay hit, cargo la address y le doy state default
			end else begin
				mem[branch_addr[7:0]][12:2] <= branch_addr;
				mem[branch_addr[7:0]][1:0] <= 2'b10;
			end
		end
	end
	
endmodule