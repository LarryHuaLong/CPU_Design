`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/27 10:06:50
// Design Name: 
// Module Name: top
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


module top(
    clk,RST,switch
    );
    input clk,RST;
    input [2:0]switch;//3������
    initial 
    begin
    clk=0;
    end
    always #1 clk=~clk;//�˴����ʱ�ӷ�Ƶ����
    always @(posedge clock)//��Ƶʱ��
    begin
    if(switch[0]==0&&switch[1]==0&&switch[2]==0)display(clk,RST);//�����
    else
    if(switch[0]==0&&switch[1]==0&&switch[2]==1)total_circle(clk,RST);//������
    else
    if(switch[0]==0&&switch[1]==1&&switch[2]==0)condition(clk,RST);//��������֧
    else
    if(switch[0]==0&&switch[1]==1&&switch[2]==1)condition_suc(clk,RST);//��������֧�ɹ�
    else
    if(switch[0]==1&&switch[1]==0&&switch[2]==0)no_condition(clk,RST);//��������֧
    else
    display(clk,RST);//�����
    end
endmodule
