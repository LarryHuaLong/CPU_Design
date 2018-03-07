module Redirector( Control_signals,
                   EX_Data,
                   EX_OP,
                   EX_RF_WE,
                   EX_rW,
                   MEM_Data,
                   MEM_RF_WE,
                   MEM_rW,
                   rA,
                   rB,
                   Load_Use,
                   redirect_RF_A,
                   redirect_RF_B,
                   redirected_RF_A,
                   redirected_RF_B);
   input[31:0]  Control_signals;
   input[31:0]  EX_Data;
   input[5:0]  EX_OP;
   input  EX_RF_WE;
   input[4:0]  EX_rW;
   input[31:0]  MEM_Data;
   input  MEM_RF_WE;
   input[4:0]  MEM_rW;
   input[4:0]  rA;
   input[4:0]  rB;
   output Load_Use;
   output redirect_RF_A;
   output redirect_RF_B;
   output[31:0] redirected_RF_A;
   output[31:0] redirected_RF_B;
   
   wire read_rA,read_rB,syscall;
   wire EX_lh,EX_lw,EX_sw;
   wire access_DM;
   assign read_rA = Control_signals[6];
   assign read_rB = Control_signals[5];
   assign syscall = Control_signals[8];
   assign EX_lh = EX_OP == 6'h21;
   assign EX_lw = EX_OP == 6'h23;
   assign EX_sw = EX_OP == 6'h2b;
   assign access_DM = EX_lh | EX_lw | EX_sw;
   
   wire rA_in_EX_read;
   wire rB_in_EX_read;
   wire rA_in_EX_syscall;
   wire rB_in_EX_syscall;
   wire rA_in_MEM_read;
   wire rB_in_MEM_read;
   wire rA_in_MEM_syscall;
   wire rB_in_MEM_syscall;
   assign rA_in_EX_read = read_rA&(rA == EX_rW);
   assign rB_in_EX_read = read_rB&(rB == EX_rW);
   assign rA_in_EX_syscall = syscall&(EX_rW == 5'h02);
   assign rB_in_EX_syscall = syscall&(EX_rW == 5'h04);
   assign rA_in_MEM_read = read_rA&(rA == MEM_rW);
   assign rB_in_MEM_read = read_rB&(rB == MEM_rW);
   assign rA_in_MEM_syscall = syscall&(MEM_rW == 5'h02);
   assign rB_in_MEM_syscall = syscall&(MEM_rW == 5'h04);
   
   wire collision_in_EX;
   wire collision_in_MEM;
   wire redirect;
   assign collision_in_EX = EX_RF_WE&((rA_in_EX_read | rB_in_EX_read)&(EX_rW != 5'b0) 
										| rA_in_EX_syscall 
										| rB_in_EX_syscall);
   assign collision_in_MEM = MEM_RF_WE&((rA_in_MEM_read | rB_in_MEM_read)&(MEM_rW != 5'b0) 
										| rA_in_MEM_syscall 
										| rB_in_MEM_syscall);
   assign redirect = collision_in_EX & !access_DM | collision_in_MEM;
   
   wire EX_Data_to_RF_A;
   wire EX_Data_to_RF_B;
   assign EX_Data_to_RF_A = collision_in_EX & (rA_in_EX_read | rA_in_EX_syscall);
   assign EX_Data_to_RF_B = collision_in_EX & (rB_in_EX_read | rB_in_EX_syscall);
   
   assign Load_Use = collision_in_EX & access_DM;
   assign redirect_RF_A = EX_Data_to_RF_A | collision_in_MEM&(rA_in_MEM_read | rA_in_MEM_syscall);
   assign redirect_RF_B = EX_Data_to_RF_B | collision_in_MEM&(rB_in_MEM_read | rB_in_MEM_syscall);
   assign redirected_RF_A = EX_Data_to_RF_A ? EX_Data : MEM_Data;
   assign redirected_RF_B = EX_Data_to_RF_B ? EX_Data : MEM_Data;
   
   endmodule
