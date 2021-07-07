module MUX_C (
    C5,
    restore,
    Cout
);
    
    input [5:0] C5;
    input restore;
    output reg [5:0] Cout;

    always @* begin
        Cout = C5;
        if(restore == 1) begin
            Cout = 35;
        end
    end
endmodule