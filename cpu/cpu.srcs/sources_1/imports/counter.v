`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/27 09:31:46
// Design Name: 
// Module Name: counter
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


module counter(
      clk,RST,en,Q//en为使能端，Q为输出值
    );
    input clk,RST,en;
    output reg [15:0]Q;
    initial
    begin
    Q=0;
    end
    always @(posedge clk)
    begin
    if(RST==1)Q=0;
    else if(en==1)Q=Q+1;
    end
endmodule
