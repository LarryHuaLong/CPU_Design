`timescale 1ns/1ps
module devider(input CLK100MHZ,
     output reg clk
     );
     parameter [31:0]N = 5000;//Ĭ�Ϸֳ�10000HzƵ
     reg [31:0]count = 0;
     initial clk = 0;
     initial count = 0;
     always @(posedge CLK100MHZ)
        if(count == N)
            begin
                count = 0;
                clk = ~clk;
            end
        else count = count + 1;
endmodule