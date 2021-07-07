module fetch_stage_demux (  input [21:0]        in,
                            input               control,
                            output reg [21:0]   instr_pc,
                            output reg [21:0]   instr_incr_pc);

    always @(*) begin
        if (control) begin
            instr_incr_pc <= in;
            instr_pc <= 21'bz;
        end else begin
            instr_incr_pc <= 21'bz;
            instr_pc <= in;
        end
    end

endmodule