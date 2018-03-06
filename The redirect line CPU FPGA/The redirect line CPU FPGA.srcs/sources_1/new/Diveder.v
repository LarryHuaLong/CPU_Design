`timescale 1ns / 1ps
module Divider(clk,
               clkout);
    input clk;
    output reg clkout;
	
    reg [31:0] count;
    
    parameter n = 250000;
	
    initial
        count = 32'd0;
		
    always@(posedge clk)
    begin
        if(count == n)
			begin
				clkout = ~clkout;
				count = 0;
			end
        else
            count = count + 32'd1;
    end
endmodule
