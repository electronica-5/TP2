module PC ( input               clock,
            input               preload,
				input [10:0]        preload_addr,
            input [9:0]        relative_addr,
				input               jsr,
            input               ret,
            output reg [10:0]   pc);

    reg [10:0] addr_mem;
    reg [10:0] curr_pc;

    initial begin
        curr_pc = 0;
        pc = 0;
    end

    always @(posedge clock) begin
        if(preload) begin
            pc = preload_addr;
        end else if (jsr) begin
            addr_mem = curr_pc;
            pc = curr_pc + relative_addr;
        end else if (ret) begin
            pc = addr_mem + 1;
        end else begin
            pc = curr_pc + 1;
        end
        curr_pc = pc;
    end
endmodule