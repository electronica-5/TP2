module UC1(ALU2, SH2,M2,C2,T2,HOLD,CLK,M3,ALU3, SH3,C3,T3);

input [3:0]ALU2;
input [1:0]SH2;
input [6:0]T2;
input [5:0]C2;
input HOLD;
input CLK;
input [1:0]M2;

output reg [3:0]ALU3;
output reg [1:0]SH3;
output reg [1:0]M3;
output reg [6:0]T3;
output reg [5:0]C3;

reg hold_was_used = 0;
reg [3:0]ALU_save;
reg [1:0]SH_save;
reg [6:0]T2_save;
reg [5:0]C2_save;
reg [1:0]M_save;

parameter T_out = 0;
parameter M_out = 0;
parameter C_out = 6'b100011;
parameter ALU_o = 4'b1111;

always @(posedge CLK)
	begin
		if(HOLD)
			begin
				T3 = T_out;
				M3 = M_out;
				C3 = C_out;
				ALU3 = ALU_o;
				SH3 = 2'b00;

				if(hold_was_used == 0)
				begin
					hold_was_used = 1;
					ALU_save	= ALU2;
					SH_save		= SH2;
					T2_save		= T2;
					C2_save		= C2;
					M_save		= M2;
				end
			end
		else
			begin
				if(hold_was_used == 0)
				begin
					T3 = T2;
					M3 = M2;
					C3 = C2;
					ALU3 = ALU2;
					SH3 = SH2;
				end
				else
				begin
					ALU3		= ALU_save;
					SH3 		= SH_save;	
					T3			= T2_save;	
					C3			= C2_save;	
					M3			= M_save;
					hold_was_used = 0;	
				end
			end
	end



endmodule 