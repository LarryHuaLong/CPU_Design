`timescale 1ns / 1ps
module CPU(
    input clk,
    input reset,
	input [11:0]addr_debug,
    output [31:0] v_Syscall_out,
    output [31:0] v_PC,
    output [31:0] v_memory_out,
    output [15:0] v_total_cycles,
    output [15:0] v_jump_cycles,
    output [15:0] v_branch_cycles,
    output [15:0] v_branch_sucess_cycles
    );
		
    //控制信号定义
    wire [27:0]control_signals;
    wire [3:0]ALUOP;
	
    wire v0_to_rA;
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
	
	
	//模块输入定义
	wire [31:0]PC_in;
	wire [11:0]IM_in;
	wire [31:0]RF_in_w;
	wire [4:0]RF_in_rW;
	wire [4:0]RF_in_rA;
	wire [4:0]RF_in_rB;
	wire [31:0]ALU_in_X;
	wire [31:0]ALU_in_Y;
	wire [3:0]ALU_in_S;
	wire [31:0]DM_in_data;
	wire [11:0]DM_in_addr;
	wire [16:0]extender_in;
	
	//模块输出定义
	wire [31:0]PC_plus_1;
	wire [31:0]IM_out;
	wire [5:0]OP;
	wire [5:0]Funct;
	wire [4:0]rs;
	wire [4:0]rd;
	wire [4:0]rt;
	wire [4:0]IM_shamt;
	wire [15:0]IM_IMM;
	wire [31:0]RF_A;
	wire [31:0]RF_B;
	wire [31:0]ALU_Result;
	wire ALU_Equal;
	wire [31:0]DM_out;
	wire [31:0]extender_out;
	
	controller control(.OP(OP),.Funct(Funct),.control_signal(control_signals));
	
	
	//PC寄存噿 
	reg [31:0]PC;
	initial PC = 0;
	always @(posedge clk)
		if(reset)
			PC <= 0;
		else if(!halt)
			PC <= PC_in;
	wire [31:0]branch_addr;
	assign branch_addr = PC_plus_1 + {extender_out[29:0],2'b00};
	assign PC_in = jump ? (jump_register ? RF_A : {PC_plus_1[31:28],IM_out[25:0],2'b00} )
						: (branch ? branch_addr : PC_plus_1);
    assign v_PC = PC;
	//数码管锁孿
	reg [31:0]Syscallout;
	initial Syscallout = 0;
	always @(negedge clk)
		if(reset) 
			Syscallout = 0;
		else if(display_a0)
			Syscallout = RF_B;
			
	assign v_Syscall_out = Syscallout;
	//PC加一
	assign PC_plus_1 = PC + 4;
	//指令寄存噿
	IM_Storage IM(.Address(IM_in),
				   .Data(IM_out));
	assign IM_in = PC[11:2];
	assign OP = IM_out[31:26];
	assign Funct = IM_out[5:0];
	assign rs = IM_out[25:21];
	assign rt = IM_out[20:16];
	assign rd = IM_out[15:11];
	assign IM_shamt = IM_out[10:6];
	assign IM_IMM = IM_out[15:0];
	//寄存器堆
	register RF(.rst(reset),
				.Reg1No(RF_in_rA),
				.Reg2No(RF_in_rB),
				.WriteRegNo(RF_in_rW),
				.Din(RF_in_w),
				.WriteEnable(RF_WE),
				.clk(clk),
				.Reg1(RF_A),
				.Reg2(RF_B));
	assign RF_in_rW = GPR_to_rW ? 5'h1f
								: (rd_to_rW ? rd : rt);
	assign RF_in_rA = v0_to_rA ? 5'h02 : rs;
	assign RF_in_rB = a0_to_rB ? 5'h04 : rt;
	assign RF_in_w = DM_to_Din ? (DM_half_to_Din ? ( ALU_Result[1] ? {16'h0000,DM_out[31:16]} 
																   : {16'h0000,DM_out[15:0]})
												 : DM_out )
							   : (PC_plus_1_to_Din ? PC_plus_1 : ALU_Result);
	//ALU
	ALU alu(.S(ALU_in_S),
            .X(ALU_in_X),
            .Y(ALU_in_Y),
            .Result(ALU_Result),
            .Result2(),
            .Equal(ALU_Equal),
            .Overflow(),
            .UOF());
	assign ALU_in_X = RF_B_to_X ? RF_B : RF_A;
	assign ALU_in_Y = S_EXT_to_Y ? extender_out 
								 : (RF_A_to_Y ? RF_A : RF_B) ;
	assign ALU_in_S = ALUOP;
	//数据存储噿
	storage DM(.r_address(addr_debug),
			   .address(DM_in_addr),
			   .datain(DM_in_data),
			   .clk(clk),
			   .str(DM_WE),
			   .ld(1'b1),
			   .dataout(DM_out),
			   .r_dataout(v_memory_out),
			   .clr());
	assign DM_in_data = RF_B;
	assign DM_in_addr = ALU_Result[13:2];
	
	assign extender_out = extender_in[16] ? {16'hffff,extender_in[15:0]} : {16'h0000,extender_in[15:0]};
    assign extender_in = extend_IMM ? (zero_ext_IMM ? {1'b0,IM_IMM} : {IM_IMM[15],IM_IMM})
									: (extend_shamt ? {12'h000,IM_shamt} : 17'h0000a);
	//
	assign halt = syscall & ALU_Equal;
    assign branch = (ALU_Equal & beq) | (!ALU_Equal & bne) | (bltz & ALU_Result[0]); 
    assign display_a0 = syscall & !ALU_Equal;
	//指令统计
	wire [15:0]total_cycle;
	total_circle total(.clk(clk),
					   .D(halt),
					   .Q(total_cycle),
					   .RST(reset));
    assign v_total_cycles = total_cycle + {15'b0,halt};			   
	other_cilcle jump_cycles(.clk(clk),
							 .D(!jump & !jump_register),
							 .Q(v_jump_cycles),
							 .RST(reset));
	other_cilcle branch_cycles(.clk(clk),
							  .D(!beq & !bne & !bltz),
							  .Q(v_branch_cycles),
							  .RST(reset));
	other_cilcle branch_sucess_cycles(.clk(clk),
									  .D(!branch),
									  .Q(v_branch_sucess_cycles),
									  .RST(reset));
	
endmodule
