`timescale 1ns / 1ps
module register(clk,
				rst,
				Reg1No,
				Reg2No,
				Din,
				WriteRegNo,
				WriteEnable,
				Reg1,
				Reg2);
   input clk;
   input rst;
   input [4:0] Reg1No;
   input [4:0] Reg2No;
   input [4:0] WriteRegNo;
   input [31:0] Din;
   input WriteEnable;
   output [31:0] Reg1;
   output [31:0] Reg2;
   
   reg [31:0] regs [31:0];
   
   assign Reg1 = regs[Reg1No];
   assign Reg2 = regs[Reg2No];
   
   integer count;
   initial
	   begin 
		   for(count = 0; count < 32;count = count + 1)
			   regs[count[4:0]] <= 32'b0;
	   end
   always @(negedge clk)
	   begin
			if(rst) 
				for(count = 0; count < 32;count = count + 1)
					regs[count[4:0]] <= 32'b0;
			else if(WriteEnable && WriteRegNo != 0)
					regs[WriteRegNo] <= Din;
	   end
endmodule
