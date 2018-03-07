module IF_ID( clk,
              clear,
              lock,
			  reset,
              IF_IR,
              IF_PC,
              IF_PC_plus_1,
              ID_IR,
              ID_PC,
              ID_PC_plus_1);
   input  clk;
   input  clear;
   input  lock;
   input  reset;
   input[31:0]  IF_IR;
   input[31:0]  IF_PC;
   input[31:0]  IF_PC_plus_1;
   output[31:0] ID_IR;
   output[31:0] ID_PC;
   output[31:0] ID_PC_plus_1;
   
   reg[31:0] reg_ID_IR;
   reg[31:0] reg_ID_PC;
   reg[31:0] reg_ID_PC_plus_1;
   assign ID_IR = reg_ID_IR;
   assign ID_PC = reg_ID_PC;
   assign ID_PC_plus_1 = reg_ID_PC_plus_1;
   
   always@(posedge clk)
	if(reset || lock&&clear)
		begin
			reg_ID_PC <= 0;
			reg_ID_PC_plus_1 <= 0;
			reg_ID_IR <= 0;
		end
	else if(lock&&!clear)
		begin
			reg_ID_PC <= IF_PC;
			reg_ID_PC_plus_1 <= IF_PC_plus_1;
			reg_ID_IR <= IF_IR;
		end
endmodule
