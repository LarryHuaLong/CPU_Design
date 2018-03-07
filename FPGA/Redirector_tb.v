module Redirector_tb;
   reg [31:0]ID_CTRL;   
   reg [31:0]EX_Data;   
   reg [5:0]EX_OP;   
   reg EX_RF_WE;   
   reg [4:0]EX_rW;   
   reg [31:0]MEM_Data;   
   reg MEM_RF_WE;   
   reg [4:0]MEM_rW;   
   reg [4:0]ID_rA;   
   reg [4:0]ID_rB;   
   wire Load_Use     ;               
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
    initial begin
        ID_CTRL = 32'b100000;   
        EX_Data = 32'h11111111;   
        EX_OP = 0;   
        EX_RF_WE = 0;   
        EX_rW = 0;   
        MEM_Data = 32'hffffffff;   
        MEM_RF_WE  = 0;   
        MEM_rW  = 0;   
        ID_rA  = 0;   
        ID_rB  = 0;   
        end
    initial begin
    //rW = 0
        # 100
        ID_CTRL = 32'b10110000;   
        EX_OP = 0;   
        EX_RF_WE = 1;   
        EX_rW = 0;     
        MEM_RF_WE  = 1;   
        MEM_rW  = 0;   
        ID_rA  = 0;   
        ID_rB  = 0; 
    //rA
        # 100
        ID_CTRL = 32'b10110000;   
        EX_OP = 0;   
        EX_RF_WE = 1;   
        EX_rW = 4;     
        MEM_RF_WE  = 0;   
        MEM_rW  = 4;   
        ID_rA  = 4;   
        ID_rB  = 5; 
    //rB
        # 100
        ID_CTRL = 32'b10110000;   
        EX_OP = 0;   
        EX_RF_WE = 1;   
        EX_rW = 4;     
        MEM_RF_WE  = 0;   
        MEM_rW  = 4;   
        ID_rA  = 5;   
        ID_rB  = 4; 
    //Load_Use
        # 100
        ID_CTRL = 32'b10110000;   
        EX_OP = 6'h21;   
        EX_RF_WE = 1;   
        EX_rW = 4;     
        MEM_RF_WE  = 1;   
        MEM_rW  = 4;   
        ID_rA  = 4;   
        ID_rB  = 4; 
    //Load_Use
        # 100
        ID_CTRL = 32'b10110000;   
        EX_OP = 6'h21;   
        EX_RF_WE = 1;   
        EX_rW = 8;     
        MEM_RF_WE  = 1;   
        MEM_rW  = 4;   
        ID_rA  = 4;   
        ID_rB  = 4; 
    end
    
endmodule    