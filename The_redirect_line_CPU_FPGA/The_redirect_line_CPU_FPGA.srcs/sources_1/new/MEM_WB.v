module MEM_WB( clk,
               clear,
               lock,
			   reset,
               MEM_ALU_R,
               MEM_CTRL,
               MEM_DM_D,
               MEM_HALT,
               MEM_PC,
               MEM_PC_plus_1,
               MEM_rW,
               WB_ALU_R,
               WB_CTRL,
               WB_DM_D,
               WB_HALT,
               WB_PC,
               WB_PC_plus_1,
               WB_rW);
   input clk;
   input clear;
   input lock;
   input reset;
   input[31:0] MEM_ALU_R;
   input[31:0] MEM_CTRL;
   input[31:0] MEM_DM_D;
   input MEM_HALT;
   input[31:0] MEM_PC;
   input[31:0] MEM_PC_plus_1;
   input[4:0] MEM_rW;
   output[31:0] WB_ALU_R;
   output[31:0] WB_CTRL;
   output[31:0] WB_DM_D;
   output WB_HALT;
   output[31:0] WB_PC;
   output[31:0] WB_PC_plus_1;
   output[4:0] WB_rW;
   
   reg[31:0] reg_WB_ALU_R;
   reg[31:0] reg_WB_CTRL;
   reg[31:0] reg_WB_DM_D;
   reg reg_WB_HALT;
   reg[31:0] reg_WB_PC;
   reg[31:0] reg_WB_PC_plus_1;
   reg[4:0] reg_WB_rW;

   always@(posedge clk)
	if(reset || lock&&clear)
		begin
			reg_WB_ALU_R <= 0;
			reg_WB_CTRL <= 0;
			reg_WB_DM_D <= 0;
			reg_WB_HALT <= 0;
			reg_WB_PC <= 0;
			reg_WB_PC_plus_1 <= 0;
			reg_WB_rW <= 0;
		end
	else if(lock&&!clear)
		begin
			reg_WB_ALU_R <= MEM_ALU_R;
			reg_WB_CTRL <= MEM_CTRL;
			reg_WB_DM_D <= MEM_DM_D;
			reg_WB_HALT <= MEM_HALT;
			reg_WB_PC <= MEM_PC;
			reg_WB_PC_plus_1 <= MEM_PC_plus_1;
			reg_WB_rW <= MEM_rW;
		end
   
endmodule
