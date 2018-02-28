`timescale 1ns / 1ps

module alu_tb;
            reg [3:0]S;
            reg [31:0]X;
            reg [31:0]Y;
            wire [31:0]Result;
            wire [31:0]Result2;
            wire Equal;
            wire overflow;
            wire UOF;
            ALU alu(S,X,Y,Result,Result2,Equal,overflow,UOF);
            initial begin
                X = 32'h80000000;
                Y = 32'd3;
                S = 0;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                #1 S = S+1;
                $finish;
            end
endmodule
