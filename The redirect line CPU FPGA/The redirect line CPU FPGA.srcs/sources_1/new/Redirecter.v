module Redirecter( Control_signals,
                   EX_Data,
                   EX_OP,
                   EX_RF_WE,
                   EX_rW,
                   MEM_Data,
                   MEM_RF_WE,
                   MEM_rW,
                   rA,
                   rB,
                   Load_Use,
                   redirect_RF_A,
                   redirect_RF_B,
                   redirected_RF_A,
                   redirected_RF_B);
   input[31:0]  Control_signals;
   input[31:0]  EX_Data;
   input[5:0]  EX_OP;
   input  EX_RF_WE;
   input[4:0]  EX_rW;
   input[31:0]  MEM_Data;
   input  MEM_RF_WE;
   input[4:0]  MEM_rW;
   input[4:0]  rA;
   input[4:0]  rB;
   output Load_Use;
   output redirect_RF_A;
   output redirect_RF_B;
   output[31:0] redirected_RF_A;
   output[31:0] redirected_RF_B;

   wire[4:0] s_LOGISIM_BUS_10;
   wire[4:0] s_LOGISIM_BUS_19;
   wire[4:0] s_LOGISIM_BUS_2;
   wire[4:0] s_LOGISIM_BUS_20;
   wire[4:0] s_LOGISIM_BUS_25;
   wire[31:0] s_LOGISIM_BUS_26;
   wire[5:0] s_LOGISIM_BUS_28;
   wire[31:0] s_LOGISIM_BUS_29;
   wire[4:0] s_LOGISIM_BUS_44;
   wire[4:0] s_LOGISIM_BUS_45;
   wire[31:0] s_LOGISIM_BUS_52;
   wire[4:0] s_LOGISIM_BUS_56;
   wire[5:0] s_LOGISIM_BUS_59;
   wire[31:0] s_LOGISIM_BUS_6;
   wire[5:0] s_LOGISIM_BUS_65;
   wire[4:0] s_LOGISIM_BUS_68;
   wire[5:0] s_LOGISIM_BUS_72;
   wire[4:0] s_LOGISIM_BUS_8;
   wire[31:0] s_LOGISIM_BUS_9;
   wire s_LOGISIM_NET_0;
   wire s_LOGISIM_NET_1;
   wire s_LOGISIM_NET_11;
   wire s_LOGISIM_NET_12;
   wire s_LOGISIM_NET_13;
   wire s_LOGISIM_NET_14;
   wire s_LOGISIM_NET_15;
   wire s_LOGISIM_NET_16;
   wire s_LOGISIM_NET_17;
   wire s_LOGISIM_NET_18;
   wire s_LOGISIM_NET_21;
   wire s_LOGISIM_NET_22;
   wire s_LOGISIM_NET_23;
   wire s_LOGISIM_NET_24;
   wire s_LOGISIM_NET_27;
   wire s_LOGISIM_NET_3;
   wire s_LOGISIM_NET_30;
   wire s_LOGISIM_NET_31;
   wire s_LOGISIM_NET_33;
   wire s_LOGISIM_NET_34;
   wire s_LOGISIM_NET_35;
   wire s_LOGISIM_NET_36;
   wire s_LOGISIM_NET_37;
   wire s_LOGISIM_NET_38;
   wire s_LOGISIM_NET_39;
   wire s_LOGISIM_NET_4;
   wire s_LOGISIM_NET_40;
   wire s_LOGISIM_NET_41;
   wire s_LOGISIM_NET_42;
   wire s_LOGISIM_NET_43;
   wire s_LOGISIM_NET_46;
   wire s_LOGISIM_NET_47;
   wire s_LOGISIM_NET_48;
   wire s_LOGISIM_NET_49;
   wire s_LOGISIM_NET_5;
   wire s_LOGISIM_NET_50;
   wire s_LOGISIM_NET_51;
   wire s_LOGISIM_NET_53;
   wire s_LOGISIM_NET_54;
   wire s_LOGISIM_NET_55;
   wire s_LOGISIM_NET_58;
   wire s_LOGISIM_NET_60;
   wire s_LOGISIM_NET_61;
   wire s_LOGISIM_NET_62;
   wire s_LOGISIM_NET_63;
   wire s_LOGISIM_NET_64;
   wire s_LOGISIM_NET_66;
   wire s_LOGISIM_NET_67;
   wire s_LOGISIM_NET_69;
   wire s_LOGISIM_NET_7;
   wire s_LOGISIM_NET_70;


   /***************************************************************************
    ** Here all input connections are defined                                **
    ***************************************************************************/
   assign s_LOGISIM_NET_41                   = EX_RF_WE;
   assign s_LOGISIM_BUS_10[4:0]              = EX_rW;
   assign s_LOGISIM_BUS_26[31:0]             = MEM_Data;
   assign s_LOGISIM_NET_16                   = MEM_RF_WE;
   assign s_LOGISIM_BUS_2[4:0]               = rA;
   assign s_LOGISIM_BUS_8[4:0]               = MEM_rW;
   assign s_LOGISIM_BUS_25[4:0]              = rB;
   assign s_LOGISIM_BUS_9[31:0]              = Control_signals;
   assign s_LOGISIM_BUS_28[5:0]              = EX_OP;
   assign s_LOGISIM_BUS_6[31:0]              = EX_Data;

   /***************************************************************************
    ** Here all output connections are defined                               **
    ***************************************************************************/
   assign redirected_RF_B                    = s_LOGISIM_BUS_29[31:0];
   assign Load_Use                           = s_LOGISIM_NET_70;
   assign redirect_RF_A                      = s_LOGISIM_NET_62;
   assign redirected_RF_A                    = s_LOGISIM_BUS_52[31:0];
   assign redirect_RF_B                      = s_LOGISIM_NET_11;

   /***************************************************************************
    ** Here all in-lined components are defined                              **
    ***************************************************************************/
   assign s_LOGISIM_BUS_65[5:0] = 6'd35;

   assign s_LOGISIM_BUS_72[5:0] = 6'd43;

   assign s_LOGISIM_BUS_44[4:0] = 5'd4;

   assign s_LOGISIM_BUS_45[4:0] = 5'd0;

   assign s_LOGISIM_BUS_20[4:0] = 5'd2;

   assign s_LOGISIM_BUS_68[4:0] = 5'd2;

   assign s_LOGISIM_BUS_56[4:0] = 5'd4;

   assign s_LOGISIM_BUS_19[4:0] = 5'd0;

   assign s_LOGISIM_BUS_59[5:0] = 6'd33;


   /***************************************************************************
    ** Here all normal components are defined                                **
    ***************************************************************************/
   AND_GATE #(.BubblesMask(0))
      GATE_1 (.Input_1(s_LOGISIM_NET_43),
              .Input_2(s_LOGISIM_BUS_9[5]),
              .Result(s_LOGISIM_NET_38));

   AND_GATE #(.BubblesMask(0))
      GATE_2 (.Input_1(s_LOGISIM_NET_34),
              .Input_2(s_LOGISIM_NET_60),
              .Result(s_LOGISIM_NET_11));

   OR_GATE #(.BubblesMask(0))
      GATE_3 (.Input_1(s_LOGISIM_NET_4),
              .Input_2(s_LOGISIM_NET_38),
              .Result(s_LOGISIM_NET_15));

   AND_GATE #(.BubblesMask(0))
      GATE_4 (.Input_1(s_LOGISIM_NET_37),
              .Input_2(s_LOGISIM_NET_31),
              .Result(s_LOGISIM_NET_48));

   AND_GATE #(.BubblesMask(0))
      GATE_5 (.Input_1(s_LOGISIM_NET_36),
              .Input_2(s_LOGISIM_NET_34),
              .Result(s_LOGISIM_NET_62));

   OR_GATE #(.BubblesMask(0))
      GATE_6 (.Input_1(s_LOGISIM_NET_35),
              .Input_2(s_LOGISIM_NET_1),
              .Result(s_LOGISIM_NET_46));

   OR_GATE #(.BubblesMask(0))
      GATE_7 (.Input_1(s_LOGISIM_NET_0),
              .Input_2(s_LOGISIM_NET_37),
              .Result(s_LOGISIM_NET_34));

   OR_GATE #(.BubblesMask(0))
      GATE_8 (.Input_1(s_LOGISIM_NET_48),
              .Input_2(s_LOGISIM_NET_13),
              .Result(s_LOGISIM_NET_60));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_1 (.A_EQ_B(s_LOGISIM_NET_54),
                    .A_GT_B(),
                    .A_LT_B(),
                    .DataA(s_LOGISIM_BUS_10[4:0]),
                    .DataB(s_LOGISIM_BUS_2[4:0]));

   AND_GATE #(.BubblesMask(0))
      GATE_9 (.Input_1(s_LOGISIM_NET_67),
              .Input_2(s_LOGISIM_BUS_9[8]),
              .Result(s_LOGISIM_NET_27));

   AND_GATE #(.BubblesMask(0))
      GATE_10 (.Input_1(s_LOGISIM_NET_40),
               .Input_2(s_LOGISIM_NET_5),
               .Result(s_LOGISIM_NET_70));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_2 (.A_EQ_B(s_LOGISIM_NET_67),
                    .A_GT_B(),
                    .A_LT_B(),
                    .DataA(s_LOGISIM_BUS_10[4:0]),
                    .DataB(s_LOGISIM_BUS_44[4:0]));

   AND_GATE #(.BubblesMask(0))
      GATE_11 (.Input_1(s_LOGISIM_NET_23),
               .Input_2(s_LOGISIM_NET_37),
               .Result(s_LOGISIM_NET_12));

   AND_GATE_3_INPUTS #(.BubblesMask(0))
      GATE_12 (.Input_1(s_LOGISIM_NET_47),
               .Input_2(s_LOGISIM_NET_30),
               .Input_3(s_LOGISIM_NET_41),
               .Result(s_LOGISIM_NET_51));

   NOT_GATE      GATE_13 (.Input_1(s_LOGISIM_NET_58),
                          .Result(s_LOGISIM_NET_49));

   Multiplexer_bus_2 #(.NrOfBits(32))
      MUX_1 (.Enable(1'b1),
             .MuxIn_0(s_LOGISIM_BUS_26[31:0]),
             .MuxIn_1(s_LOGISIM_BUS_6[31:0]),
             .MuxOut(s_LOGISIM_BUS_29[31:0]),
             .Sel(s_LOGISIM_NET_13));

   OR_GATE #(.BubblesMask(0))
      GATE_14 (.Input_1(s_LOGISIM_NET_1),
               .Input_2(s_LOGISIM_NET_27),
               .Result(s_LOGISIM_NET_61));

   AND_GATE #(.BubblesMask(0))
      GATE_15 (.Input_1(s_LOGISIM_NET_18),
               .Input_2(s_LOGISIM_BUS_9[8]),
               .Result(s_LOGISIM_NET_3));

   Comparator #(.NrOfBits(6),
                .TwosComplement(1))
      Comparator_3 (.A_EQ_B(s_LOGISIM_NET_53),
                    .A_GT_B(),
                    .A_LT_B(),
                    .DataA(s_LOGISIM_BUS_28[5:0]),
                    .DataB(s_LOGISIM_BUS_59[5:0]));

   OR_GATE #(.BubblesMask(0))
      GATE_16 (.Input_1(s_LOGISIM_NET_4),
               .Input_2(s_LOGISIM_NET_14),
               .Result(s_LOGISIM_NET_23));

   AND_GATE #(.BubblesMask(0))
      GATE_17 (.Input_1(s_LOGISIM_NET_16),
               .Input_2(s_LOGISIM_NET_7),
               .Result(s_LOGISIM_NET_22));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_4 (.A_EQ_B(s_LOGISIM_NET_55),
                    .A_GT_B(),
                    .A_LT_B(),
                    .DataA(s_LOGISIM_BUS_8[4:0]),
                    .DataB(s_LOGISIM_BUS_20[4:0]));

   OR_GATE #(.BubblesMask(0))
      GATE_18 (.Input_1(s_LOGISIM_NET_27),
               .Input_2(s_LOGISIM_NET_24),
               .Result(s_LOGISIM_NET_21));

   OR_GATE #(.BubblesMask(0))
      GATE_19 (.Input_1(s_LOGISIM_NET_63),
               .Input_2(s_LOGISIM_NET_22),
               .Result(s_LOGISIM_NET_37));

   AND_GATE_3_INPUTS #(.BubblesMask(0))
      GATE_20 (.Input_1(s_LOGISIM_NET_15),
               .Input_2(s_LOGISIM_NET_49),
               .Input_3(s_LOGISIM_NET_16),
               .Result(s_LOGISIM_NET_63));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_5 (.A_EQ_B(s_LOGISIM_NET_50),
                    .A_GT_B(),
                    .A_LT_B(),
                    .DataA(s_LOGISIM_BUS_10[4:0]),
                    .DataB(s_LOGISIM_BUS_19[4:0]));

   AND_GATE #(.BubblesMask(0))
      GATE_21 (.Input_1(s_LOGISIM_NET_55),
               .Input_2(s_LOGISIM_BUS_9[8]),
               .Result(s_LOGISIM_NET_14));

   Multiplexer_bus_2 #(.NrOfBits(32))
      MUX_2 (.Enable(1'b1),
             .MuxIn_0(s_LOGISIM_BUS_26[31:0]),
             .MuxIn_1(s_LOGISIM_BUS_6[31:0]),
             .MuxOut(s_LOGISIM_BUS_52[31:0]),
             .Sel(s_LOGISIM_NET_33));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_6 (.A_EQ_B(s_LOGISIM_NET_17),
                    .A_GT_B(),
                    .A_LT_B(),
                    .DataA(s_LOGISIM_BUS_10[4:0]),
                    .DataB(s_LOGISIM_BUS_25[4:0]));

   OR_GATE_3_INPUTS #(.BubblesMask(0))
      GATE_22 (.Input_1(s_LOGISIM_NET_64),
               .Input_2(s_LOGISIM_NET_69),
               .Input_3(s_LOGISIM_NET_53),
               .Result(s_LOGISIM_NET_5));

   Comparator #(.NrOfBits(6),
                .TwosComplement(1))
      Comparator_7 (.A_EQ_B(s_LOGISIM_NET_69),
                    .A_GT_B(),
                    .A_LT_B(),
                    .DataA(s_LOGISIM_BUS_28[5:0]),
                    .DataB(s_LOGISIM_BUS_65[5:0]));

   NOT_GATE      GATE_23 (.Input_1(s_LOGISIM_NET_50),
                          .Result(s_LOGISIM_NET_30));

   OR_GATE #(.BubblesMask(0))
      GATE_24 (.Input_1(s_LOGISIM_NET_51),
               .Input_2(s_LOGISIM_NET_39),
               .Result(s_LOGISIM_NET_40));

   AND_GATE #(.BubblesMask(0))
      GATE_25 (.Input_1(s_LOGISIM_NET_66),
               .Input_2(s_LOGISIM_BUS_9[6]),
               .Result(s_LOGISIM_NET_4));

   AND_GATE #(.BubblesMask(0))
      GATE_26 (.Input_1(s_LOGISIM_NET_46),
               .Input_2(s_LOGISIM_NET_40),
               .Result(s_LOGISIM_NET_33));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_8 (.A_EQ_B(s_LOGISIM_NET_42),
                    .A_GT_B(),
                    .A_LT_B(),
                    .DataA(s_LOGISIM_BUS_10[4:0]),
                    .DataB(s_LOGISIM_BUS_68[4:0]));

   OR_GATE #(.BubblesMask(0))
      GATE_27 (.Input_1(s_LOGISIM_NET_35),
               .Input_2(s_LOGISIM_NET_24),
               .Result(s_LOGISIM_NET_47));

   AND_GATE #(.BubblesMask(1))
      GATE_28 (.Input_1(s_LOGISIM_NET_5),
               .Input_2(s_LOGISIM_NET_40),
               .Result(s_LOGISIM_NET_0));

   OR_GATE #(.BubblesMask(0))
      GATE_29 (.Input_1(s_LOGISIM_NET_14),
               .Input_2(s_LOGISIM_NET_3),
               .Result(s_LOGISIM_NET_7));

   AND_GATE #(.BubblesMask(0))
      GATE_30 (.Input_1(s_LOGISIM_NET_17),
               .Input_2(s_LOGISIM_BUS_9[5]),
               .Result(s_LOGISIM_NET_24));

   AND_GATE #(.BubblesMask(0))
      GATE_31 (.Input_1(s_LOGISIM_NET_41),
               .Input_2(s_LOGISIM_NET_61),
               .Result(s_LOGISIM_NET_39));

   AND_GATE #(.BubblesMask(0))
      GATE_32 (.Input_1(s_LOGISIM_NET_40),
               .Input_2(s_LOGISIM_NET_21),
               .Result(s_LOGISIM_NET_13));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_9 (.A_EQ_B(s_LOGISIM_NET_43),
                    .A_GT_B(),
                    .A_LT_B(),
                    .DataA(s_LOGISIM_BUS_8[4:0]),
                    .DataB(s_LOGISIM_BUS_25[4:0]));

   AND_GATE #(.BubblesMask(0))
      GATE_33 (.Input_1(s_LOGISIM_NET_42),
               .Input_2(s_LOGISIM_BUS_9[8]),
               .Result(s_LOGISIM_NET_1));

   AND_GATE #(.BubblesMask(0))
      GATE_34 (.Input_1(s_LOGISIM_NET_54),
               .Input_2(s_LOGISIM_BUS_9[6]),
               .Result(s_LOGISIM_NET_35));

   Comparator #(.NrOfBits(6),
                .TwosComplement(1))
      Comparator_10 (.A_EQ_B(s_LOGISIM_NET_64),
                     .A_GT_B(),
                     .A_LT_B(),
                     .DataA(s_LOGISIM_BUS_28[5:0]),
                     .DataB(s_LOGISIM_BUS_72[5:0]));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_11 (.A_EQ_B(s_LOGISIM_NET_18),
                     .A_GT_B(),
                     .A_LT_B(),
                     .DataA(s_LOGISIM_BUS_8[4:0]),
                     .DataB(s_LOGISIM_BUS_56[4:0]));

   OR_GATE #(.BubblesMask(0))
      GATE_35 (.Input_1(s_LOGISIM_NET_33),
               .Input_2(s_LOGISIM_NET_12),
               .Result(s_LOGISIM_NET_36));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_12 (.A_EQ_B(s_LOGISIM_NET_66),
                     .A_GT_B(),
                     .A_LT_B(),
                     .DataA(s_LOGISIM_BUS_8[4:0]),
                     .DataB(s_LOGISIM_BUS_2[4:0]));

   OR_GATE #(.BubblesMask(0))
      GATE_36 (.Input_1(s_LOGISIM_NET_3),
               .Input_2(s_LOGISIM_NET_38),
               .Result(s_LOGISIM_NET_31));

   Comparator #(.NrOfBits(5),
                .TwosComplement(1))
      Comparator_13 (.A_EQ_B(s_LOGISIM_NET_58),
                     .A_GT_B(),
                     .A_LT_B(),
                     .DataA(s_LOGISIM_BUS_8[4:0]),
                     .DataB(s_LOGISIM_BUS_45[4:0]));



endmodule
