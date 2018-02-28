`timescale 1ns / 1ps

//
// [Conventions]
//     BTNU: ordinary output.
//     BTND: memory view.
//         SW[15:0] - memory address.
//     BTNL: PC view.
//     BTNR: statistics.
//         SW[1:0] 2'b00 : total cycles.
//         SW[1:0] 2'b01 : unconditional branch count.
//         SW[1:0] 2'b10 : conditional branch count.
//         SW[1:0] 2'b11 : conditional branch success count.


module DisplaySwitch(
    input clk,
    input BTNC,
    input BTNU,
    input BTND,
    input BTNL,
    input BTNR,
    input [15:0] SW,
    output wire [7:0] anodes,
    output wire [7:0] cathodes
);
    parameter DisplayOrdinary = 2'b00;
    parameter DisplayMemory = 2'b01;
    parameter DisplayPC = 2'b10;
    parameter DisplayStatistics = 2'b11;

    wire dividedClk400hz;
    wire dividedclk100hz;

    wire [31:0] totalCycles;
    wire [31:0] unconditionalBranchCount;
    wire [31:0] conditionalBranchCount;
    wire [31:0] conditionalBranchSuccessCount;

    reg [1:0] state;
    wire [31:0] ordinaryOutput;
    wire [31:0] memoryOutput;
    wire [31:0] PCOutput;
    wire [31:0] statisticsOutput;
    wire [31:0] outputNumber;

    ////////////////////////
    // Module definitions //
    ////////////////////////
    divide#(100000) timeDivide(.clk(clk), .clkout(dividedClk400hz));
    divide#(500) timeDivide2(.clk(clk), .clkout(dividedClk100hz));
    CPU mipsCPU(
        .clk(dividedClk100hz),
        .reset(BTNC),
        .addr_debug(SW[11:0]),
        .v_Syscall_out(ordinaryOutput),
        .v_PC(PCOutput),
        .v_memory_out(memoryOutput),
        .v_total_cycles(totalCycles),
        .v_jump_cycles(unconditionalBranchCount),
        .v_branch_cycles(conditionalBranchCount),
        .v_branch_sucess_cycles(conditionalBranchSuccessCount)
    );

    MUX4 statisticsSelect4(
        .data1({0, totalCycles}),
        .data2({0, unconditionalBranchCount}),
        .data3({0, conditionalBranchCount}),
        .data4({0, conditionalBranchSuccessCount}),
        .sel(SW[1:0]),
        .dataout(statisticsOutput)
    );

    MUX4 displaySelect4(
        .data1(ordinaryOutput),
        .data2(memoryOutput),
        .data3(PCOutput),
        .data4(statisticsOutput),
        .sel(state),
        .dataout(outputNumber)
    );

    SegmentDisplay segmentDisplay(
        .clk(dividedClk400hz),
        .reset(BTNC),
        .number(outputNumber),
        .anodes(anodes),
        .cathodes(cathodes)
    );
    always @(posedge clk) begin
    case({BTNC,BTNU,BTND,BTNL,BTNR})
        5'b10000 : state = DisplayOrdinary;
    
        5'b01000 : state = DisplayOrdinary;
    
        5'b00100 : state = DisplayMemory;
    
        5'b00010 : state = DisplayPC;
    
        5'b00001 : state = DisplayStatistics;
        default : state = DisplayOrdinary;
    endcase
    end
endmodule