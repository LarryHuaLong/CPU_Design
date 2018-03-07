`timescale 1ns / 1ps
	module Controller(
		input[5:0] OP,
		input[5:0] Funct,
		output[31:0] control_signal);
	wire op0,bltz,j,jal,beq,bne,addi,addiu,slti,sltiu,andi,ori,lh,lw,sw;
	wire f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14;
	wire sll,srl,sra,srlv,jr,syscall,add,addu,sub,c_and,c_or,c_nor,slt,sltu;
	
	assign op0 = (OP == 6'h00);
	assign bltz = (OP == 6'h01);
	assign j = (OP == 6'h02);
	assign jal = (OP == 6'h03);
	assign beq = (OP == 6'h04);
	assign bne = (OP == 6'h05);
	assign addi = (OP == 6'h08);
	assign addiu = (OP == 6'h09);
	assign slti = (OP == 6'h0a);
	assign sltiu = (OP == 6'h0b);
	assign andi = (OP == 6'h0c);
	assign ori = (OP == 6'h0d);
	assign lh = (OP == 6'h21);
	assign lw = (OP == 6'h23);
	assign sw = (OP == 6'h2b);
	
	assign f1 = (Funct == 6'h00);
	assign f2 = (Funct == 6'h02);
	assign f3 = (Funct == 6'h03);
	assign f4 = (Funct == 6'h06);
	assign f5 = (Funct == 6'h08);
	assign f6 = (Funct == 6'h0c);
	assign f7 = (Funct == 6'h20);
	assign f8 = (Funct == 6'h21);
	assign f9 = (Funct == 6'h22);
	assign f10 = (Funct == 6'h24);
	assign f11 = (Funct == 6'h25);
	assign f12 = (Funct == 6'h27);
	assign f13 = (Funct == 6'h2a);
	assign f14 = (Funct == 6'h2b);
	
	assign sll = op0&f1;
	assign srl = op0&f2;
	assign sra = op0&f3;
	assign srlv = op0&f4;
	assign jr = op0&f5;
	assign syscall = op0&f6;
	assign add = op0&f7;
	assign addu = op0&f8;
	assign sub = op0&f9;
	assign c_and = op0&f10;
	assign c_or = op0&f11;
	assign c_nor = op0&f12;
	assign slt = op0&f13;
	assign sltu = op0&f14;
	
	assign control_signal[31] = ori|sltiu|slti|bltz|sltu|slt|c_nor|c_or;
	assign control_signal[30] = lw|sw|lh|andi|sltiu|addiu|addi|sltu|c_and|sub|addu|add|syscall;
	assign control_signal[29] = andi|slti|bltz|slt|c_nor|c_and|sub|syscall|srlv|srl;
	assign control_signal[28] = lw|sw|lh|andi|slti|addiu|addi|bltz|slt|c_and|addu|add|sra;
	assign control_signal[27] = syscall;
	assign control_signal[26] = syscall;
	assign control_signal[25] = sltu|slt|c_nor|c_or|c_and|sub|addu|add|srlv|sra|srl|sll;
	assign control_signal[24] = jal;
	assign control_signal[23] = lh|lw|ori|andi|sltiu|slti|addiu|addi|jal|sltu|slt|c_nor|c_or|c_and|sub|addu|add|srlv|sra|srl|sll;
	assign control_signal[22] = jal;
	assign control_signal[21] = lh|lw;
	assign control_signal[20] = lh;
	assign control_signal[19] = srlv|sra|srl|sll;
	assign control_signal[18] = srlv;
	assign control_signal[17] = lw|sw|lh|ori|andi|sltiu|slti|addiu|addi|syscall|sra|srl|sll;
	assign control_signal[16] = sra|srl|sll;
	assign control_signal[15] = sw|lw|lh|ori|andi|sltiu|slti|addiu|addi|bne|beq|bltz;
	assign control_signal[14] = ori|andi;
	assign control_signal[13] = jal|j|jr;
	assign control_signal[12] = jr;
	assign control_signal[11] = beq;
	assign control_signal[10] = bne;
	assign control_signal[9] = bltz;
	assign control_signal[8] = syscall;
	assign control_signal[7] = sw;
	assign control_signal[6] = bltz|beq|bne|addi|addiu|slti|sltiu|andi|ori|lh|lw|sw|srlv|jr|syscall|add|addu|sub|c_and|c_or|c_nor|slt|sltu;
	assign control_signal[5] = bltz|beq|bne|sw|sll|srl|sra|srlv|syscall|add|addu|sub|c_and|c_or|c_nor|slt|sltu;
	assign control_signal[4] = 1'b0;
	assign control_signal[3] = 1'b0;
	assign control_signal[2] = 1'b0;
	assign control_signal[1] = 1'b0;
	assign control_signal[0] = 1'b0;
endmodule
