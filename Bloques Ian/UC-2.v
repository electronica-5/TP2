//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//					Bloque UC-2							//
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

/*********************************************************
Detalles de los bits de T: 	(0 -> Menos significativo)
							(1 -> Más significativo)
		T[0] -> Se lee W
		T[1] -> Se escribe en W
		T[2] -> Leen un registro Rj/POj
		T[3] -> Escriben un registro Ri/POi
		T[4] -> Se lee el CY
		T[5] -> Se escribe el CY
		T[6] -> Se escribe el PC

*********************************************************/


module UC_2 (A2, B2, T2, C3, T3, C4, T4, C5, T5, HOLD, branch_update);
/********************************************************************
Bloque UC-2 encargado de hacer la lógica para Holdear el pipeline en 
caso de que se necesite utilizar un registro/carry en una microintrucción
posterior a una que lo modifique.

Tambien este bloque se va a comunicar con el Bloque de Branch con el fin
de avisarle cuando la microinstrucción previa a la del branch haya finalizado,
es decir, cuando la microinstrucción del branch entre a la etapa de
'execute'.
*********************************************************************/
	input reg [4:0] A2;
	input reg [5:0] B2;
	input reg [6:0] T2;
	input reg [5:0] C3;
	input reg [6:0] T3;
	input reg [5:0] C4;
	input reg [6:0] T4;
	input reg [5:0] C5;
	input reg [6:0] T5;
	output reg HOLD;
	output reg branch_update;

	parameter WR_read = 0;
	parameter WR_write = 1;
	parameter R_read = 2;
	parameter R_write = 3;
	parameter C_read = 4;
	parameter C_write = 5;

	always @*
	begin
		HOLD = 0;
		branch_update = 0;
		if(T2[WR_read] and (T3[WR_write] or T4[WR_write] or T5[WR_write]))	//Que el WR no se este usando
			HOLD = 1;

		if(T2[C_read] and (T3[WR_write] or T4[WR_write] or T5[WR_write]))	// Que el carry no se necesite usar
			HOLD = 1
		
		if(T2[R_read] and T3[R_write] and A2 == C3[4:0])					// Que el registro Ri no se este usando
			HOLD = 1;
		if(T2[R_read] and T4[R_write] and A2 == C4[4:0])
			HOLD = 1;
		if(T2[R_read] and T5[R_write] and A2 == C5[4:0])
			HOLD = 1;

		if((T4 == 7'b1000001) or (T4 == 7'b1010000)) 						// Si un branch se esta por ejecutar, le aviso a licha.
			branch_update = 1;

	end

endmodule