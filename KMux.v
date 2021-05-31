module KMux (X,Y,KMx, OUT);

	input [15:0] X, Y;
	input KMx;
	output reg [15:0] OUT;
	
	always @ (X or Y or KMx)
	begin
	OUT = KMx ? Y : X; //Si Kmx = 0 -> OUT = X
	end

endmodule

