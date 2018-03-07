`timescale 1ns/1ps
module CPU(
    input clk,
    input RST,
	input [11:0]debug_addr,
    output [31:0] v_SyscallOut,
    output [31:0] v_memory_out,
    output [15:0] v_total_cycles,
    output [15:0] v_jump_cycles,
    output [15:0] v_branch_sucess_cycles,
	output [15:0] v_load_use_times,
    output [31:0] v_IF_PC,
    output [31:0] v_ID_PC,
    output [31:0] v_EX_PC,
    output [31:0] v_MEM_PC,
    output [31:0] v_WB_PC);
	
	//global tunnels
	wire lock,halting,stop;
	wire jump,branch,Load_Use;
	///IF tunnels
	wire goto;
	wire[31:0]goto_addr;
	///ID tunnels
	wire WB_RF_WE;
	wire[31:0]WB_RF_W;
	wire[5:0]EX_OP;
	wire[31:0]EX_Data;
	wire EX_RF_WE;
	wire[31:0]MEM_Data;
	wire MEM_RF_WE;

	//4 interfaces' IOs
	wire[31:0]IF_PC;
	wire[31:0]IF_PC_PLUS_1;
	wire[31:0]IF_IR;
	
	wire[31:0]ID_PC;
	wire[31:0]ID_PC_PLUS_1;
	wire[31:0]ID_IR;//

	wire[31:0]ID_CTRL;
	wire[31:0]ID_RF_B;
	wire[4:0]ID_rW;
	wire[31:0]ID_RF_A;
	wire[31:0]ID_IMM;
	
	wire[31:0]EX_PC;
	wire[31:0]EX_PC_PLUS_1;
	wire[31:0]EX_CTRL;
	wire[4:0]EX_rW;
	wire[31:0]EX_RF_B;
	
	wire[31:0]EX_ALU_R;
	wire EX_HALT;
	wire[31:0]EX_IR;
	wire[31:0]EX_RF_A;
	wire[31:0]EX_IMM;//

	
	wire[31:0]MEM_PC;
	wire[31:0]MEM_PC_PLUS_1;
	wire[31:0]MEM_CTRL;
	wire[4:0]MEM_rW;
	wire[31:0]MEM_ALU_R;
	wire MEM_HALT;//
	
	wire[31:0]MEM_DM_D;
	wire[31:0]MEM_RF_B;
	
	wire[31:0]WB_PC;
	wire[31:0]WB_PC_PLUS_1;
	wire[31:0]WB_CTRL;
	wire[4:0]WB_rW;
	wire[31:0]WB_ALU_R;
	wire WB_HALT;//
	wire[31:0]WB_DM_D;
	
	assign lock = stop | (!goto&Load_Use);

	IF_ID IFtoID( .clk(clk),
				  .clear(goto),
				  .lock(!lock),
				  .reset(RST),
				  .IF_IR(IF_IR),
				  .IF_PC(IF_PC),
				  .IF_PC_plus_1(IF_PC_PLUS_1),
				  .ID_IR(ID_IR),
				  .ID_PC(ID_PC),
				  .ID_PC_plus_1(ID_PC_PLUS_1));
	ID_EX IDtoEX( .clk(clk),
				  .clear(halting|goto|Load_Use),
				  .lock(!stop),
				  .reset(RST),
				  .ID_CTRL(ID_CTRL),
				  .ID_IMM(ID_IMM),
				  .ID_IR(ID_IR),
				  .ID_PC(ID_PC),
				  .ID_PC_plus_1(ID_PC_PLUS_1),
				  .ID_RF_A(ID_RF_A),
				  .ID_RF_B(ID_RF_B),
				  .ID_rW(ID_rW),
				  .EX_CTRL(EX_CTRL),
				  .EX_IMM(EX_IMM),
				  .EX_IR(EX_IR),
				  .EX_PC(EX_PC),
				  .EX_PC_plus_1(EX_PC_PLUS_1),
				  .EX_RF_A(EX_RF_A),
				  .EX_RF_B(EX_RF_B),
				  .EX_rW(EX_rW));
	EX_MEM EXtoMEM(.clk(clk),
				   .clear(1'b0),
				   .lock(1'b1),
				   .reset(RST),
				   .EX_ALU_R(EX_ALU_R),
				   .EX_CTRL(EX_CTRL),
				   .EX_HALT(EX_HALT),
				   .EX_PC(EX_PC),
				   .EX_PC_plus_1(EX_PC_PLUS_1),
				   .EX_RF_B(EX_RF_B),
				   .EX_rW(EX_rW),
				   .MEM_ALU_R(MEM_ALU_R),
				   .MEM_CTRL(MEM_CTRL),
				   .MEM_HALT(MEM_HALT),
				   .MEM_PC(MEM_PC),
				   .MEM_PC_plus_1(MEM_PC_PLUS_1),
				   .MEM_RF_B(MEM_RF_B),
				   .MEM_rW(MEM_rW));
	MEM_WB MEMtoWB(.clk(clk),
				   .clear(1'b0),
				   .lock(1'b1),
				   .reset(RST),
				   .MEM_ALU_R(MEM_ALU_R),
				   .MEM_CTRL(MEM_CTRL),
				   .MEM_DM_D(MEM_DM_D),
				   .MEM_HALT(MEM_HALT),
				   .MEM_PC(MEM_PC),
				   .MEM_PC_plus_1(MEM_PC_PLUS_1),
				   .MEM_rW(MEM_rW),
				   .WB_ALU_R(WB_ALU_R),
				   .WB_CTRL(WB_CTRL),
				   .WB_DM_D(WB_DM_D),
				   .WB_HALT(WB_HALT),
				   .WB_PC(WB_PC),
				   .WB_PC_plus_1(WB_PC_PLUS_1),
				   .WB_rW(WB_rW));
	//IF Section	   
	wire[31:0]PC_in;
	
	reg [31:0]PC;
	initial PC = 0;
	always @(posedge clk)
		begin
			if(RST)
				PC <= 0;
			else if(!lock)
				PC <= PC_in;
		end
	assign PC_in = goto ? goto_addr : IF_PC_PLUS_1;
	assign IF_PC = PC;
	assign IF_PC_PLUS_1 = PC + 4;
	ROM IM(.Address(PC[11:2]),.Data(IF_IR));
	
	//ID Section
	wire[5:0]ID_OP;
	wire[5:0]ID_Funct;
	wire[4:0]ID_rs;
	wire[4:0]ID_rt;
	wire[4:0]ID_rd;
	assign ID_OP = ID_IR[31:26];
	assign ID_Funct = ID_IR[5:0];
	assign ID_rs = ID_IR[25:21];
	assign ID_rt = ID_IR[20:16];
	assign ID_rd = ID_IR[15:11];
	wire[4:0]ID_rA;
	wire[4:0]ID_rB;
	assign ID_rA = ID_CTRL[27] ? 5'h02 : ID_rs;
	assign ID_rB = ID_CTRL[26] ? 5'h04 : ID_rt;
	Extender externder(.IR(ID_IR),
					   .extend_IMM(ID_CTRL[15]),
					   .extend_shamt(ID_CTRL[16]),
					   .zero_ext_IMM(ID_CTRL[14]),
					   .IMM(ID_IMM));
	Controller controller(.OP(ID_OP),
						  .Funct(ID_Funct),
						  .control_signal(ID_CTRL));
	wire[31:0]RF_A;
	wire[31:0]RF_B;
	RegisterFile registers( .clk(clk),
							.rst(RST),
							.Reg1No(ID_rA),
							.Reg2No(ID_rB),
							.Din(WB_RF_W),
							.WriteRegNo(WB_rW),
							.WriteEnable(WB_RF_WE),
							.Reg1(RF_A),
							.Reg2(RF_B));
	wire[31:0]rd_RF_A;
	wire r_RF_A;
	wire[31:0]rd_RF_B;
	wire r_RF_B;
	Redirector redirector( .Control_signals(ID_CTRL),
						   .EX_Data(EX_Data),
						   .EX_OP(EX_OP),
						   .EX_RF_WE(EX_RF_WE),
						   .EX_rW(EX_rW),
						   .MEM_Data(MEM_Data),
						   .MEM_RF_WE(MEM_RF_WE),
						   .MEM_rW(MEM_rW),
						   .rA(ID_rA),
						   .rB(ID_rB),
						   .Load_Use(Load_Use),
						   .redirect_RF_A(r_RF_A),
						   .redirect_RF_B(r_RF_B),
						   .redirected_RF_A(rd_RF_A),
						   .redirected_RF_B(rd_RF_B));
	assign ID_RF_A = r_RF_A ? rd_RF_A : RF_A;
	assign ID_RF_B = r_RF_B ? rd_RF_B : RF_B;
	assign ID_rW = ID_CTRL[24] ? 5'h1f : (ID_CTRL[25] ? ID_rd : ID_rt);

	//EX Section
	wire syscall,ALU_Equal;
	wire[3:0]ALU_OP;
	wire[31:0]ALU_X;
	wire[31:0]ALU_Y;
	assign syscall = EX_CTRL[8];
	assign ALU_OP = EX_CTRL[31:28];
	assign ALU_X = EX_CTRL[19] ? EX_RF_B : EX_RF_A;
	assign ALU_Y = EX_CTRL[17] ? EX_IMM : (EX_CTRL[18] ? EX_RF_A : EX_RF_B);
	ALU MIPS_alu(.S(ALU_OP),
            .X(ALU_X),
            .Y(ALU_Y),
            .Result(EX_ALU_R),
            .Result2(),
            .Equal(ALU_Equal),
            .Overflow(),
            .UOF());
	NPC npc(.ALU_Equal(ALU_Equal),
            .ALU_R(EX_ALU_R),
            .CTRL(EX_CTRL),
            .IMM(EX_IMM),
            .IR(EX_IR),
            .PC_plus_1(EX_PC_PLUS_1),
            .RF_A(EX_RF_A),
            .branch(branch),
            .goto(goto),
            .jump(jump),
            .new_addr(goto_addr));
	assign EX_HALT = syscall&ALU_Equal;
	assign EX_OP = EX_IR[31:26];
	assign EX_Data = EX_ALU_R;
	assign EX_RF_WE = EX_CTRL[23];
	
	reg [31:0]SyscallOut;
	initial SyscallOut = 0;
	always @(negedge clk)
		begin
			if(RST)
				SyscallOut <= 0;
			else if(!ALU_Equal&syscall)
				SyscallOut <= EX_RF_B;
		end
	//MEM Section
	assign MEM_RF_WE = MEM_CTRL[23];
	assign MEM_Data = (MEM_CTRL[21] | MEM_CTRL[20]) ? MEM_DM_D : MEM_ALU_R;
	RAM DM( .clk(clk),
		    .clr(RST),
		    .str(MEM_CTRL[7]),
		    .datain(MEM_RF_B),
		    .address(MEM_ALU_R[13:2]),
		    .dataout(MEM_DM_D),
		    .debug_address(debug_addr),
		    .debug_dataout(v_memory_out));
	
	//WB Section
	wire[31:0]halfword;
	assign halfword = !MEM_ALU_R[1] ? {16'h0000,MEM_DM_D[15:0]} 
									: {16'h0000,MEM_DM_D[31:16]};
	assign WB_RF_WE = WB_CTRL[23];
	assign WB_RF_W = !WB_CTRL[21] ? (!WB_CTRL[22] ? WB_ALU_R 
												  : WB_PC_PLUS_1)
								  : (!WB_CTRL[20] ? WB_DM_D
												  : halfword);
	assign halting = WB_HALT;
	
	reg halt;
	initial halt = 0;
	always@(negedge halting)
		begin
			if(RST)
				halt <= 0;
			else 
				halt = 1;
		end
	assign stop = halt;
	//counts
	reg [15:0]total_num;
    reg [15:0]jump_num;
    reg [15:0]branch_succeed_num;
    reg [15:0]Load_Use_num;
    reg count_total;
	initial begin
	   count_total = 0;
	    total_num = 0;
        jump_num = 0;
        branch_succeed_num = 0;
        Load_Use_num = 0;
	end
	always@(posedge clk)
           begin
               if(RST) count_total = 0;
               else count_total = stop;
           end
	always@(negedge clk)
	   begin
	       if(RST)
               begin
                   total_num = 0;
                   jump_num = 0;
                   branch_succeed_num = 0;
                   Load_Use_num = 0;
               end
           if(!count_total&!RST) total_num = total_num + 1;
           if(jump) jump_num = jump_num + 1;
           if(branch) branch_succeed_num = branch_succeed_num + 1;
           if(Load_Use) Load_Use_num = Load_Use_num + 1;
	   end
	//Display Data
    assign v_SyscallOut = SyscallOut;
	assign v_total_cycles = total_num;
    assign v_jump_cycles = jump_num;
    assign v_branch_sucess_cycles = branch_succeed_num;
    assign v_load_use_times = Load_Use_num;
    assign v_IF_PC = IF_PC;
    assign v_ID_PC = ID_PC;
    assign v_EX_PC = EX_PC;
    assign v_MEM_PC = MEM_PC;
    assign v_WB_PC = WB_PC;
    
endmodule