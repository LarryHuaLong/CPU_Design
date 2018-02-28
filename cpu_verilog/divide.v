`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 11:04:41
// Design Name: 
// Module Name: divide
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


module divide(
    clk,clkout
    );
    input clk;
    output reg clkout;
    reg [31:0] count;
    
    parameter n = 250000;
    initial
    begin 
        count = 32'd0;
    end
    always@(posedge clk)
    begin
        if(count == n)
        begin
            clkout = ~clkout;
            count = 0;
        end
        else
        begin
            count = count + 32'd1;
        end
    end
endmodule
