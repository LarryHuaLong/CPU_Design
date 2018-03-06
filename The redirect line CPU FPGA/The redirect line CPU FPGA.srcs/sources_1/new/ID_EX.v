module ID_EX( clk,
              clear,
              lock,
			  reset,
              ID_CTRL,
              ID_IMM,
              ID_IR,
              ID_PC,
              ID_PC_plus_1,
              ID_RF_A,
              ID_RF_B,
              ID_rW,
              EX_CTRL,
              EX_IMM,
              EX_IR,
              EX_PC,
              EX_PC_plus_1,
              EX_RF_A,
              EX_RF_B,
              EX_rW);
   input clk;
   input clear;
   input lock;
   input reset;
   input[31:0] ID_CTRL;
   input[31:0] ID_IMM;
   input[31:0] ID_IR;
   input[31:0] ID_PC;
   input[31:0] ID_PC_plus_1;
   input[31:0] ID_RF_A;
   input[31:0] ID_RF_B;
   input[4:0] ID_rW;
   output[31:0] EX_CTRL;
   output[31:0] EX_IMM;
   output[31:0] EX_IR;
   output[31:0] EX_PC;
   output[31:0] EX_PC_plus_1;
   output[31:0] EX_RF_A;
   output[31:0] EX_RF_B;
   output[4:0] EX_rW;
   
   reg[31:0] reg_EX_CTRL;
   reg[31:0] reg_EX_IMM;
   reg[31:0] reg_EX_IR;
   reg[31:0] reg_EX_PC;
   reg[31:0] reg_EX_PC_plus_1;
   reg[31:0] reg_EX_RF_A;
   reg[31:0] reg_EX_RF_B;
   reg[4:0] reg_EX_rW;
   
   assign EX_CTRL = reg_EX_CTRL;
   assign EX_IMM = reg_EX_IMM;
   assign EX_IR = reg_EX_IR;
   assign EX_PC = reg_EX_PC;
   assign EX_PC_plus_1 = reg_EX_PC_plus_1;
   assign EX_RF_A = reg_EX_RF_A;
   assign EX_RF_B = reg_EX_RF_B;
   assign EX_rW = reg_EX_rW;
   
   always@(posedge clk)
	if(reset || lock&&clear)
		begin
			reg_EX_CTRL <= 0;
			reg_EX_IMM <= 0;
			reg_EX_IR <= 0;
			reg_EX_PC <= 0;
			reg_EX_PC_plus_1 <= 0;
			reg_EX_RF_A <= 0;
			reg_EX_RF_B <= 0;
			reg_EX_rW <= 0;
		end
	else if(lock&&!clear)
		begin
			reg_EX_CTRL <= ID_CTRL;
			reg_EX_IMM <= ID_IMM;
			reg_EX_IR <= ID_IR;
			reg_EX_PC <= ID_PC;
			reg_EX_PC_plus_1 <= ID_PC_plus_1;
			reg_EX_RF_A <= ID_RF_A;
			reg_EX_RF_B <= ID_RF_B;
			reg_EX_rW <= ID_rW;
		end
   
   
endmodule