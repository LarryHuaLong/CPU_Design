`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 10:31:04
// Design Name: 
// Module Name: storage
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


module storage(
     r_address,address,datain,clk,str,ld,dataout,r_dataout,clr
    );
	input [11:0]r_address;
    input [11:0]address;
    input [31:0]datain;
    input clk,str,ld,clr;
    output [31:0]dataout;
    output [31:0]r_dataout;
    
    assign dataout = data[address];
    assign r_dataout = data[r_address];
	
    reg [31:0]data[0:63];
    integer i;
    initial 
    begin
    for(i=0;i<=63;i=i+1)
      data[i]=32'h00000000;
    end
    always 
    @(negedge clk)begin
    if(clr==1)
       for(i=0;i<=63;i=i+1)
         data[i]=32'h00000000;
    if(str==1'b1)data[address]=datain;
    end
endmodule