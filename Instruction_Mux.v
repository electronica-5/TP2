


module Instruction_Mux (
    micro_inst_generated,
    instruction,
    micro_instr_out
);
    
    input [32..0] micro_inst_generated;
    input [21..0] instruction;
    output [32..0] micro_instr_out;
endmodule