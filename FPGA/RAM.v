module RAM(clk,
		   clr,
		   str,
		   datain,
		   address,
		   dataout,
		   debug_address,
		   debug_dataout);
	input [11:0]debug_address;
    input [11:0]address;
    input [31:0]datain;
    input clk,str,clr;
    output [31:0]dataout;
    output [31:0]debug_dataout;
    
	reg [31:0]data[0:63];//64*4bytes
	
    assign dataout = data[address];
    assign debug_dataout = data[debug_address];
    
    integer i;
    initial 
		begin
			for(i=0;i<=63;i=i+1)
			  data[i] <= 32'h00000000;
		end
    always @(negedge clk)
		begin
			if(clr)
			   for(i=0;i<=63;i=i+1)
				data[i] <= 32'h00000000;
			else if(str)
				data[address] <= datain;
		end
endmodule