`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/27 08:48:27
// Design Name: 
// Module Name: controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller(
    input [5:0] OP,
    input [5:0] Funct,
    output [27:0] control_signal
    );
    reg op0,bltz,j,jal,beq,bne,addi,addiu,slti,sltiu,andi,ori,lh,lw,sw;
    reg f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14;
    wire sll,srl,sra,srlv,jr,syscall,add,addu,sub,c_and,c_or,c_nor,slt,sltu;
    always@(*) begin
        if (OP == 6'h00) op0 = 1;
            else op0 = 0;
        if (OP == 6'h01) bltz = 1;
            else bltz = 0;
        if (OP == 6'h02) j = 1;
            else j = 0;
        if (OP == 6'h03) jal = 1;
            else jal = 0;
        if (OP == 6'h04) beq = 1;
            else beq = 0;
        if (OP == 6'h05) bne = 1;
            else bne = 0;
        if (OP == 6'h08) addi = 1;
            else addi = 0;
        if (OP == 6'h09) addiu = 1;
            else addiu = 0;
        if (OP == 6'h0a) slti = 1;
            else slti = 0;
        if (OP == 6'h0b) sltiu = 1;
            else sltiu = 0;
        if (OP == 6'h0c) andi = 1;
            else andi = 0;
        if (OP == 6'h0d) ori = 1;
            else ori = 0;
        if (OP == 6'h21) lh = 1;
            else lh = 0;
        if (OP == 6'h23) lw = 1;
            else lw = 0;
        if (OP == 6'h2b) sw = 1;
            else sw = 0;    
            
        if (Funct == 6'h00) f1 = 1;
            else f1 = 0;
        if (Funct == 6'h02) f2 = 1;
            else f2 = 0;
        if (Funct == 6'h03) f3 = 1;
            else f3 = 0;
        if (Funct == 6'h06) f4 = 1;
            else f4 = 0;
        if (Funct == 6'h08) f5 = 1;
            else f5 = 0;
        if (Funct == 6'h0c) f6 = 1;
            else f6 = 0;
        if (Funct == 6'h20) f7 = 1;
            else f7 = 0;
        if (Funct == 6'h21) f8 = 1;
            else f8 = 0;
        if (Funct == 6'h22) f9 = 1;
            else f9 = 0;
        if (Funct == 6'h24) f10 = 1;
            else f10 = 0;
        if (Funct == 6'h25) f11 = 1;
            else f11 = 0;
        if (Funct == 6'h27) f12 = 1;
            else f12 = 0;
        if (Funct == 6'h2a) f13 = 1;
            else f13 = 0;
        if (Funct == 6'h2b) f14 = 1;
            else f14 = 0;
    end
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
   assign control_signal[27] = ori|sltiu|slti|bltz|sltu|slt|c_nor|c_or;                    
   assign control_signal[26] = lw|sw|lh|andi|sltiu|addiu|addi|sltu|c_and|sub|addu|add|syscall;
   assign control_signal[25] = andi|slti|bltz|slt|c_nor|c_and|sub|syscall|srlv|srl;        
   assign control_signal[24] = lw|sw|lh|andi|slti|addiu|addi|bltz|slt|c_and|addu|add|sra;
   assign control_signal[23] = syscall;
   assign control_signal[22] = syscall;
   assign control_signal[21] = sltu|slt|c_nor|c_or|c_and|sub|addu|add|srlv|sra|srl|sll;
   assign control_signal[20] = jal;
   assign control_signal[19] = lh|lw|ori|andi|sltiu|slti|addiu|addi|jal|sltu|slt|c_nor|c_or|c_and|sub|addu|add|srlv|sra|srl|sll;
   assign control_signal[18] = jal;
   assign control_signal[17] = lh|lw;
   assign control_signal[16] = lh;
   assign control_signal[15] = srlv|sra|srl|sll;
   assign control_signal[14] = srlv;
   assign control_signal[13] = lw|sw|lh|ori|andi|sltiu|slti|addiu|addi|syscall|sra|srl|sll;
   assign control_signal[12] = sra|srl|sll;
   assign control_signal[11] = sw|lw|lh|ori|andi|sltiu|slti|addiu|addi|bne|beq|bltz;
   assign control_signal[10] = ori|andi;
   assign control_signal[9] = jal|j|jr;
   assign control_signal[8] = jr;
   assign control_signal[7] = beq;
   assign control_signal[6] = bne;
   assign control_signal[5] = bltz;
   assign control_signal[4] = syscall;
   assign control_signal[3] = sw;
   assign control_signal[2] = 1'b0;                       
   assign control_signal[1] = 1'b0;                      
   assign control_signal[0] = 1'b0;                      
endmodule
