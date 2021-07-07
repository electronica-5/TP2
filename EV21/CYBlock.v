module CYBlock (CLK, ALUC, CY_IN, CY_OUT);

	input CLK, CY_OUT;
	input [3:0] ALUC;
		
	output reg CY_IN;
	
	always @ (posedge CLK)
	begin
	
		case (ALUC)
		
			4,5,11,12:  CY_IN = CY_OUT;	 
			default:;
		
		endcase
		
	end
		
endmodule 


