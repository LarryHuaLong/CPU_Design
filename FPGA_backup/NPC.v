module NPC( ALU_Equal,
            ALU_R,
            CTRL,
            IMM,
            IR,
            PC_plus_1,
            RF_A,
            branch,
            goto,
            jump,
            new_addr);
   input  ALU_Equal;
   input[31:0]  ALU_R;
   input[31:0]  CTRL;
   input[31:0]  IMM;
   input[31:0]  IR;
   input[31:0]  PC_plus_1;
   input[31:0]  RF_A;
   output branch;
   output goto;
   output jump;
   output[31:0] new_addr;
   
   wire bltz,beq,bne,j,jr;
   
   assign bltz = CTRL[9];
   assign beq = CTRL[11];
   assign bne = CTRL[10];
   assign j = CTRL[13];
   assign jr = CTRL[12];
   
   assign branch = ALU_R[0]&bltz | ALU_Equal&beq | !ALU_Equal&bne;
   assign goto = branch | jump;
   assign jump = j;
   assign new_addr = j ? (jr ? RF_A : {PC_plus_1[31:28],IR[25:0],2'b00})
					   : PC_plus_1 + {IMM[29:0],2'b0};
   
endmodule
