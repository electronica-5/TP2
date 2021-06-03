module MI_ROM (
    instruction,
    micro_instruction,
	 test,
	 test2
);
    input [21:0] instruction;
    output reg [32:0] micro_instruction;

    reg [3:0] ALU=4'b0000;
    reg [1:0] SH= 2'b00;
    reg Kmx =1'b0;
    reg MW=1'b0;
    reg MR=1'b0;
    reg [5:0] Bus_B =0;
    reg [5:0] Bus_C=0;
    reg [6:0] T_word=0;
    reg [4:0] Bus_A;
	
	 output reg [10:0]test; 
	 output reg [10:0]test2;
    always @(instruction)
        begin
           if(instruction[21:11] == 11'b10000000000) //jUMP X
            begin
                ALU=0;
                SH=0;
                Kmx=0;
                MR=0;
                MW=0;
                Bus_B= 6'b100010;
                Bus_C= 6'b100010;
                T_word=7'b1000000;
                Bus_A=5'b00000;
                micro_instruction= {ALU,SH,Kmx,MR,MW,Bus_B,Bus_C,T_word,Bus_A};
					 
            end

				else
					micro_instruction=1;
					test=instruction[21:11];
					test2=11'b10000000000;



        end

endmodule