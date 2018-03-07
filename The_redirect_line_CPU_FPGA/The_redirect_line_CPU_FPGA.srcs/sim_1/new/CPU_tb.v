`timescale 1ns / 1ps
module CPU_tb;

    reg clk;
    reg RST;
	reg [11:0]debug_addr;
    wire [31:0] v_SyscallOut;
    wire [31:0] v_memory_out;
    wire [15:0] v_total_cycles;
    wire [15:0] v_jump_cycles;
    wire [15:0] v_branch_sucess_cycles;
    wire [15:0] v_load_use_times;
    wire [31:0] v_IF_PC;
    wire [31:0] v_ID_PC;
    wire [31:0] v_EX_PC;
    wire [31:0] v_MEM_PC;
    wire [31:0] v_WB_PC;
    wire [11:0] IF_PC_O;
    wire [11:0] ID_PC_O;
    wire [11:0] EX_PC_O;
    wire [11:0] MEM_PC_O;
    wire [11:0] WB_PC_O;
    
    assign IF_PC_O = v_IF_PC;
    assign ID_PC_O = v_ID_PC;
    assign EX_PC_O = v_EX_PC;
    assign MEM_PC_O = v_MEM_PC;
    assign WB_PC_O = v_WB_PC;
    
    reg [15:0]count;
    initial count = 0;
    always@(posedge clk)
       count = count+1;
     CPU cpu(clk,
             RST,
             debug_addr,
             v_SyscallOut,
             v_memory_out,
             v_total_cycles,
             v_jump_cycles,
             v_branch_sucess_cycles,
             v_load_use_times,
             v_IF_PC,
             v_ID_PC,
             v_EX_PC,
             v_MEM_PC,
             v_WB_PC);
    initial clk = 0;
    always #1 clk = ~clk;
    initial RST = 1;
    initial #5 RST  = 0;
    initial begin 
        debug_addr = 0;
        #5000 
        # 20 debug_addr = 0;
        # 20 debug_addr = 1;
        # 20 debug_addr = 2;
        # 20 debug_addr = 3;
        # 20 debug_addr = 4;
        # 20 debug_addr = 5;
        # 20 debug_addr = 6;
        # 20 debug_addr = 7;
        # 20 debug_addr = 8;
        # 20 debug_addr = 9;
        # 20 debug_addr = 10;
        # 20 debug_addr = 11;
        # 20 debug_addr = 12;
        # 20 debug_addr = 13;
        # 20 debug_addr = 14;
        # 20 debug_addr = 15;
        # 20 debug_addr = 16;
        $finish;
    end   
    
    
endmodule
