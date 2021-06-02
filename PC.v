//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//					Program Counter					//
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////


module PC (
	incr,
	preload,
	addr,
	jsr, //jump to subrutine
	ret,
	pc
);
	input incr;
	input preload;
	input [10:0] addr;
	input jsr;
	input ret;
	output reg [10:0] pc = 11'd0;

	reg [10:0] saved_pc;
	reg [10:0] pc_latch = 11'd0;
	reg preload_flag;
	reg jsr_flag;
	reg ret_flag;

	always @(posedge incr) begin
		
		if(preload_flag == 0 && jsr_flag == 0 && ret_flag == 0)begin
			pc_latch = pc_latch + 1;
			pc = pc_latch;
			// Siempre que me llegue un posedge del 'clock', actualizo la salida del PC por el que tengo
			// guardado en el registro interno
		end
		if(preload_flag == 1)begin
			//Siempre que me llegue un preload, cambio el registro del proximo PC a el address de entrada
			pc_latch = addr;
			pc = pc_latch;
		end
		if(jsr_flag == 1) begin
			// Si me llega un salto a subrutina, guardo la siguiente posicion del PC y cambio el registro interno del PC
			// a PC= PC+S siendo S el salto relativo desde PC hacia la subrutina.
			saved_pc = pc;
			pc_latch = pc + addr[9:0];
			pc = pc_latch;
		end
		if(ret_flag == 1) begin
			// Si vuelvo de la subrutina, actualizo el registro interno del PC por el PC guardado previamente.
			pc_latch = saved_pc + 1;
			pc = pc_latch;
		end
	end

	always @(preload) begin
		preload_flag = 0;
		if(preload == 1) begin
			preload_flag = 1;
		end
	end

	always @(jsr) begin
		jsr_flag = 0;
		if(jsr == 1) begin
			jsr_flag = 1;
		end
	end

	always @(ret) begin
		ret_flag = 0;
		if(ret == 1) begin
			ret_flag = 1;
		end
	end

endmodule