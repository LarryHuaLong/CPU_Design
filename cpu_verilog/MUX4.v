`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 11:37:20
// Design Name: 
// Module Name: MUX4
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


module MUX4(
   data1,data2,data3,data4,sel,dataout
   );
   input [31:0] data1;
   input [31:0] data2;
   input [31:0] data3;
   input [31:0] data4;
   input [1:0] sel;
   output reg [31:0] dataout;
   always@(*)
   begin
       case(sel)
       2'b00: dataout = data1;
       2'b01: dataout = data2;
       2'b10: dataout = data3;
       2'b11: dataout = data4;
       endcase
   end
endmodule