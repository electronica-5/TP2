module UC1(ALU_in, SH_in,M2,C2,T2,HOLD,CLK3,M3,ALU_out, SH_out,C3,T3);

input [3:0]ALU_in;
input [1:0]SH_in;
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

always @(posedge CLK3)
	begin
		if(HOLD)
			begin
				T3 = T_out;
				M3 = M_out;
				C3 = C_out;
				ALU_out = ALU_o;
				SH_out = 2'b00;

				if(hold_was_used == 0)
				begin
					hold_was_used = 1;
					ALU_save	= ALU_in;
					SH_save		= SH_in;
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
					ALU_out = ALU_in;
					SH_out = SH_in;
				end
				else
				begin
					ALU_out		= ALU_save;
					SH_out 		= SH_save;	
					T3			= T2_save;	
					C3			= C2_save;	
					M3			= M_save;
					hold_was_used = 0;	
				end
			end
	end



endmodule 