module PC ( input               	clock,
            input               	preload,
				input [10:0]       	preload_addr,
            input [9:0]        	relative_addr,
				input               	jsr,
            input               	ret,
            output reg [10:0]   	pc,
				output reg [10:0]		incr_pc,
				output reg [10:0]		addr_mem_0,
				output reg [10:0]		addr_mem_1,
				output reg [10:0]		addr_mem_2,
				output reg [10:0]		addr_mem_3);

    reg [10:0] addr_mem [3:0];
    reg [10:0] curr_pc;
	 
	 integer i;

    initial begin
        curr_pc = 0;
        pc = 0;
		  i = 0;
    end

	always @(posedge clock) begin

		if (jsr) begin
			if (i < 4) begin
				addr_mem[i] = curr_pc;
				pc = curr_pc + relative_addr + 1;
				i = i + 1;
			end
		end else if (ret) begin
			if (i > 0) begin
				pc = addr_mem[i-1] + 1;
				i = i - 1;
			end
		end else if(preload) begin
			pc = preload_addr;
		end else begin
			pc = curr_pc + 1;
		end
		curr_pc = pc;
		incr_pc = pc + 1;
		addr_mem_0 = addr_mem[0];
		addr_mem_1 = addr_mem[1];
		addr_mem_2 = addr_mem[2];
		addr_mem_3 = addr_mem[3];
	end
endmodule