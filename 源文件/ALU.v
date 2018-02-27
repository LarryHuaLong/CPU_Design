
module ALU( S,
            X,
            Y,
            Result,
            Result2,
            Equal,
            Overflow,
            UOF);
   input[3:0]  S;
   input[31:0]  X;
   input[31:0]  Y;
   output Result;
   output Result2;
   output Equal;
   output Overflow;
   output UOF;
   
   wire[31:0] const_32bit_0;
   wire[30:0] const_31bit_0;
   assign const_32bit_0[31:0] = 32'd0;
   assign const_31bit_0[30:0] = 31'd0;
   
   wire[31:0] BUF_logical_left;
   wire[31:0] BUF_arithmetic_right;
   wire[31:0] BUF_logical_right;
   wire[31:0] BUF_product_lower;
   wire[31:0] BUF_product_upper;
   wire[31:0] BUF_quotient;
   wire[31:0] BUF_remainder;
   wire[31:0] BUF_add_result;
   wire[31:0] BUF_sub_result;
   wire[31:0] BUF_and_32_bit;
   wire[31:0] BUF_or_32_bit;
   wire[31:0] BUF_xor_32_bit;
   wire[31:0] BUF_nor_32_bit;
   wire[31:0] BUF_signed_comparator;
   wire[31:0] BUF_unsigned_comparator;
   
   Multiplexer_16 #(.NrOfBits(32))
      MUX_Result (.Enable(1'b1),
             .MuxIn_0(BUF_logical_left[31:0]),
             .MuxIn_1(BUF_arithmetic_right[31:0]),
             .MuxIn_2(BUF_logical_right[31:0]),
             .MuxIn_3(BUF_product_lower[31:0]),
             .MuxIn_4(BUF_quotient[31:0]),
             .MuxIn_5(BUF_add_result[31:0]),
             .MuxIn_6(BUF_sub_result[31:0]),
             .MuxIn_7(BUF_and_32_bit[31:0]),
             .MuxIn_8(BUF_or_32_bit[31:0]),
             .MuxIn_9(BUF_xor_32_bit[31:0]),
             .MuxIn_10(BUF_nor_32_bit[31:0]),
             .MuxIn_11(BUF_signed_comparator[31:0]),
             .MuxIn_12(BUF_unsigned_comparator[31:0]),
             .MuxIn_13(const_32bit_0[31:0]),
             .MuxIn_14(const_32bit_0[31:0]),
             .MuxIn_15(const_32bit_0[31:0]),
             .MuxOut(Result[31:0]),
             .Sel(S[3:0]));

   Multiplexer_16 #(.NrOfBits(32))
      MUX_Result2 (.Enable(1'b1),
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
             .MuxOut(Result2[31:0]),
             .Sel(S[3:0]));

   assign BUF_logical_left = X << Y[4:0];
   assign BUF_arithmetic_right = X >>> Y[4:0];
   assign BUF_logical_right = X >> Y[4:0];
   assign {BUF_product_upper,BUF_product_lower} = BUF_X * BUF_Y;
   assign BUF_quotient = BUF_X / BUF_Y;
   assign BUF_remainder = BUF_X % BUF_Y;
   assign BUF_add_result = X + Y;
   assign BUF_sub_result = X - Y;
   assign BUF_and_32_bit = X & Y;
   assign BUF_or_32_bit = X | Y;
   assign BUF_xor_32_bit = X ^ Y;
   assign BUF_nor_32_bit = ~(X | Y);
   assign BUF_signed_comparator = ($signed(DataA) > $signed(DataB));
   assign BUF_unsigned_comparator = ($unsigned(X) > $unsigned(Y));
   assign Equal = (X == Y);
   assign Overflow = 0;//暂时不管
   assign UOF = 0;//暂时不管
   
endmodule
