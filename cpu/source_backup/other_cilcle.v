`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/27 08:11:38
// Design Name: 
// Module Name: other_cilcle
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


module other_cilcle(
    clk,D,Q,RST
    );
     input clk,D,RST;
             output reg [15:0]Q;//最后一个Q
             reg notQ;
             initial
             begin
             Q=0;
             notQ=0;
             end
             always @(posedge clk)
             begin
             if(RST==1)begin
             notQ=0;
             Q=0;
             end
             else 
             if(D==0)begin
             notQ=1;
             end
             else
             if(D==1)notQ=0;
             if(RST==0&&notQ==1)
             Q=Q+1;
             end
endmodule
