# Bloque 1

El bloque se encarga de la logica de "forzar" las direcciones del PC que predice el predictor de saltos.

# Mux que carga campo C de la palabra de control

Para algunas microinstrucciones, el campo C de la palabra de control se debe cargar con informacion de la instruccion (B9:B0), en esos casos se debe controlar el mux en cuestion para que en vez de cargar C desde la MIR, lo cargue desde el binario de la instruccion.
