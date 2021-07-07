module latch_restore (
    restore,
    clk,
    restore_latched
);

	input restore;
	input clk;
	output reg restore_latched;

	integer i=0;
	parameter cant_clock = 5;

	initial begin
		i = 0;
		restore_latched = 0;
	end

	always @(posedge clk) begin
		if(i == 0 && restore == 1) begin
			restore_latched = 1;
			i = 1;
		end

		else if (i > 0 && i < cant_clock) begin
			i = i+1;
		end

		else if (i >= cant_clock) begin
			restore_latched = 0;
			i = 0;
		end
	end

endmodule