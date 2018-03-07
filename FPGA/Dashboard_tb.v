`timescale 1ns/1ps
module Dashboard_tb;
    reg clk;
    reg BTNC,BTNU,BTND,BTNL,BTNR;
    reg [15:0]SW;
    wire [7:0]anodes;
    wire [7:0]cathodes;
      
    Dashboard dashboard(clk,
                        BTNC,
                        BTNU,
                        BTND,
                        BTNL,
                        BTNR,
                        SW,
                        anodes,
                        cathodes);
    initial begin
        clk = 0;
        BTNC = 1;
        BTNU = 0;
        BTND = 0;
        BTNL = 0;
        BTNR = 0;
        SW = 0;
    end    
    always # 1 clk = ~clk;
    initial begin
        #10 BTNC = 0;
        #30000
        BTNL = 1;
        #10 BTNL = 0;
        #10 BTNR = 1;
        #10 SW = 1; 
        #10 SW = 2; 
        #10 SW = 3; 
        #10 BTNR = 0; 
        #10 BTND = 1; 
        #10 SW = 0; 
        #10 SW = 1; 
        #10 SW = 2; 
        #10 SW = 3; 
        #10 SW = 4; 
        #10 SW = 5; 
        #10 SW = 6; 
        #10 SW = 7; 
        #10 SW = 8; 
        #10 SW = 9; 
        #10 SW = 10; 
        #10 SW = 11; 
        #10 SW = 12; 
        #10 SW = 13; 
        #10 SW = 14; 
        #10 SW = 15; 
        #10 BTND = 0; 
        $finish;
    end
        
        
endmodule        