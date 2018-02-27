`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 10:40:14
// Design Name: 
// Module Name: register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module register(
    rst,Reg1No,Reg2No,WriteRegNo,Din,WriteEnable,clk,Reg1,Reg2
    );
       input rst;
       input [4:0] Reg1No;
       input [4:0] Reg2No;
       input [4:0] WriteRegNo;
       input [31:0] Din;
       input WriteEnable;
       input clk;
       output [31:0] Reg1;
       output [31:0] Reg2;
       reg [31:0] regs [31:0];
       reg [5:0] count;
       initial
       begin 
       for(count = 1'b0; count < 6'b100000;count = count + 1'b1)
           regs[count[4:0]]=32'b0;
       end
       always @(negedge clk)
       begin
           if(rst) begin
               for(count = 1'b0; count < 6'b100000;count = count + 1'b1)
                  regs[count[4:0]]=32'b0;
           end
           else if(WriteEnable == 1'b1 && WriteRegNo != 0)
              regs[WriteRegNo]=Din;
       end
       
       
       assign Reg1 = regs[Reg1No];
       assign Reg2 = regs[Reg2No];
endmodule
