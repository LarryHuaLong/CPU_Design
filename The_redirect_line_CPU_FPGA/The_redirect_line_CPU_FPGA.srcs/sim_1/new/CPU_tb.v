`timescale 10ns / 1ps
module CPU_tb;

    reg clk;
    reg reset;
	reg [11:0]addr_debug;
    wire [31:0] v_Syscall_out;
    wire [31:0] v_PC;
    wire [31:0] v_memory_out;
    wire [15:0] v_total_cycles;
    wire [15:0] v_jump_cycles;
    wire [15:0] v_branch_cycles;
    wire [15:0] v_branch_sucess_cycles;
    
    reg [15:0]count;
    initial count = 0;
    always@(posedge clk)
       count = count+1;
     CPU cpu(clk, 
         reset,
         addr_debug,
         v_Syscall_out,
         v_PC,
         v_memory_out,
         v_total_cycles,
         v_jump_cycles,
         v_branch_cycles,
         v_branch_sucess_cycles);
    initial clk = 0;
    always #1 clk = ~clk;
    initial reset = 1;
    initial #20 reset  = 0;
    initial addr_debug = 3;
    initial #2000 addr_debug = 2;
    initial #4000 $finish;
    
    
    
    
endmodule
