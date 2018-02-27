`timescale 1ns / 1ps

module CPU(
    input clk,
    input reset,
	input [11:0]addr_debug;
    output [31:0] v_Syscall_out,
    output [31:0] v_PC,
    output [31:0] v_memory_out,
    output [31:0] v_total_cycles,
    output [31:0] v_jump_cycles,
    output [31:0] v_branch_cycles,
    output [31:0] v_branch_sucess_cycles
    );
    //控制信号定义
    wire [27:0]control_signals;
    wire [3:0]ALUOP;
	
    wire v0_to_rA
    wire a0_to_rB;
    wire rd_to_rW;
    wire GPR_to_rW;
	
    wire RF_WE;
    wire PC_plus_1_to_Din;
    wire DM_to_Din;
    wire DM_half_to_Din;
	
    wire RF_B_to_X;
    wire RF_A_to_Y;
    wire S_EXT_to_Y;
	
    wire extend_shamt;
	wire extend_IMM;
	wire zero_ext_IMM;
    wire jump;
    wire jump_register;
    wire beq;
    wire bne;
    wire bltz;
	wire syscall;
	wire DM_WE;
	
    //辅助信号定义
	wire halt;
	wire branch;
	wire display_a0;
	
	//模块输出定义
	wire [31:0]PC_in;
	wire [11:0]IM_in;
	wire [31:0]RF_in_w；
	wire [4:0]RF_in_rW；
	wire [4:0]RF_in_rA；
	wire [4:0]RF_in_rB；
	wire [31:0]ALU_in_X；
	wire [31:0]ALU_in_Y；
	wire [31:0]ALU_in_S;
	wire [31:0]DM_in_data;
	wire [11:0]DM_in_addr；
	
	//模块输出定义
	wire [31:0]PC;
	wire [31:0]PC_plus_1;
	wire [31:0]IM_out；
	wire [5:0]OP；
	wire [5:0]Funct；
	wire [4:0]IM_rs；
	wire [4:0]IM_rd；
	wire [4:0]IM_rt；
	wire [31:0]RF_A；
	wire [31:0]RF_B；
	wire [31:0]ALU_Result;
	wire ALU_Equal;
	wire [31:0]DM_out；
	
	//模块实例
	
	storage IM();
	register RF();
	ALU alu();
	stotage DM

    
endmodule
