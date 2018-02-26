/******************************************************************************
 ** Logisim goes FPGA automatic generated Verilog code                       **
 **                                                                          **
 ** Component : ALU                                                          **
 **                                                                          **
 ******************************************************************************/

module ALU( S,
            X,
            Y,
            Equal,
            Overflow,
            Result,
            Result2,
            UOF);

   /***************************************************************************
    ** Here the inputs are defined                                           **
    ***************************************************************************/
   input[3:0]  S;
   input[31:0]  X;
   input[31:0]  Y;

   /***************************************************************************
    ** Here the outputs are defined                                          **
    ***************************************************************************/
   output Equal;
   output Overflow;
   output Result;
   output Result2;
   output UOF;

   /***************************************************************************
    ** Here the internal wires are defined                                   **
    ***************************************************************************/
   wire[31:0] const_32bit_0;
   wire[31:0] BUF_quotient;
   wire[31:0] BUF_result;
   wire[31:0] BUF_Y;
   wire[31:0] BUF_product_lower;
   wire[30:0] const_31bit_0;
   wire[31:0] BUF_and_32_bit;
   wire[31:0] BUF_logical_right;
   wire[31:0] BUF_product_upper;
   wire[31:0] BUF_result2;
   wire[31:0] BUF_signed_comparator;
   wire[31:0] BUF_or_32_bit;
   wire[31:0] BUF_nor_32_bit;
   wire[31:0] BUF_xor_32_bit;
   wire[31:0] BUF_unsigned_comparator;
   wire[31:0] s_LOGISIM_BUS_31;
   wire[31:0] BUF_logical_left;
   wire[31:0] BUF_adder_result;
   wire[31:0] BUF_X;
   wire[3:0] BUF_s;
   wire[31:0] BUF_Y;
   wire[31:0] BUF_arithmetic_right;
   wire[31:0] BUF_remainder;
   wire BUF_equal;
   wire s_LOGISIM_NET_12;
   wire BUF_OF;
   wire s_LOGISIM_NET_17;
   wire BUF_OF;
   wire BUF_UOF;
   wire s_LOGISIM_NET_21;
   wire BUF_Cout;
   wire s_LOGISIM_NET_24;
   wire s_LOGISIM_NET_28;
   wire s_LOGISIM_NET_32;


   /***************************************************************************
    ** Here all wiring is defined                                            **
    ***************************************************************************/
   assign BUF_unsigned_comparator[1]                = const_31bit_0[0];
   assign BUF_signed_comparator[1]                = const_31bit_0[0];
   assign BUF_unsigned_comparator[2]                = const_31bit_0[1];
   assign BUF_signed_comparator[2]                = const_31bit_0[1];
   assign BUF_unsigned_comparator[3]                = const_31bit_0[2];
   assign BUF_signed_comparator[3]                = const_31bit_0[2];
   assign BUF_unsigned_comparator[4]                = const_31bit_0[3];
   assign BUF_signed_comparator[4]                = const_31bit_0[3];
   assign BUF_unsigned_comparator[5]                = const_31bit_0[4];
   assign BUF_signed_comparator[5]                = const_31bit_0[4];
   assign BUF_unsigned_comparator[6]                = const_31bit_0[5];
   assign BUF_signed_comparator[6]                = const_31bit_0[5];
   assign BUF_unsigned_comparator[7]                = const_31bit_0[6];
   assign BUF_signed_comparator[7]                = const_31bit_0[6];
   assign BUF_unsigned_comparator[8]                = const_31bit_0[7];
   assign BUF_signed_comparator[8]                = const_31bit_0[7];
   assign BUF_unsigned_comparator[9]                = const_31bit_0[8];
   assign BUF_signed_comparator[9]                = const_31bit_0[8];
   assign BUF_unsigned_comparator[10]               = const_31bit_0[9];
   assign BUF_signed_comparator[10]               = const_31bit_0[9];
   assign BUF_unsigned_comparator[11]               = const_31bit_0[10];
   assign BUF_signed_comparator[11]               = const_31bit_0[10];
   assign BUF_unsigned_comparator[12]               = const_31bit_0[11];
   assign BUF_signed_comparator[12]               = const_31bit_0[11];
   assign BUF_unsigned_comparator[13]               = const_31bit_0[12];
   assign BUF_signed_comparator[13]               = const_31bit_0[12];
   assign BUF_unsigned_comparator[14]               = const_31bit_0[13];
   assign BUF_signed_comparator[14]               = const_31bit_0[13];
   assign BUF_unsigned_comparator[15]               = const_31bit_0[14];
   assign BUF_signed_comparator[15]               = const_31bit_0[14];
   assign BUF_unsigned_comparator[16]               = const_31bit_0[15];
   assign BUF_signed_comparator[16]               = const_31bit_0[15];
   assign BUF_unsigned_comparator[17]               = const_31bit_0[16];
   assign BUF_signed_comparator[17]               = const_31bit_0[16];
   assign BUF_unsigned_comparator[18]               = const_31bit_0[17];
   assign BUF_signed_comparator[18]               = const_31bit_0[17];
   assign BUF_unsigned_comparator[19]               = const_31bit_0[18];
   assign BUF_signed_comparator[19]               = const_31bit_0[18];
   assign BUF_unsigned_comparator[20]               = const_31bit_0[19];
   assign BUF_signed_comparator[20]               = const_31bit_0[19];
   assign BUF_unsigned_comparator[21]               = const_31bit_0[20];
   assign BUF_signed_comparator[21]               = const_31bit_0[20];
   assign BUF_unsigned_comparator[22]               = const_31bit_0[21];
   assign BUF_signed_comparator[22]               = const_31bit_0[21];
   assign BUF_unsigned_comparator[23]               = const_31bit_0[22];
   assign BUF_signed_comparator[23]               = const_31bit_0[22];
   assign BUF_unsigned_comparator[24]               = const_31bit_0[23];
   assign BUF_signed_comparator[24]               = const_31bit_0[23];
   assign BUF_unsigned_comparator[25]               = const_31bit_0[24];
   assign BUF_signed_comparator[25]               = const_31bit_0[24];
   assign BUF_unsigned_comparator[26]               = const_31bit_0[25];
   assign BUF_signed_comparator[26]               = const_31bit_0[25];
   assign BUF_unsigned_comparator[27]               = const_31bit_0[26];
   assign BUF_signed_comparator[27]               = const_31bit_0[26];
   assign BUF_unsigned_comparator[28]               = const_31bit_0[27];
   assign BUF_signed_comparator[28]               = const_31bit_0[27];
   assign BUF_unsigned_comparator[29]               = const_31bit_0[28];
   assign BUF_signed_comparator[29]               = const_31bit_0[28];
   assign BUF_unsigned_comparator[30]               = const_31bit_0[29];
   assign BUF_signed_comparator[30]               = const_31bit_0[29];
   assign BUF_unsigned_comparator[31]               = const_31bit_0[30];
   assign BUF_signed_comparator[31]               = const_31bit_0[30];

   /***************************************************************************
    ** Here all input connections are defined                                **
    ***************************************************************************/
   assign BUF_Y[31:0]             = Y;
   assign BUF_X[31:0]              = X;
   assign BUF_s[3:0]               = S;

   /***************************************************************************
    ** Here all output connections are defined                               **
    ***************************************************************************/
   assign UOF                                = BUF_UOF;
   assign Result2                            = BUF_result2[31:0];
   assign Result                             = BUF_result[31:0];
   assign Equal                              = BUF_equal;
   assign Overflow                           = BUF_OF;

   /***************************************************************************
    ** Here all in-lined components are defined                              **
    ***************************************************************************/
   assign const_32bit_0[31:0] = 32'd0;

   assign const_31bit_0[30:0] = 31'd0;


   /***************************************************************************
    ** Here all normal components are defined                                **
    ***************************************************************************/
   AND_GATE #(.BubblesMask(0))
      GATE_1 (.Input_1(BUF_Cout),
              .Input_2(s_LOGISIM_NET_24),
              .Result(s_LOGISIM_NET_32));

   AND_GATE_4_INPUTS #(.BubblesMask(9))
      GATE_2 (.Input_1(BUF_s[0]),
              .Input_2(BUF_s[1]),
              .Input_3(BUF_s[2]),
              .Input_4(BUF_s[3]),
              .Result(s_LOGISIM_NET_12));

   Multiplexer_bus_16 #(.NrOfBits(32))
      MUX_1 (.Enable(1'b1),
             .MuxIn_0(const_32bit_0[31:0]),
             .MuxIn_1(const_32bit_0[31:0]),
             .MuxIn_2(const_32bit_0[31:0]),
             .MuxIn_3(BUF_product_upper[31:0]),
             .MuxIn_4(BUF_remainder[31:0]),
             .MuxIn_5(const_32bit_0[31:0]),
             .MuxIn_6(const_32bit_0[31:0]),
             .MuxIn_7(const_32bit_0[31:0]),
             .MuxIn_8(const_32bit_0[31:0]),
             .MuxIn_9(const_32bit_0[31:0]),
			 .MuxIn_10(const_32bit_0[31:0]),
             .MuxIn_11(const_32bit_0[31:0]),
             .MuxIn_12(const_32bit_0[31:0]),
             .MuxIn_13(const_32bit_0[31:0]),
             .MuxIn_14(const_32bit_0[31:0]),
             .MuxIn_15(const_32bit_0[31:0]),
             .MuxOut(BUF_result2[31:0]),
             .Sel(BUF_s[3:0]));

   Shifter_32_bit #(.ShifterMode(0))//Logical Shift Left
      Shifter_1 (.DataA(BUF_X[31:0]),
                 .Result(BUF_logical_left[31:0]),
                 .ShiftAmount(BUF_Y[4:0]));

   AND_GATE_4_INPUTS #(.BubblesMask(10))
      GATE_3 (.Input_1(BUF_s[0]),
              .Input_2(BUF_s[1]),
              .Input_3(BUF_s[2]),
              .Input_4(BUF_s[3]),
              .Result(s_LOGISIM_NET_24));

   AND_GATE_BUS #(.BubblesMask(0),
                  .NrOfBits(32))
      GATE_4 (.Input_1(BUF_X[31:0]),
              .Input_2(BUF_Y[31:0]),
              .Result(BUF_and_32_bit[31:0]));

   XOR_GATE_BUS_ONEHOT #(.BubblesMask(0),
                         .NrOfBits(32))
      GATE_5 (.Input_1(BUF_X[31:0]),
              .Input_2(BUF_Y[31:0]),
              .Result(BUF_xor_32_bit[31:0]));

   OR_GATE #(.BubblesMask(0))
      GATE_6 (.Input_1(s_LOGISIM_NET_32),
              .Input_2(s_LOGISIM_NET_21),
              .Result(BUF_UOF));

   Comparator #(.NrOfBits(32),
                .TwosComplement(0))
      Comparator_1 (.A_EQ_B(BUF_equal),
                    .A_GT_B(),
                    .A_LT_B(BUF_unsigned_comparator[0]),
                    .DataA(BUF_X[31:0]),
                    .DataB(BUF_Y[31:0]));

   NOT_GATE_BUS #(.NrOfBits(32))
      GATE_7 (.Input_1(BUF_or_32_bit[31:0]),
              .Result(BUF_nor_32_bit[31:0]));

   Shifter_32_bit #(.ShifterMode(3))
      Shifter_2 (.DataA(BUF_X[31:0]),
                 .Result(BUF_arithmetic_right[31:0]),
                 .ShiftAmount(BUF_Y[4:0]));

   Multiplexer_bus_2 #(.NrOfBits(32))
      MUX_2 (.Enable(1'b1),
             .MuxIn_0(BUF_Y[31:0]),
             .MuxIn_1(s_LOGISIM_BUS_31[31:0]),
             .MuxOut(BUF_Y[31:0]),
             .Sel(BUF_s[1]));

   XOR_GATE_ONEHOT #(.BubblesMask(0))
      GATE_8 (.Input_1(BUF_xor_32_bit[31]),
              .Input_2(BUF_unsigned_comparator[0]),
              .Result(BUF_signed_comparator[0]));

   OR_GATE #(.BubblesMask(0))
      GATE_9 (.Input_1(s_LOGISIM_NET_24),
              .Input_2(s_LOGISIM_NET_12),
              .Result(s_LOGISIM_NET_28));

   Shifter_32_bit #(.ShifterMode(2))
      Shifter_3 (.DataA(BUF_X[31:0]),
                 .Result(BUF_logical_right[31:0]),
                 .ShiftAmount(BUF_Y[4:0]));

   Multiplexer_bus_16 #(.NrOfBits(32))
      MUX_3 (.Enable(1'b1),
             .MuxIn_0(BUF_logical_left[31:0]),
             .MuxIn_1(BUF_arithmetic_right[31:0]),
             .MuxIn_2(BUF_logical_right[31:0]),
             .MuxIn_3(BUF_product_lower[31:0]),
             .MuxIn_4(BUF_quotient[31:0]),
             .MuxIn_5(BUF_adder_result[31:0]),
             .MuxIn_6(BUF_adder_result[31:0]),
             .MuxIn_7(BUF_and_32_bit[31:0]),
             .MuxIn_8(BUF_or_32_bit[31:0]),
             .MuxIn_9(BUF_xor_32_bit[31:0]),
			 .MuxIn_10(BUF_nor_32_bit[31:0]),
             .MuxIn_11(BUF_signed_comparator[31:0]),
             .MuxIn_12(BUF_unsigned_comparator[31:0]),
             .MuxIn_13(const_32bit_0[31:0]),
             .MuxIn_14(const_32bit_0[31:0]),
             .MuxIn_15(const_32bit_0[31:0]),
             .MuxOut(BUF_result[31:0]),
             .Sel(BUF_s[3:0]));

   OR_GATE_BUS #(.BubblesMask(0),
                 .NrOfBits(32))
      GATE_10 (.Input_1(BUF_X[31:0]),
               .Input_2(BUF_Y[31:0]),
               .Result(BUF_or_32_bit[31:0]));

   AND_GATE #(.BubblesMask(0))
      GATE_11 (.Input_1(BUF_OF),
               .Input_2(s_LOGISIM_NET_28),
               .Result(BUF_OF));

   AND_GATE #(.BubblesMask(0))
      GATE_12 (.Input_1(s_LOGISIM_NET_17),
               .Input_2(s_LOGISIM_NET_12),
               .Result(s_LOGISIM_NET_21));

   Comparator #(.NrOfBits(32),
                .TwosComplement(0))
      Comparator_2 (.A_EQ_B(),
                    .A_GT_B(s_LOGISIM_NET_17),
                    .A_LT_B(),
                    .DataA(BUF_adder_result[31:0]),
                    .DataB(BUF_X[31:0]));

   NOT_GATE_BUS #(.NrOfBits(32))
      GATE_13 (.Input_1(BUF_Y[31:0]),
               .Result(s_LOGISIM_BUS_31[31:0]));


   /***************************************************************************
    ** Here all sub-circuits are defined                                     **
    ***************************************************************************/
   assign 
   empty      Divider (.Input_bus_1(BUF_X[31:0]),
                       .Input_bus_2(BUF_Y[31:0]),
                       .Output_bus_1(BUF_remainder[31:0]),
                       .Output_bus_2(BUF_quotient[31:0]));
	
   empty      mutiplier (.Input_bus_1(BUF_X[31:0]),
                         .Input_bus_2(BUF_Y[31:0]),
                         .Output_bus_1(BUF_product_upper[31:0]),
                         .Output_bus_2(BUF_product_lower[31:0]));

   Adder_32_bit      Adder_32_bit_1 (.Cin(BUF_s[1]),
                                     .Cout(BUF_Cout),
                                     .Overflow(BUF_OF),
                                     .S(BUF_adder_result[31:0]),
                                     .X(BUF_X[31:0]),
                                     .Y(BUF_Y[31:0]));



endmodule
