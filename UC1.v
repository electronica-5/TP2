module UC1(ALU_in, SH_in,M2,B2,C2,T2,HOLD,CLK3,M3,ALU_out, SH_out,C3,T3);

input [3:0]ALU_in;
input [1:0]SH_in;
input [5:0]B2;
input [6:0]T2;
input [5:0]C2;
input HOLD;
input CLK3;
input [1:0]M2;

output reg [3:0]ALU_out;
output reg [1:0]SH_out;
output reg [1:0]M3;
output reg [6:0]T3;
output reg [5:0]C3;



parameter T_out = 0;
parameter M_out = 0;
parameter C_out = 6'b100011;
parameter ALU_o = 4'b1111;

always @(posedge CLK3)
	begin
		if(HOLD)
			begin
				T3 = T_out;
				M3 = M_out;
				C3 = C_out;
				ALU_out = ALU_o;
				SH_out = 2'b00;
			end
		else
			begin
				T3 = T2;
				M3 = M2;
				C3 = C2;
				ALU_out = ALU_in;
				SH_out = SH_in;
			end
			
	
	
	
	end



endmodule 