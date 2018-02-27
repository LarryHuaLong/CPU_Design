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
	
	assign {ALUOP 
			,v0_to_rA  
			, a0_to_rB
			, rd_to_rW
			, GPR_to_rW
			, RF_WE
			, PC_plus_1_to_Din
			, DM_to_Din
			, DM_half_to_Din
			, RF_B_to_X
			, RF_A_to_Y
			, S_EXT_to_Y
			, extend_shamt
			, extend_IMM
			, zero_ext_IMM
			, jump
			, jump_register
			, beq
			, bne
			, bltz
			, syscall
			, DM_WE} 
			= control_signals[27:3];
	
    //辅助信号定义
	wire halt;
	wire branch;
	wire display_a0;
	assign halt = syscall & ALU_Equal;
	assign branch = (ALU_Equal & beq) | (!ALU_Equal & bne) | (bltz & ALU_Result[0]); 
	assign display_a0 = syscall & !ALU_Equal;
	
	//模块输入定义
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
	wire [16:0]extender_in;
	
	//模块输出定义
	wire [31:0]PC;
	wire [31:0]PC_plus_1;
	wire [31:0]IM_out；
	wire [5:0]OP；
	wire [5:0]Funct；
	wire [4:0]IM_rs；
	wire [4:0]IM_rd；
	wire [4:0]IM_rt；
	wire [4:0]IM_shamt
	wire [15:0]IM_IMM
	wire [31:0]RF_A；
	wire [31:0]RF_B；
	wire [31:0]ALU_Result;
	wire ALU_Equal;
	wire [31:0]DM_out；
	wire [31:0]extender_out;
	
	//模块实例
	//PC寄存器 
	reg PC;
	initial PC = 0;
	always @(posedge clk)
		if(reset)
				PC <= 0；
		else if(!halt)
			PC <= PC_in;
			
	assign PC_in = jump ? (jump_register ? RF_A : {PC_plus_1[31:28],IM_out[25:0],2'b00} )
						: (branch ? (PC_plus_1 + {extender_out[29:0],2'b00}) : PC_plus_1);
	//数码管锁存
	reg Syscallout;
	initial Syscallout = 0;
	always @(posedge clk)
		if(reset) 
			Syscallout = 0;
		else if(display_a0)
			Syscallout = RF_B;

	//PC加一
	assign PC_plus_1 = PC + 4;
	//指令寄存器
	storage IM();
	assign IM_in = PC[11:2];
	assign OP = IM_out[31:26];
	assign Funct = IM_out[5:0];
	assign rs = IM_out[25:21];
	assign rt = IM_out[20:16];
	assign rd = IM_out[15:11];
	assign IM_shamt = IM_out[10:6];
	assign IM_IMM = IM_out[15:0];
	//寄存器堆
	register RF();
	assign RF_in_rW = GPR_to_rW ? 5'h1f
								: (rd_to_rW ? rd : rt)；
	assign RF_in_rA = v0_to_rA ? 5'h02 : rs；
	assign RF_in_rB = a0_to_rB ? 5'h04 : rt；
	assign RF_in_w = DM_to_Din ? (DM_half_to_Din ? ( ALU_Result[1] ? {16'h0000,DM_out[31:16]} 
																   : {16'h0000,DM_out[15:0]})
												 : DM_out )
							   : (PC_plus_1_to_Din ? PC_plus_1 : ALU_Result)；
	//ALU
	ALU alu();
	assign ALU_in_X = RF_B_to_X ? RF_B : RF_A；
	assign ALU_in_Y = S_EXT_to_Y ? extender_out 
								 : (RF_A_to_Y ? RF_A : RF_B) ；
	assign ALU_in_S = ALUOP;
	//数据存储器
	stotage DM();
	assign DM_in_data = RF_B;
	assign DM_in_addr = ALU_Result[13:2]；
	
	assign extender_out = extender_in[16] ? {16'hffff,extender_in[15:0]} : {16'h0000,extender_in[15:0]};
    assign extender_in = extend_IMM ? (zero_ext_IMM ? {1'b0,IM_IMM} : {IM_IMM[15],IM_IMM})
									: (extend_shamt ? {12'h000,IM_shamt} : 17'h0000a);
	//指令统计
	
	
	//输出结果
	assign v_Syscall_out = Syscallout;
    assign v_PC = PC;
    assign v_memory_out = DM_;
    assign v_total_cycles = ;
    assign v_jump_cycles,
    assign v_branch_cycles,
    assign v_branch_sucess_cycles
	
endmodule
