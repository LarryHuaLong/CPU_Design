module IF_ID_tb;
    reg clk;
    reg goto;
    reg lock;
    reg RST;
    reg [31:0]IF_IR;
    reg [31:0]IF_PC;
    reg [31:0]IF_PC_PLUS_1;
    wire [31:0]ID_IR;
    wire [31:0]ID_PC;
    wire [31:0]ID_PC_PLUS_1;
IF_ID IFtoID( .clk(clk),
				  .clear(goto),
				  .lock(lock),
				  .reset(RST),
				  .IF_IR(IF_IR),
				  .IF_PC(IF_PC),
				  .IF_PC_plus_1(IF_PC_PLUS_1),
				  .ID_IR(ID_IR),
				  .ID_PC(ID_PC),
				  .ID_PC_plus_1(ID_PC_PLUS_1));
	initial 
	   begin
	       clk = 0;
	       RST = 1;
	       lock = 1;
	       goto = 0;
	       IF_IR = 32'hffffffff;
	       IF_PC = 32'heeeeeeee;
	       IF_PC_PLUS_1 = 32'hdddddddd;
	       #50 RST = 0;
	       #105 IF_IR = 32'h11111111;
           #105 IF_PC = 32'h22222222;
           #50 lock = 0;
           #105 IF_PC_PLUS_1 = 32'h33333333;
           $finish;
	   end
	always #10 clk = ~clk;
endmodule