module EX_MEM( clk,
               clear,
               lock,
			   reset,
               EX_ALU_R,
               EX_CTRL,
               EX_HALT,
               EX_PC,
               EX_PC_plus_1,
               EX_RF_B,
               EX_rW,
               MEM_ALU_R,
               MEM_CTRL,
               MEM_HALT,
               MEM_PC,
               MEM_PC_plus_1,
               MEM_RF_B,
               MEM_rW);
   input  clk;
   input  clear;
   input  lock;
   input  reset;
   input[31:0]  EX_ALU_R;
   input[31:0]  EX_CTRL;
   input  EX_HALT;
   input[31:0]  EX_PC;
   input[31:0]  EX_PC_plus_1;
   input[31:0]  EX_RF_B;
   input[4:0]  EX_rW;
   output[31:0] MEM_ALU_R;
   output[31:0] MEM_CTRL;
   output MEM_HALT;
   output[31:0] MEM_PC;
   output[31:0] MEM_PC_plus_1;
   output[31:0] MEM_RF_B;
   output[4:0] MEM_rW;
   
   reg[31:0] reg_MEM_ALU_R;
   reg[31:0] reg_MEM_CTRL;
   reg reg_MEM_HALT;
   reg[31:0] reg_MEM_PC;
   reg[31:0] reg_MEM_PC_plus_1;
   reg[31:0] reg_MEM_RF_B;
   reg[4:0] reg_MEM_rW;
   assign MEM_ALU_R = reg_MEM_ALU_R;
   assign MEM_CTRL = reg_MEM_CTRL;
   assign MEM_HALT = reg_MEM_HALT;
   assign MEM_PC = reg_MEM_PC;
   assign MEM_PC_plus_1 = reg_MEM_PC_plus_1;
   assign MEM_RF_B = reg_MEM_RF_B;
   assign MEM_rW = reg_MEM_rW;
   initial begin
       reg_MEM_ALU_R <= 0;
       reg_MEM_CTRL <= 0;
       reg_MEM_HALT <= 0;
       reg_MEM_PC <= 0;
       reg_MEM_PC_plus_1 <= 0;
       reg_MEM_RF_B <= 0;
       reg_MEM_rW <= 0;
   end
   always@(posedge clk)
	if(reset || lock&&clear)
		begin
			reg_MEM_ALU_R <= 0;
			reg_MEM_CTRL <= 0;
			reg_MEM_HALT <= 0;
			reg_MEM_PC <= 0;
			reg_MEM_PC_plus_1 <= 0;
			reg_MEM_RF_B <= 0;
			reg_MEM_rW <= 0;
		end
	else if(lock&&!clear)
		begin
			reg_MEM_ALU_R <= EX_ALU_R;
			reg_MEM_CTRL <= EX_CTRL;
			reg_MEM_HALT <= EX_HALT;
			reg_MEM_PC <= EX_PC;
			reg_MEM_PC_plus_1 <= EX_PC_plus_1;
			reg_MEM_RF_B <= EX_RF_B;
			reg_MEM_rW <= EX_rW;
		end
   
endmodule