module Shifter (IN, SH, OUT);

	input [15:0] IN;
	input [1:0] SH;
	
	output reg [15:0] OUT;

	always @ (IN or SH)
	begin
	
		case (SH)
		
			0:  OUT = IN; //No Shift
			1:	 OUT = IN >> 1; //Shift Right
			2:  OUT = IN << 1; //Shift Left

			default: OUT = IN; //No Shift
			
		endcase
	end
		
endmodule 