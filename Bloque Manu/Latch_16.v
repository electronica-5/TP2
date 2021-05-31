module Latch_16 (CLK, IN, OUT);
	
	input CLK;
	input [15:0] IN; 
	output reg [15:0] OUT;

	
	always @ (posedge CLK)
	begin
	
		OUT = IN;
		
	end
	
endmodule 

