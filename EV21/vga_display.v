module vga_display(
    input wire board_clk,     // Clock de la FPGA: 50Mhz para Altera De0-Nano EP4CE22F17C6N.
    input wire my_clk,       	// Clock para el manejo de VGA.
    input wire rst,           // Reset a posición inicial. (principalmente para debugeo)
    output wire hs,           // Señal de sincronización horizontal.
    output wire vs,           // señal de sincronización vertical.
    output wire [9:0] currentX,      // Posición actual de píxel: coordenada x.
    output wire [9:0] currentY       // Posición actual de píxel: coordenada y.
    );

	 //Declaracion de parametros y variables:
    
	localparam HS_STA = 16;              // Inicio de sincronización horizontal.
    localparam HS_END = 16 + 96;         // Fin de sincronización horizontal.
    localparam HA_STA = 16 + 96 + 48;    // Inicio de pantalla activa: coordenada horizontal.
    localparam VS_STA = 480 + 11;        // Inicio de pantalla activa: coordenada vertical.
    localparam VS_END = 480 + 11 + 2;    // Inicio de pantalla activa: coordenada horizontal.
    localparam VA_END = 480;             // Inicio de pantalla activa: coordenada vertical.
    localparam LINE   = 800;             // Ancho de pantalla extendida. (Pantalla activa más alrededores)
    localparam SCREEN = 524;             // Alto de pantalla extendida.

    reg [9:0] h_count;  // Posición x de pixel actual en la pantalla extendida. 
    reg [9:0] v_count;  // Posición y de pixel actual en la pantalla extendida. 

    //Asignación de cables:
    
		//Señales de sincronización.
		assign hs = ~((h_count >= HS_STA) & (h_count < HS_END));
		assign vs = ~((v_count >= VS_STA) & (v_count < VS_END));
	
		//Mantener coordenadas de x, y en pantalla activa:
		assign currentX = (h_count < HA_STA) ? 0 : (h_count - HA_STA);
		assign currentY = (v_count >= VA_END) ? (VA_END - 1) : (v_count);


	 //Bloque always para movimiento en pantalla extendida:

    always @ (posedge board_clk)
    begin
        if (rst)  // Reset al principio de la pantalla.
        begin
            h_count <= 0;
            v_count <= 0;
        end
        if (my_clk)  // El bloque if actúa durante el pulso de Clock de VGA.
        begin
            if (h_count == LINE)  // Iteración entre valores de ancho y alto para la pantalla extendida.
            begin
                h_count <= 0;
                v_count <= v_count + 1;
            end
            else 
                h_count <= h_count + 1;

            if (v_count == SCREEN) 
                v_count <= 0;
        end
    end
	 
	 
endmodule