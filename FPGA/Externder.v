module Extender( IR,
                 extend_IMM,
                 extend_shamt,
                 zero_ext_IMM,
                 IMM);
   input[31:0]  IR;
   input  extend_IMM;
   input  extend_shamt;
   input  zero_ext_IMM;
   output[31:0] IMM;
   
   wire [15:0]IM_IMM;
   wire [4:0]IM_shamt;
   wire [16:0]extender_in;
   wire [31:0]extender_out;
   
   assign IM_IMM = IR[15:0];
   assign IM_shamt = IR[10:6];
   assign extender_out = extender_in[16] ? {16'hffff,extender_in[15:0]} : {16'h0000,extender_in[15:0]};
   assign extender_in = extend_IMM ? (zero_ext_IMM ? {1'b0,IM_IMM} : {IM_IMM[15],IM_IMM})
									: (extend_shamt ? {12'h000,IM_shamt} : 17'h0000a);
   assign IMM = extender_out;
   
endmodule
