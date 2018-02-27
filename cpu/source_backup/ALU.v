
module ALU( S,
            X,
            Y,
            Result,
            Result2,
            Equal,
            Overflow,
            UOF);
   input [3:0]S;
   input signed [31:0]X;
   input signed [31:0]Y;
   output [31:0]Result;
   output [31:0]Result2;
   output Equal;
   output Overflow;
   output UOF;
   
   wire[31:0] const_32bit_0;
   wire[30:0] const_31bit_0;
   assign const_32bit_0 = 32'd0;
   assign const_31bit_0 = 31'd0;
   
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
             .MuxIn_0(BUF_logical_left),
             .MuxIn_1(BUF_arithmetic_right),
             .MuxIn_2(BUF_logical_right),
             .MuxIn_3(BUF_product_lower),
             .MuxIn_4(BUF_quotient),
             .MuxIn_5(BUF_add_result),
             .MuxIn_6(BUF_sub_result),
             .MuxIn_7(BUF_and_32_bit),
             .MuxIn_8(BUF_or_32_bit),
             .MuxIn_9(BUF_xor_32_bit),
             .MuxIn_10(BUF_nor_32_bit),
             .MuxIn_11(BUF_signed_comparator),
             .MuxIn_12(BUF_unsigned_comparator),
             .MuxIn_13(const_32bit_0),
             .MuxIn_14(const_32bit_0),
             .MuxIn_15(const_32bit_0),
             .MuxOut(Result),
             .Sel(S));

   Multiplexer_16 #(.NrOfBits(32))
      MUX_Result2 (.Enable(1'b1),
             .MuxIn_0(const_32bit_0),
             .MuxIn_1(const_32bit_0),
             .MuxIn_2(const_32bit_0),
             .MuxIn_3(BUF_product_upper),
             .MuxIn_4(BUF_remainder),
             .MuxIn_5(const_32bit_0),
             .MuxIn_6(const_32bit_0),
             .MuxIn_7(const_32bit_0),
             .MuxIn_8(const_32bit_0),
             .MuxIn_9(const_32bit_0),
             .MuxIn_10(const_32bit_0),
             .MuxIn_11(const_32bit_0),
             .MuxIn_12(const_32bit_0),
             .MuxIn_13(const_32bit_0),
             .MuxIn_14(const_32bit_0),
             .MuxIn_15(const_32bit_0),
             .MuxOut(Result2),
             .Sel(S));

   assign BUF_logical_left = X << Y[4:0];
   assign BUF_arithmetic_right = X >>> Y[4:0];
   assign BUF_logical_right = X >> Y[4:0];
   assign {BUF_product_upper,BUF_product_lower} = X * Y;
   assign BUF_quotient = X / Y;
   assign BUF_remainder = X % Y;
   assign BUF_add_result = X + Y;
   assign BUF_sub_result = X - Y;
   assign BUF_and_32_bit = X & Y;
   assign BUF_or_32_bit = X | Y;
   assign BUF_xor_32_bit = X ^ Y;
   assign BUF_nor_32_bit = ~(X | Y);
   assign BUF_signed_comparator = ($signed(X) < $signed(Y));
   assign BUF_unsigned_comparator = ($unsigned(X) < $unsigned(Y));
   assign Equal = (X == Y);
   assign Overflow = 0;//暂时不管
   assign UOF = 0;//暂时不管
   
endmodule
