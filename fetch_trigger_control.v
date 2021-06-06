module fetch_trigger_control (	input 		clock,
											input			latched_hold,
											output reg	latch_trigger,
											output reg 	update_pc_trigger,
											output reg	fethc_prog_mem_trigger,
											output reg	decode_instr_trigger,
											output reg	out_latch_trigger);
												
												
	integer i = 0; 
	integer j = 0;											
	always @ (posedge clock) begin
		case (i)
			0: begin
				latch_trigger <= 1;
				update_pc_trigger <= 0;
				fethc_prog_mem_trigger <= 0;
				decode_instr_trigger <= 0;
				out_latch_trigger <= 0;
				i = i + 1;
			end
			1 : begin
				latch_trigger <= 0;
				update_pc_trigger <= 1;
				fethc_prog_mem_trigger <= 0;
				decode_instr_trigger <= 0;
				out_latch_trigger <= 0;
				i = i + 1;
			end
			2 : begin
				latch_trigger <= 0;
				update_pc_trigger <= 0;
				fethc_prog_mem_trigger <= 1;
				decode_instr_trigger <= 0;
				out_latch_trigger <= 0;
				i = i + 1;
			end
			3 : begin
				latch_trigger <= 0;
				update_pc_trigger <= 0;
				fethc_prog_mem_trigger <= 0;
				decode_instr_trigger <= 1;
				out_latch_trigger <= 0;
				i = i + 1;
			end
			4 : begin
				latch_trigger <= 0;
				update_pc_trigger <= 0;
				fethc_prog_mem_trigger <= 0;
				decode_instr_trigger <= 0;
				out_latch_trigger <= 1;
				i = 0;
			end
		endcase
	end
	
endmodule