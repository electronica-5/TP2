module MUX_C (
    C5,
    restore,
    Cout,
	 branch_update_in,
	 branch_update_out
);
    
    input [5:0] C5;
    input restore;
	 input branch_update_in;
	 output reg branch_update_out;
    output reg [5:0] Cout;

    always @* begin
        Cout = C5;
        branch_update_out = branch_update_in;
		  if(restore == 1) begin
				branch_update_out = 0;
            Cout = 35;
        end
    end
endmodule