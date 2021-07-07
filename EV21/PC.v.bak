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
	output reg [10:0] pc;

	reg [10:0] saved_pc;
	reg [10:0] pc_latch;

	initial begin
		// Condiciones iniciales del Program Counter
		pc = 11'd0;
		pc_latch = 11'd0;
		saved_pc = 11'd0;
	end

	always @(posedge incr) begin
		// Siempre que me llegue un posedge del 'clock', actualizo la salida del PC por el que tengo
		// guardado en el registro interno
		pc_latch = pc_latch +1;
		pc = pc_latch;
	end

	always @(posedge preload or posedge jsr or posedge ret) begin
		if(preload == 1)begin
			//Siempre que me llegue un preload, cambio el registro del proximo PC a el address de entrada
			pc_latch = addr;
		end
		if(jsr == 1) begin
			// Si me llega un salto a subrutina, guardo la siguiente posicion del PC y cambio el registro interno del PC
			// a PC= PC+S siendo S el salto relativo desde PC hacia la subrutina.
			saved_pc = pc + 1;
			pc_latch = pc + addr[9:0];
		end
		if(ret == 1) begin
			// Si vuelvo de la subrutina, actualizo el registro interno del PC por el PC guardado previamente.
			pc_latch = saved_pc;
		end
		
	end
	
endmodule